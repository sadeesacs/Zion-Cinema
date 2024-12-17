<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="DAO.BillingHelperDAO " %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Db.dbcon" %>
<%@ page import="java.sql.*" %>

<%
    session = request.getSession(false);
    Object userIdObj = session.getAttribute("UserID");
    double totalFoodPrice = 0;
    double totalTicketPrice = 0;
    double tax = 0;
    double totalAmount = 0;

    if (userIdObj != null) {
        int userId = Integer.parseInt(userIdObj.toString());
        try {
            double[] totals = BillingHelperDAO.calculateTotals(userId);
            totalFoodPrice = totals[0];
            totalTicketPrice = totals[1];
            tax = totals[2];
            totalAmount = totals[3];
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<%
    if (userIdObj == null) {
        out.println("<p>No user session found. Please log in.</p>");
        return;
    }
    // Retrieve UserID from the session
    Integer userID = (Integer) session.getAttribute("UserID");
    System.out.println("UserID from session: " + userID);

    String movieName = "";
    String movieDate = "";
    String movieTime = "";
    String seatInfo = "";
    String userName = "";
    String userPhone = "";
    String userEmail = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // connection from Dbcon
        conn = dbcon.connect();

        // Movie Details
        String queryMovie = "SELECT m.Movie_Name, st.Date, st.Show_Time "
                + "FROM temporarymovies tm "
                + "JOIN movies m ON tm.Movie_ID = m.Movie_ID "
                + "JOIN showtime st ON tm.Showtime_ID = st.ShowtimeID "
                + "WHERE tm.UserID = ?";
        pstmt = conn.prepareStatement(queryMovie);
        pstmt.setInt(1, userID);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            movieName = rs.getString("Movie_Name");
            movieDate = rs.getDate("Date").toString();
            movieTime = rs.getTime("Show_Time").toString();
        }
        rs.close();
        pstmt.close();

        // Seat Information
        String querySeats = "SELECT GROUP_CONCAT(s.SeatNumber SEPARATOR ', ') AS SeatInfo "
                + "FROM temporaryseats ts "
                + "JOIN seat s ON ts.SeatID = s.SeatID "
                + "WHERE ts.UserID = ?";
        pstmt = conn.prepareStatement(querySeats);
        pstmt.setInt(1, userID); // Set the user ID
        rs = pstmt.executeQuery();

        if (rs.next()) {
            seatInfo = rs.getString("SeatInfo");
        }
        rs.close();
        pstmt.close();

        // User Information
        String queryUser = "SELECT CONCAT(FirstName, ' ', LastName) AS UserName, PhoneNumber, Email "
                + "FROM user "
                + "WHERE UserID = ?";
        pstmt = conn.prepareStatement(queryUser);
        pstmt.setInt(1, userID);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            userName = rs.getString("UserName");
            userPhone = rs.getString("PhoneNumber");
            userEmail = rs.getString("Email");
        } else {
            System.out.println("No user details found for UserID: " + userID);
            userName = "Unknown User";
            userPhone = "N/A";
            userEmail = "N/A";
        }
    } catch (Exception e) {
        e.printStackTrace();
        userName = "Error";
        userPhone = "Error";
        userEmail = "Error";
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

%>






<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirmation Page</title>

        <link rel="stylesheet" href="StyleSheet4.css" />

        <!-- Header -->
    <div class="header-container">

        <!--Zion Cinema logo-->
        <img src="images/icons/logo.png">
        <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

        <!--Navigation Bar-->
        <div class="nav">
            <a href="HomePageServlet">Home</a>
            <span><a href="MovieListingServlet">Movies</a></span>
            <a href="AboutUs.jsp">About us</a>
            <a href="ContactUs.jsp">Contact</a>
            <a href="FAQ.jsp">FAQ</a>
        </div>

        <!-- Header Buttons -->
        <a href="MovieListingServlet" class="but-buytickets">
            <div>Buy Tickets</div>
        </a>
        <a href="UserLogin.jsp" class="but-login">
            <div>Login</div>
        </a>
    </div>
    <div class="header-line"></div>


    <!-- Progress Bar -->
    <div class="progress-bar">
        <!-- Completed Step -->
        <div class="step completed">
            <span>Select Seats</span>
            <div class="circle"></div>

        </div>
        <!-- Active Step -->
        <div class="step completed">
            <span>Order Food</span>
            <div class="line" style="background-color: #F5C51B;"></div>
            <div class="circle"></div>

        </div>
        <!-- Inactive Steps -->
        <div class="step completed">
            <span>Payment</span>
            <div class="line"></div>
            <div class="circle"></div>

        </div>
        <div class="step active">
            <span>Confirm</span>
            <div class="line"></div>
            <div class="circle"></div>
        </div>
    </div>

    <br>

    <div class="Thank-you">
        <h1>Thank you for your purchase !</h1>
        <div class="divider"></div>

        <br><br>

        <div class="Movie-details">
            <!-- Movie details -->
            <p>Movie Details</p>
            <div class="divider"></div>

            <div class="movie-details">
                <div class="detail">
                    <span class="label">Movie Name</span>
                    <span class="value" style="font-size:21px">: <%= movieName%></span>
                </div>
                <div class="detail">
                    <span class="label">Movie Date</span>
                    <span class="value" style="font-size:21px">: <%= movieDate%></span>
                </div>
                <div class="detail">
                    <span class="label">Movie Time</span>
                    <span class="value" style="font-size:21px">: <%= movieTime%></span>
                </div>
                <div class="detail">
                    <span class="label">Seat Info</span>
                    <span class="value" style="font-size:21px">: <%= seatInfo%></span>
                </div>
            </div>


            <div class="billing-details">
                <!-- Billing details -->
                <p>Billing Details</p>
                <div class="divider"></div>

                <div class="Billing-details">
                    <div class="detail">
                        <span class="label">Name</span>
                        <span class="value" style="font-size:21px">: <%= userName%></span>
                    </div>
                    <div class="detail">
                        <span class="label">Phone number</span>
                        <span class="value" style="font-size:21px">: <%= userPhone%></span>
                    </div>
                    <div class="detail">
                        <span class="label">Email Address</span>
                        <span class="value" style="font-size:21px">: <%= userEmail%></span>
                    </div>
                </div>

                <form action="ConfirmPurchaseServlet" method="post">
                    <%
                        session.setAttribute("movieName", movieName);
                        session.setAttribute("movieDate", movieDate);
                        session.setAttribute("movieTime", movieTime);
                        session.setAttribute("seatInfo", seatInfo);
                        session.setAttribute("totalAmount", totalAmount);
                        session.setAttribute("userEmail", userEmail);
                    %>
                    <button type="submit" class="continue-btn">Continue</button>
                </form>

                <!--summary table-->
                <div class="purchase-summary-container">
                    <div class="purchase-summary">
                        <h2>Purchase Summary</h2>
                        <hr>
                        <div class="summary-header">
                            <div>

                            </div>

                        </div>
                        <div class="summary-header">
                            <div>

                            </div>

                        </div>

                        <h3>Tickets</h3>
                        <div class="summary-items">
                            <p>Total Ticket Price:<span><%=totalTicketPrice%></span></p>
                        </div>

                        <h3>Food and Beverages</h3>
                        <div class="summary-items1">
                            <p>Total Food Price:<span><%=totalFoodPrice%></span></p>
                        </div>
                        <hr>
                        <div class="summary-totals">
                            <p>VAT (3%):<span><%=tax%></span></p>
                        </div>
                        <hr>
                        <div class="summary-total-final">

                            <strong style="color: white;">Total Amount:</strong>
                            <strong><span style="font-size: 1.5rem;"><%=totalAmount%></span></strong>

                        </div>
                        <hr>
                    </div>
                </div>

                <!--Footer-->
                <footer class="footer-container">
                    <div class="footer-column">
                        <h2>Zion Cinema</h2>
                        <pre>
                    Experience premium entertainment with advanced screens,
                    immersive sound,and comfortable seating. Enjoy the latest
                    blockbusters and timeless classics like never before!
                        </pre>
                        <div class="social-icons">
                            <a href="https://web.facebook.com"><img src="images/icons/fbicon.png"></a>
                            <a href="https://www.instagram.com/"><img src="images/icons/instaicon.png"></a>
                            <a href="https://x.com"><img src="images/icons/xicon.png"></a>
                            <a href="https://www.tiktok.com"><img src="images/icons/tiktokicon.png"></a>
                        </div>
                    </div>

                    <div class="footer-column">
                        <h3>Quick Links</h3>
                        <div class="quick-links-container">
                            <ul class="quick-links">
                                <li><a href="HomePageServlet">Home</a></li>
                                <li><a href="MovieListingServlet">Buy Tickets</a></li>
                                <li><a href="MovieListingServlet">Movies</a></li>
                                <li><a href="AboutUs.jsp">About us</a></li>
                                <li><a href="ContactUs.jsp">Contact</a></li>
                            </ul>
                            <ul class="quick-links">
                                <li><a href="Cancellation.jsp">Cancellations</a></li>
                                <li><a href="UserAccount.jsp">My Account</a></li>
                                <li><a href="UserLogin.jsp">Login</a></li>
                                <li><a href="UserRegistration.jsp">Signup</a></li>
                                <li><a href="FAQ.jsp">FAQ</a></li>
                            </ul>
                        </div>
                    </div>


                    <div class="footer-column">
                        <h3 style="margin-left: 3px;">Newsletter Subscription</h3>
                        <form class="newsletter-form">
                            <input type="email" placeholder="Enter Your Email">
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </footer>

                </html>