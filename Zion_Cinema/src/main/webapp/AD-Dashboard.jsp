<%@ page import="model.MovieList" %>
<%@ page import="DAO.ShowTimeDAO" %>
<%@ page import="model.FoodMenu" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        <!-- Header of the Admin Dashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.html">Zion Cinema</a></div>

                <div class="search-bar">
                    <span>Search here.....</span>
                        <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>

                <div class="AD-username">Emma Watson</div>
                <div class="word-admin">Admin</div>

                <div class="user-icon" ><i class="bi bi-person-fill"></i></div>

                <img src="images/icons/notificationicon.png" class="notification-icon">
                <img src="images/icons/messagesicon.png" class="message-icon">
            </div>
        </header>
        
        
        
        <!-- Navigational Panel of the Admin Dashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashbaord.jsp">
                    <li class="nav-item active">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Foodicon.png"></img>
                        <span>Food Menu</span>
                    </li>
                </a>
                <a href="AD-Transactions.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Billicon.png"></img>
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/Inquiryicon.png"></img>
                        <span>Customer Inquiries</span>
                    </li>
                </a>
                <a href="AD-Customers.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/customericon.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                    <li class="nav-item">
                        <img src="images/icons/Settingicon.png"></img>
                        <span>Settings</span>
                    </li>
            </ul>
            <button class="logout">
                <img src="images/icons/Logouticon.png"></img>
                <span>Logout</span>
            </button>
        </div>
        
        
        
            <div class="middle-container">
                <div class="zion-movie-selection">
                    <div class="dashboard-topic">Select a Movie:</div>
                    <select id="movie">
                        <%
                            // Fetching the list of Customer inquiries
                            List<MovieList> Movie = ShowTimeDAO.getAllMovies();
                            //Loop to display data
                            if (!Movie.isEmpty()) {
                                for (MovieList movies: Movie) {
                        %>
                        <option value="<%=movies.getMovieName()%>"><%=movies.getMovieName()%></option>

                        <%
                            }
                        }
                        else{
                        %>
                        <p>
                            <span class="header-top" style="margin-left:500px"> No Movie found</span>
                        </p>

                        <%
                            }
                        %>
                    </select>
                </div>

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
                                    <th>7:00 PM</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Monday</td>
                                    <td>2024/10/25</td>
                                    <td><input type="checkbox" checked></td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox"></td>
                                </tr>
                                <tr>
                                    <td>Tuesday</td>
                                    <td>2024/10/26</td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox" checked></td>
                                    <td><input type="checkbox"></td>
                                </tr>
                                <tr>
                                    <td>Wednesday</td>
                                    <td>2024/10/27</td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox" checked></td>
                                </tr>
                                <tr>
                                    <td>Thursday</td>
                                    <td>2024/10/28</td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox" checked></td>
                                </tr>
                                <tr>
                                    <td>Friday</td>
                                    <td>2024/10/29</td>
                                    <td><input type="checkbox" checked></td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox"></td>
                                </tr>
                                <tr>
                                    <td>Saturday</td>
                                    <td>2024/10/30</td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox" checked></td>
                                    <td><input type="checkbox"></td>
                                </tr>
                                <tr>
                                    <td>Sunday</td>
                                    <td>2024/10/31</td>
                                    <td><input type="checkbox" checked></td>
                                    <td><input type="checkbox"></td>
                                    <td><input type="checkbox" checked></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <button class="save-showtime">Save</button>

                <div class="zion-ticket-price">
                    <h3>Ticket Price:</h3>
                    <label for="adult">Adult:</label>
                    <input type="text" id="adult">
                    <label for="child">Child:</label>
                    <input type="text" id="child">
                    <button>Update</button>
                </div>
            </div>


    </body>
</html>
