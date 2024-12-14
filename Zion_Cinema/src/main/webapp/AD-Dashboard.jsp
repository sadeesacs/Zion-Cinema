<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.MovieDAO" %>
<%@ page import="DAO.ShowtimeDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="StyleSheet10.css" />
    
</head>
    <body>
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.html">Zion Cinema</a></div>
                <div class="search-bar">
                    <span>Search here.....</span>
                </div>
                <div class="AD-username">Emma Watson</div>
                <div class="word-admin">Admin</div>
                <div class="user-icon"></div>
                <img src="images/icons/notificationicon.png" class="notification-icon">
                <img src="images/icons/messagesicon.png" class="message-icon">
            </div>
        </header>

        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashboard.jsp">
                    <li class="nav-item active">
                        <img src="images/icons/Dashboardicon.png">
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png">
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Foodicon.png">
                        <span>Food Menu</span>
                    </li>
                </a>
                <a href="AD-Transactions.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Billicon.png">
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Inquiryicon.png">
                        <span>Customer Inquiries</span>
                    </li>
                </a>
                <a href="AD-Customers.jsp">
                    <li class="nav-item">
                        <img src="images/icons/customericon.png">
                        <span>Customers</span>
                    </li>
                </a>
                <li class="nav-item">
                    <img src="images/icons/Settingicon.png">
                    <span>Settings</span>
                </li>
            </ul>
            <button class="logout">
                <img src="images/icons/Logouticon.png">
                <span>Logout</span>
            </button>
        </div>

        <div class="middle-container">
            <form method="post" action="AdminDashboardServlet" onsubmit="return validatePrices();">
                <%
                    String selectedMovie = (String) request.getAttribute("selectedMovie");
                    if (selectedMovie == null) selectedMovie = "1";

                    MovieDAO movieDAO = new MovieDAO();
                    ResultSet movieRS = movieDAO.getAllMoviesResultSet();
                %>
                <div class="zion-movie-selection">
                    <div class="dashboard-topic">Select a Movie:</div>
                    <select id="movie" name="selectedMovie" onchange="this.form.submit()">
                        <%
                            while(movieRS != null && movieRS.next()) {
                                int mid = movieRS.getInt("Movie_ID");
                                String mname = movieRS.getString("Movie_Name");
                                String sel = (selectedMovie.equals(String.valueOf(mid)))?"selected":"";
                        %>
                        <option value="<%=mid%>" <%=sel%>><%=mname%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <%
                    if (!selectedMovie.equals("-1")) {
                        int movieId = Integer.parseInt(selectedMovie);
                        ShowtimeDAO stDao = new ShowtimeDAO();
                        LocalDate startDate = LocalDate.now();
                        String[] times = {"10:00:00","13:00:00","18:00:00"};
                %>

                <div class="zion-weekly-schedule">
                    <h3>Weekly Schedule:</h3>
                    <div class="zion-schedule-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Day</th>
                                    <th>Date</th>
                                    <th>10:00 AM</th>
                                    <th>1:00 PM</th>
                                    <th>6:00 PM</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < 14; i++) {
                                        LocalDate current = startDate.plusDays(i);
                                        String dayName = current.getDayOfWeek().getDisplayName(java.time.format.TextStyle.FULL, Locale.ENGLISH);
                                        String dateStrDisplay = current.format(java.time.format.DateTimeFormatter.ofPattern("yyyy/MM/dd"));
                                        String dateStrDB = current.toString();
                                %>
                                <tr>
                                    <td><%=dayName%></td>
                                    <td><%=dateStrDisplay%></td>
                                    <%
                                        for (String tm : times) {
                                            boolean checked = stDao.showtimeExists(movieId, dateStrDB, tm);
                                    %>
                                    <td><input type="checkbox" name="showtime" value="<%=dateStrDB+"_"+tm%>" <%=checked?"checked":""%>></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button class="save-showtime" type="submit" name="action" value="saveShowtimes">Save</button>

                <div class="zion-ticket-price">
                    <h3>Ticket Price:</h3>
                    <label for="adult">Adult:</label>
                    <input type="text" id="adult" name="adult" value="<%=request.getAttribute("adultVal")==null?"":request.getAttribute("adultVal")%>">
                    <label for="child">Child:</label>
                    <input type="text" id="child" name="child" value="<%=request.getAttribute("childVal")==null?"":request.getAttribute("childVal")%>">
                    <button type="submit" name="action" value="updatePrices">Update</button>
                </div>
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null && !error.isEmpty()) {
                %>
                <div style="color:red"><%=error%></div>
                <%
                    }
                %>
                <%
                    }
                %>
            </form>
        </div>

        <script>
            function validatePrices() {
                const adult = document.getElementById("adult").value.trim();
                const child = document.getElementById("child").value.trim();
                if (adult === "" || child === "") {
                    alert("Please provide both adult and child prices.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
