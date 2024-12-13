<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Showtime" %>
<%@ page import="model.Seat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seat Reservation</title>
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
        <!-- Active Step -->
        <div class="step active">
            <span>Select Seats</span>
            <div class="circle"></div>    
        </div>
        <!-- Inactive Steps -->
        <div class="step">
            <span>Order Food</span>
            <div class="line"></div>
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
    

    <!-- Selected Movie Details -->
     <div class="selected-movie-name"><%= request.getAttribute("movieName") %></div>
     <div class="selected-container" >
        <div class="date-selected" >
            <ul>
                <% for (Showtime date : (List<Showtime>) request.getAttribute("closestDates")) { %>
                    <li class="date-li"><%= new java.text.SimpleDateFormat("EEE").format(java.sql.Date.valueOf(date.getDate())) %></li>
                <% } %>
            </ul>
            <form class="dateselected-buttons-form">
                <% 
                String selectedDate = (String) request.getAttribute("selectedDate");
                for (Showtime date : (List<Showtime>) request.getAttribute("closestDates")) { 
                    boolean isActive = selectedDate != null && selectedDate.equals(date.getDate());
                %>
                    <button type="button" class="datesel-button <%= isActive ? "active" : "" %>">
                        <%= new java.text.SimpleDateFormat("dd").format(java.sql.Date.valueOf(date.getDate())) %>
                    </button>
                <% } %>
            </form>
        </div>

        <div class="time-selected">
            <div class="span-2">Zion Cinema</div>
            <div class="timeselected-buttons-form">
                <% 
                String selectedTime = (String) request.getAttribute("selectedTime");
                for (String time : (List<String>) request.getAttribute("timesForDate")) { 
                    String formattedTime = new java.text.SimpleDateFormat("hh:mm a").format(java.sql.Time.valueOf(time));
                    boolean isActive = selectedTime != null && selectedTime.equals(time);
                %>
                    <button type="button" class="timesel-button <%= isActive ? "active" : "" %>">
                        <%= formattedTime %>
                    </button>
                <% } %>
            </div>
        </div>
    </div>


    <!-- Seat Selection Section -->
    <div class="seat-reserve-container">
        <h2>Select Seats</h2>
        <div class="screen-container"><img src="images/icons/moviescreen.png"></div>
            <span class="seat-label" style="margin-top: 35px;">A</span>
            <span class="seat-label" style="margin-top: 105px;">B</span>
            <span class="seat-label" style="margin-top: 175px;">C</span>
            <span class="seat-label" style="margin-top: 245px;">D</span>
            <span class="seat-label" style="margin-top: 345px;">E</span>
            <span class="seat-label" style="margin-top: 415px;">F</span>
            <%
                List<Seat> seats = (List<Seat>) request.getAttribute("seats");
                Set<Integer> reservedSeatIds = (Set<Integer>) request.getAttribute("reservedSeatIds");
                int currentIndex = 0;

                for (char row = 'A'; row <= 'F'; row++) {
                    int seatsPerSection = (row == 'A' || row == 'B') ? 3 : 4;

                    // Left Section
                    out.print("<div class='seat-row-" + row + "-L'>");
                    for (int i = 0; i < seatsPerSection && currentIndex < seats.size(); i++) {
                        Seat seat = seats.get(currentIndex++);
                        String seatClass = reservedSeatIds.contains(seat.getSeatId()) ? "seat reserved" : "seat available";
                        out.print("<button class='" + seatClass + "' data-seat-id='" + seat.getSeatId() + "' data-seat-number='" + seat.getSeatNumber() + "'></button>");
                    }
                    out.print("</div>");

                    // Right Section
                    out.print("<div class='seat-row-" + row + "-R'>");
                    for (int i = 0; i < seatsPerSection && currentIndex < seats.size(); i++) {
                        Seat seat = seats.get(currentIndex++);
                        String seatClass = reservedSeatIds.contains(seat.getSeatId()) ? "seat reserved" : "seat available";
                        out.print("<button class='" + seatClass + "' data-seat-id='" + seat.getSeatId() + "' data-seat-number='" + seat.getSeatNumber() + "'></button>");
                    }
                    out.print("</div>");
                }
            %>

        <!-- Seat Legend -->
        <div class="seat-legend">
            <div class="seat-legend-box" style="background-color: grey;">
                <span class="seat-legend-label" >Reserved</span>
            </div>
            <div class="seat-legend-box">
                <span class="seat-legend-label">Available</span>
            </div>
            <div class="seat-legend-box" style="background-color: #F5C51B;">
                <span class="seat-legend-label" >Selected</span>
            </div>
        </div>
    </div>
       

    <!-- Booking summary -->
    <div class="booking-summary-container">
        <img src="<%= request.getAttribute("moviePoster") %>" alt="<%= request.getAttribute("movieName") %> Poster" />
        <div class="ticket-pricing">
            <div class="ticket-type">
                <span>Adult</span>
                <p>LKR <span id="adultPrice"><%= request.getAttribute("adultPrice") %></span></p>
                
                <div class="quantity-control">
                    <button class="quantity-decrement" onclick="updateQuantity('adult', -1)">-</button>
                    <span id="adultQuantity">0</span>
                    <button class="quantity-increment" onclick="updateQuantity('adult', 1)">+</button>
                </div>
            </div>
                
            <div class="ticket-type">
                <span>Child</span>
                <p>LKR <span id="childPrice"><%= request.getAttribute("childPrice") %></span></p>

                <div class="quantity-control">
                    <button class="quantity-decrement" onclick="updateQuantity('child', -1)">-</button>
                    <span id="childQuantity">0</span>
                    <button class="quantity-increment" onclick="updateQuantity('child', 1)">+</button>
                </div>
            </div>
        </div>
        <div class="total-price">
            <span class="span-3">Total</span>
            <span>LKR <span id="totalPrice">0</span></span>
        </div>
        <form method="post" action="SeatReservationServlet" id="seatReservationForm">
            <input type="hidden" name="movieId" value="<%= request.getAttribute("movieId") %>" />
            <input type="hidden" name="showtimeId" value="<%= request.getAttribute("showtimeId") %>" />
            <input type="hidden" id="selectedSeats" name="selectedSeats" />
            <input type="hidden" id="ticketTypes" name="ticketTypes" />
            <input type="hidden" id="seatPrices" name="seatPrices" />
            <input type="hidden" name="continueToFood" value="true" />
            <button type="submit" class="continue-button">Continue</button>
        </form>
    </div>


    <!-- Footer  -->
    <footer class="footer-container" style="margin-top: 850px;">
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
    

    <!-- JS Code  -->
    <script>
        let adultQuantity = 0;
        let childQuantity = 0;
        const adultPrice = parseFloat(document.getElementById("adultPrice").innerText);
        const childPrice = parseFloat(document.getElementById("childPrice").innerText);
        let totalSeats = 0.00;

        // Seat Selection Logic
        const seats = document.querySelectorAll(".seat.available");

        seats.forEach((seat) => {
            seat.addEventListener("click", () => {
                seat.classList.toggle("selected");

                // Update totalSeats based on selected seats
                totalSeats = document.querySelectorAll(".seat.available.selected").length;

                // Adjust ticket quantities if they exceed the number of selected seats
                if (adultQuantity + childQuantity > totalSeats) {
                    const excess = adultQuantity + childQuantity - totalSeats;

                    if (childQuantity >= excess) {
                        childQuantity -= excess;
                    } else {
                        const remainingExcess = excess - childQuantity;
                        childQuantity = 0;
                        adultQuantity = Math.max(0, adultQuantity - remainingExcess);
                    }
                    document.getElementById("adultQuantity").innerText = adultQuantity;
                    document.getElementById("childQuantity").innerText = childQuantity;
                }
                calculateTotalPrice();
            });
        });

        // Function to update ticket quantity
        function updateQuantity(type, delta) {
            if (type === "adult") {
                if (adultQuantity + childQuantity + delta <= totalSeats && adultQuantity + delta >= 0) {
                    adultQuantity += delta;
                    document.getElementById("adultQuantity").innerText = adultQuantity;
                }
            } else if (type === "child") {
                if (adultQuantity + childQuantity + delta <= totalSeats && childQuantity + delta >= 0) {
                    childQuantity += delta;
                    document.getElementById("childQuantity").innerText = childQuantity;
                }
            }
            calculateTotalPrice();
        }

        // Function to calculate total price
        function calculateTotalPrice() {
            const totalPrice = (adultQuantity * adultPrice) + (childQuantity * childPrice);
            document.getElementById("totalPrice").innerText = totalPrice.toFixed(2);
        }

        // Form submission logic when the "Continue" button is clicked
        const reservationForm = document.getElementById("seatReservationForm");
        const continueButton = document.querySelector(".continue-button");

        continueButton.addEventListener("click", () => {
            // Collect selected seat IDs
            const selectedSeats = Array.from(document.querySelectorAll(".seat.available.selected"))
                .map(seat => seat.dataset.seatId); // Get SeatID from data-seat-id

            if (selectedSeats.length === 0) {
                alert("Please select at least one seat.");
                console.log("No seats selected");
                return;
            }

            if (adultQuantity + childQuantity !== selectedSeats.length) {
                alert("Ticket quantities must match the number of selected seats.");
                console.log("Ticket quantities do not match selected seats");
                return;
            }

            // Populate hidden inputs with form data
            const movieId = document.querySelector('input[name="movieId"]').value;
            const showtimeId = document.querySelector('input[name="showtimeId"]').value;

            document.getElementById("selectedSeats").value = JSON.stringify(selectedSeats);
            document.getElementById("ticketTypes").value = JSON.stringify([
                ...Array(adultQuantity).fill("Adult"),
                ...Array(childQuantity).fill("Child"),
            ]);
            document.getElementById("seatPrices").value = JSON.stringify([
                ...Array(adultQuantity).fill(adultPrice),
                ...Array(childQuantity).fill(childPrice),
            ]);

            // Debugging log for form data
            console.log("MovieID:", movieId);
            console.log("ShowtimeID:", showtimeId);
            console.log("Selected Seats:", document.getElementById("selectedSeats").value);
            console.log("Ticket Types:", document.getElementById("ticketTypes").value);
            console.log("Seat Prices:", document.getElementById("seatPrices").value);

            // Submit the form
            reservationForm.submit();
        });
    </script>
    
    </body>
</html>
