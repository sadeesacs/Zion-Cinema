<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
                <select id="movieDropdown" onchange="fetchScheduleAndPrices()">
                    <% List<Map<String, Object>> movies = (List<Map<String, Object>>) request.getAttribute("movies");
                        if (movies != null && !movies.isEmpty()) {
                            for (Map<String, Object> movie : movies) { %>
                                <option value="<%= movie.get("Movie_ID") %>"><%= movie.get("Movie_Name") %></option>
                    <%     }
                        } else { %>
                            <option value="">No movies available</option>
                    <% } %>
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
                                <th>6:00 PM</th>
                            </tr>
                        </thead>
                        <tbody id="scheduleTable">
                            <% List<Map<String, Object>> schedule = (List<Map<String, Object>>) request.getAttribute("scheduleData");
                                if (schedule != null) {
                                    for (Map<String, Object> row : schedule) {
                                        List<Map<String, Object>> times = (List<Map<String, Object>>) row.get("times"); %>
                             <tr>
                                 <td><%= row.get("day") %></td>
                                 <td><%= row.get("date") %></td>
                                 <% for (Map<String, Object> time : times) { %>
                                 <td>
                                     <input type="checkbox" <%= (boolean) time.get("checked") ? "checked" : "" %> 
                                            data-date="<%= row.get("date") %>" 
                                            data-time="<%= time.get("time") %>">
                                 </td>
                                 <% } %>
                             </tr>
                             <% } } %>
                        </tbody>
                    </table>
                </div>
            </div>



            <div class="zion-ticket-price">
                <h3>Ticket Price:</h3>
                <label for="adult">Adult:</label>
                <input type="text" id="adultPrice">
                <label for="child">Child:</label>
                <input type="text" id="childPrice">
                <button onclick="saveShowtimesAndPrices()">Update</button>
            </div>
        </div>
        
        <script>
            function fetchScheduleAndPrices() {
                const movieId = document.getElementById('movieDropdown').value;
                location.href = `AdminDashboardServlet?action=fetchScheduleAndPrices&movieId=${movieId}`;
            }

            function saveShowtimesAndPrices() {
                const movieId = document.getElementById('movieDropdown').value;
                const checkboxes = document.querySelectorAll('#scheduleTable input[type="checkbox"]');

                const showtimes = Array.from(checkboxes).filter(cb => cb.checked).map(cb => ({
                    date: cb.getAttribute('data-date'),
                    time: cb.getAttribute('data-time')
                }));

                const adultPrice = parseFloat(document.getElementById('adultPrice').value);
                const childPrice = parseFloat(document.getElementById('childPrice').value);

                fetch('AdminDashboardServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        movieId, showtimes, adultPrice, childPrice
                    })
                }).then(response => {
                    if (response.ok) {
                        alert('Showtimes and prices updated successfully!');
                        fetchScheduleAndPrices();
                    }
                });
            }
        </script>


    </body>
</html>
