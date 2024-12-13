<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Showtime" %>
<%@ page import="model.MovieDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.FoodItem" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food Pre-order</title>

        <link rel="stylesheet" href="StyleSheet2.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <!-- Header -->
        <div class="header-container">

            <!--Zion Cinema logo-->
            <img src="images/icons/logo.png">
            <a href="HomePage.html" class="logo-name">Zion Cinema</a>

            <!--Navigation Bar-->
            <div class="nav">
                <a href="HomePage.html">Home</a>
                <span><a href="Movie.html">Movies</a></span>
                <a href="About.html">About us</a>
                <a href="Contact.html">Contact</a>
                <a href="FAQ.html">FAQ</a>
            </div>

            <!-- Header Buttons -->
            <a href="Movies.html" class="but-buytickets">
                <div>Buy Tickets</div>
            </a>
            <a href="Login.html" class="but-login">
                <div>Login</div>
            </a>
        </div>
        <div class="header-line"></div>


        <!-- Progress Bar -->
        <div class="progress-bar">
            <div class="step completed">
                <span>Select Seats</span>
                <div class="circle"></div>    
            </div>
            <div class="step active">
                <span>Order Food</span>
                <div class="line" style="background-color:#F5C51B"></div>
                <div class="circle"></div>
            </div>
            <div class="step">
                <span>Payment</span>
                <div class="line"></div>
                <div class="circle"></div>
            </div>
            <div class="step">
                <span>Confirm</span>
                <div class="line"></div>
                <div class="circle"></div>
            </div>
        </div>
        
        <%
            MovieDetail movieDetail = (MovieDetail) request.getAttribute("selectedMovie");
            Showtime selectedShowtime = (Showtime) request.getAttribute("selectedShowtime");
            String selectedSeats = (String) request.getAttribute("selectedSeats");
        %>


        <!-- Selected Movie Details -->
        <div class="selected-movie-name"><%= movieDetail.getName() %></div>
        <div class="selected-container" >
            <div class="date-selected" >
                <ul>
                    <li><%= new java.text.SimpleDateFormat("EEE").format(java.sql.Date.valueOf(selectedShowtime.getDate())) %></li>
                </ul>
                <form class="dateselected-buttons-form">
                    <button type="button" class="datesel-button active">
                        <%= new java.text.SimpleDateFormat("dd").format(java.sql.Date.valueOf((String) session.getAttribute("selectedDate"))) %>
                    </button>
                </form>
            </div>

            <div class="time-selected">
                <div class="span-2">Zion Cinema</div>
                <div class="timeselected-buttons-form">
                    <button class="timesel-button active">
                        <%= new java.text.SimpleDateFormat("hh:mm a").format(java.sql.Time.valueOf(selectedShowtime.getTime())) %>
                    </button>
                </div>
            </div>

            <div class="seat-selected">
                <div class="span-3">Seat Info</div>
                <div class="seatselected-buttons-form">
                    <%
                        org.json.JSONArray seatsArray = new org.json.JSONArray(selectedSeats);
                        for (int i = 0; i < seatsArray.length(); i++) {
                    %>
                        <button class="seatsel-button"><%= seatsArray.getString(i) %></button>
                    <% } %>
                </div>
            </div>
        </div>


        <!-- Food Menu Container -->
        <div class="food-menu-container">
            <div class="food-menu-title">Food and Beverages</div>
            <nav class="food-nav">
                <% Map<String, List<FoodItem>> foodItemsByType = (Map<String, List<FoodItem>>) request.getAttribute("foodItemsByType"); %>
                <% for (String foodType : foodItemsByType.keySet()) { %>
                    <button data-target="<%= foodType %>" class="<%= foodType.equals("Hot Kitchen") ? "active" : "" %>"><%= foodType %></button>
                <% } %>
            </nav>

            <div class="food-slides">
                <% for (Map.Entry<String, List<FoodItem>> entry : foodItemsByType.entrySet()) { %>
                    <div id="<%= entry.getKey() %>" class="food-slide <%= entry.getKey().equals("Hot Kitchen") ? "active" : "" %>">
                        <div class="food-cards-container">
                            <% for (FoodItem foodItem : entry.getValue()) { %>
                                <div class="food-card"
                                    data-food-id="<%= foodItem.getFoodId() %>"
                                    data-food-name="<%= foodItem.getName() %>"
                                    data-food-price="<%= foodItem.getPrice() %>">
                                    <img src="<%= foodItem.getFoodImage() %>" alt="<%= foodItem.getName() %>">
                                    <div class="food-info">
                                        <span class="food-name"><%= foodItem.getName() %></span>
                                        <p>LKR <%= foodItem.getPrice() %></p>
                                        <div class="food-quantity-control">
                                            <button class="food-quantity-decrement">-</button>
                                            <button class="food-quantity">1</button>
                                            <button class="food-quantity-increment">+</button>
                                        </div>
                                        <button class="add-to-cart">ADD</button>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

        <form action="FoodPreOrderServlet" method="post">
            <!-- Purchase Summary Container -->
            <div class="purchase-summary-container">
                <div class="purchase-summary">
                    <h2>Purchase Summary</h2>

                    <!-- Tickets Section -->
                    <div class="summary-section">
                        <h3>Tickets</h3>
                        <%
                            List<model.TicketSummary> ticketSummaries = (List<model.TicketSummary>) request.getAttribute("ticketSummaries");
                            if (ticketSummaries != null) {
                                for (model.TicketSummary summary : ticketSummaries) {
                        %>
                            <div class="ticket-item">
                                <span class="ticket-pro-name"><%= summary.getTicketType() %> Ticket</span>
                                <span class="ticket-pro-quantity"><%= summary.getQuantity() %></span>
                                <span class="ticket-pro-price">LKR <%= summary.getTotalPrice() %></span>
                            </div>
                        <%
                                }
                            }
                        %>
                    </div>

                    <!-- Food and Beverages Section -->
                    <div class="summary-section">
                        <h3>Food and Beverages</h3>
                        <!-- Container for dynamically added food items -->
                        <div class="food-summary-items"></div>
                    </div>

                    <!-- Total Price Section -->
                    <div class="total-price">
                        <span>Total</span>
                        <span class="total-amount">LKR 0</span>
                    </div>

                    <input type="hidden" name="action" value="saveFoodOrder">
                    <input type="hidden" name="cartData" class="cart-data" value="">
                    <input type="hidden" id="ticket-total" value="<%= request.getAttribute("ticketTotal") %>" />

                    <!-- Continue Button -->
                    <button type="submit" class="continue-button">Continue</button>
                </div>
            </div>
        </form>


        <!-- Footer  -->
        <footer class="footer-container" style="margin-top: 890px;">
            <div class="footer-column">
                <h2>Zion Cinema</h2>
                <p>
                    Experience premium entertainment with advanced screens, immersive sound, 
                    and comfortable seating. Enjoy the latest blockbusters and timeless classics like never before!
                </p>
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
                        <li><a href="HomePage.html">Home</a></li>
                        <li><a href="Movies.html">Buy Tickets</a></li>
                        <li><a href="Movie.html">Movies</a></li>
                        <li><a href="AboutUs.html">About us</a></li>
                        <li><a href="Contact.html">Contact</a></li>
                    </ul>
                    <ul class="quick-links">
                        <li><a href="Cancellation.html">Cancellations</a></li>
                        <li><a href="UserAccount.html">My Account</a></li>
                        <li><a href="Login.html">Login</a></li>
                        <li><a href="Signup.html">Signup</a></li>
                        <li><a href="FAQ.html">FAQ</a></li>
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




        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".food-nav button");
                const slides = document.querySelectorAll(".food-slide");

                // Handle nav buttons for food categories
                navButtons.forEach((button) => {
                    button.addEventListener("click", () => {
                        const targetId = button.getAttribute("data-target");
                        navButtons.forEach((btn) => btn.classList.remove("active"));
                        button.classList.add("active");
                        slides.forEach((slide) => {
                            slide.classList.remove("active");
                            if (slide.id === targetId) {
                                slide.classList.add("active");
                            }
                        });
                    });
                });

                let cart = []; // {foodId, name, price, quantity}

                // Update quantity on the card
                document.querySelectorAll(".food-card").forEach(card => {
                    const decrementBtn = card.querySelector(".food-quantity-decrement");
                    const incrementBtn = card.querySelector(".food-quantity-increment");
                    const quantityBtn = card.querySelector(".food-quantity");

                    decrementBtn.addEventListener("click", () => {
                        let currentQty = parseInt(quantityBtn.textContent);
                        if (currentQty > 1) {
                            quantityBtn.textContent = currentQty - 1;
                        }
                    });

                    incrementBtn.addEventListener("click", () => {
                        let currentQty = parseInt(quantityBtn.textContent);
                        quantityBtn.textContent = currentQty + 1;
                    });
                });

                // Add to cart functionality
                document.querySelectorAll(".food-card .add-to-cart").forEach(addBtn => {
                    addBtn.addEventListener("click", () => {
                        const card = addBtn.closest(".food-card");
                        const foodId = card.getAttribute("data-food-id");
                        const price = parseFloat(card.getAttribute("data-food-price"));
                        const name = card.getAttribute("data-food-name");
                        const quantity = parseInt(card.querySelector(".food-quantity").textContent);

                        const existingItem = cart.find(item => item.foodId === foodId);
                        if (existingItem) {
                            existingItem.quantity += quantity;
                        } else {
                            cart.push({ foodId: foodId, name: name, price: price, quantity: quantity });
                        }
                        updateSummary();
                    });
                });

                function updateSummary() {
                    const summaryContainer = document.querySelector(".food-summary-items");
                    summaryContainer.textContent = ""; // Clear the container

                    let foodTotal = 0; // Initialize food total

                    // Calculate food total
                    cart.forEach(item => {
                        const itemTotal = item.price * item.quantity;
                        foodTotal += itemTotal;

                        // Create a div for each item
                        const div = document.createElement("div");
                        div.classList.add("summary-item");

                        // Create and append the name
                        const nameSpan = document.createElement("span");
                        nameSpan.classList.add("sum-pro-name");
                        nameSpan.textContent = item.name;
                        div.appendChild(nameSpan);

                        // Create and append the quantity
                        const quantitySpan = document.createElement("span");
                        quantitySpan.classList.add("sum-pro-quantity");
                        quantitySpan.textContent = item.quantity;
                        div.appendChild(quantitySpan);

                        // Create and append the price
                        const priceSpan = document.createElement("span");
                        priceSpan.classList.add("sum-pro-price");
                        priceSpan.textContent = "LKR " + itemTotal;
                        div.appendChild(priceSpan);

                        // Create and append the delete button
                        const deleteLink = document.createElement("a");
                        deleteLink.href = "#";
                        deleteLink.classList.add("delete-icon");
                        deleteLink.textContent = "x";
                        deleteLink.addEventListener("click", (e) => {
                            e.preventDefault();
                            removeItemFromCart(item.foodId);
                        });
                        div.appendChild(deleteLink);

                        // Append the item div to the summary container
                        summaryContainer.appendChild(div);
                    });

                    // Fetch ticket total from the hidden input
                    const ticketTotal = parseFloat(document.getElementById("ticket-total").value);

                    // Calculate the combined total (tickets + food)
                    const combinedTotal = ticketTotal + foodTotal;

                    // Update the total amount in the DOM
                    document.querySelector(".total-amount").textContent = "LKR " + combinedTotal.toFixed(2);
                }

                function removeItemFromCart(foodId) {
                    cart = cart.filter(i => i.foodId !== foodId);
                    updateSummary();
                }

                // Serialize cart before submitting
                const form = document.querySelector("form[action='FoodPreOrderServlet']");
                form.addEventListener("submit", (e) => {
                    const cartDataInput = document.querySelector(".cart-data");
                    cartDataInput.value = JSON.stringify(cart);
                });
            });
        </script>
        
    </body>
</html>

