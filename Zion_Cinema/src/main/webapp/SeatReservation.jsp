<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <img src="images/logo.png">
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
     <div class="selected-movie-name">Pirates of the Caribbean : Dead Men Tell No Tales</div>
     <div class="selected-container" >
        <div class="date-selected" >
            <ul>
                <li>Mon</li>
                <li>Tue</li>
                <li>Wed</li>
                <li>Thu</li>
                <li>Fri</li>
            </ul>
            <form class="dateselected-buttons-form">
                <button type="button" class="datesel-button">26</button>
                <button type="button" class="datesel-button">27</button>
                <button type="button" class="datesel-button">28</button>
                <button type="button" class="datesel-button">29</button>
                <button type="button" class="datesel-button">30</button>
            </form>
        </div>

        <div class="time-selected">
            <div class="span-2">Zion Cinema</div>
            <div class="timeselected-buttons-form">
                <button type="button" class="timesel-button">10.00 AM</button>
                <button type="button" class="timesel-button">12.00 AM</button>
                <button type="button" class="timesel-button">01.00 PM</button>
            </div>
        </div>
    </div>


    <!-- Seat Selection Section -->
    <div class="seat-reserve-container">
        <h2>Select Seats</h2>
        <div class="screen-container"><img src="images/moviescreen.png"></div>
                
                <span class="seat-label" style="margin-top: 35px;">A</span>
                <div class="seat-row-A-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                </div>

                <div class="seat-row-A-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                </div>

                <span class="seat-label" style="margin-top: 105px;">B</span>
                <div class="seat-row-B-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                </div>

                <div class="seat-row-B-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat reserved" data-seat="A2"></div>
                    <div class="seat reserved" data-seat="A3"></div>
                </div>

                <span class="seat-label" style="margin-top: 175px;">C</span>
                <div class="seat-row-C-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div>

                <div class="seat-row-C-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div>

                <span class="seat-label" style="margin-top: 245px;">D</span>
                <div class="seat-row-D-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat reserved" data-seat="A3"></div>
                    <div class="seat reserved" data-seat="A2"></div>
                </div>

                <div class="seat-row-D-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div>

                <span class="seat-label" style="margin-top: 345px;">E</span>
                <div class="seat-row-E-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div>

                <div class="seat-row-E-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div>

                <span class="seat-label" style="margin-top: 415px;">F</span>
                <div class="seat-row-F-L">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat reserved" data-seat="A3"></div>
                    <div class="seat reserved" data-seat="A2"></div>
                </div>

                <div class="seat-row-F-R">
                    <div class="seat available" data-seat="A1"></div>
                    <div class="seat available" data-seat="A2"></div>
                    <div class="seat available" data-seat="A3"></div>
                    <div class="seat available" data-seat="A2"></div>
                </div> 


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
        <img src="images/jakeposter.png" alt="Pirates of the Caribbean Poster" >
        <div class="ticket-pricing">
            <div class="ticket-type">
                <span>Adult</span>
                <p>LKR 1500</p>
                <div class="quantity-control">
                    <button class="quantity-decrement">-</button>
                    <button class="quantity">2</button>
                    <button class="quantity-increment">+</button>
                </div>
            </div>
            <div class="ticket-type">
                <span>Child</span>
                <p>LKR 1500</p>

                <div class="quantity-control">
                    <button class="quantity-decrement">-</button>
                    <span class="quantity">1</span>
                    <button class="quantity-increment">+</button>
                </div>
            </div>
        </div>
        <div class="total-price">
            <span class="span-3">Total</span>
            <span>LKR 5500</span>
        </div>
        <button class="continue-button">Continue</button>
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
                <a href="https://web.facebook.com"><img src="images/fbicon.png"></a>
                <a href="https://www.instagram.com/"><img src="images/instaicon.png"></a>
                <a href="https://x.com"><img src="images/xicon.png"></a>
                <a href="https://www.tiktok.com"><img src="images/tiktokicon.png"></a>
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

        // Select all buttons
        const buttons = document.querySelectorAll('.datesel-button');

        buttons.forEach(button => {
            button.addEventListener('click', () => {
        buttons.forEach(btn => btn.classList.remove('active'));

        button.classList.add('active');
            });
        });


        // Select all time buttons
        const timeButtons = document.querySelectorAll('.timesel-button');

        timeButtons.forEach(button => {
            button.addEventListener('click', () => {
                timeButtons.forEach(btn => btn.classList.remove('active'));
                
                button.classList.add('active');
            });
        });


        // Seat Selection Logic
            const seats = document.querySelectorAll(".seat.available");

            seats.forEach((seat) => {
                seat.addEventListener("click", () => {
                    seat.classList.toggle("selected"); // Toggle the 'selected' class
                });
            });

    </script>
    
    </body>
</html>
