<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing</title>

    <link rel="stylesheet" href="StyleSheet3.css" />
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

        <div class="step completed">
            <span>Select Seats</span>
            <div class="circle3"></div>            
        </div>      

        <div class="step completed">
            <span>Order Food</span>
            <div class="line" style="background-color: #F5C51B;"></div>
            <div class="circle3"></div>            
        </div>

        <div class="step active">
            <span>Payment</span>
            <div class="line" style="background-color: #F5C51B;"></div>
            <div class="circle3"></div>            
        </div>

        <div class="step">
            <span>Confirm</span>
            <div class="line"></div>
            <div class="circle3"></div>            
        </div>
    </div>
    


   <!-- Selected ADMovie Details -->
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
              <button type="button" class="datesel-button active">28</button>
              <button type="button" class="datesel-button">29</button>
              <button type="button" class="datesel-button">30</button>
          </form>
      </div>

      <div class="time-selected">
          <div class="span-2">Zion Cinema</div>
          <div class="timeselected-buttons-form">
              <button type="button" class="timesel-button">10.00 AM</button>
              <button type="button" class="timesel-button active">12.00 AM</button>
              <button type="button" class="timesel-button">01.00 PM</button>
          </div>
      </div>

      <div class="seat-selected">
          <div class="span-3">Seat Info</div>
          <div class="seatselected-buttons-form">
              <button type="button" class="seatsel-button">C1</button>
              <button type="button" class="seatsel-button">C2</button>
              <button type="button" class="seatsel-button">D1</button>
          </div>
      </div>
  </div>


    <!-- billing Section -->
    <div class="billing-container">
        <h2>Billing Details</h2>
        <form class="billing-form">
            <!-- First and Last Name -->
            <div class="form-row">
                <div class="form-group">
                    <label for="first-name">First name</label>
                    <input type="text" id="first-name">
                </div>
                <div class="form-group">
                    <label for="last-name">Last name</label>
                    <input type="text" id="last-name">
                </div>
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="phone-number">Phone Number</label>
                <input type="text" id="phone-number">
            </div>

            <!-- Email Address -->
            <div class="form-group">
                <label for="email-address">Email Address</label>
                <input type="email" id="email-address">
            </div>

            <!-- Terms and Conditions -->
            <div class="checkbox-container">
                <input type="checkbox" id="terms">
                <span>I agree to terms of use and privacy policy</span>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="pay-button">PAY NOW</button>
        </form>
        </div>
           
             
        <!--summary table-->
        <div class="purchase-summary-container">
            <div class="purchase-summary">
                <h2>Purchase Summary</h2>
                
                <div class="summary-header">
                </div>
                <h3>Tickets</h3>
                <div class="summary-items">
                    <p>Adult Ticket<span>2</span>
                        <span>LKR 2500</span></p>
                    <p>Child Ticket<span>1</span>
                        <span>LKR 1100</span></p>
                </div>
                <h3>Food and Beverages</h3>
                <div class="summary-items1">
                    <p>Popcorn large<span> 2</span>
                        <span>LKR 1500 ×</span></p>
                    <p>Milo Shake<span>&nbsp 2</span>
                        <span>LKR 700 ×</span></p>
                </div>
                <hr>
                <div class="summary-totals">
                    <p>Subtotal<span>LKR 5500</span></p>
                    <p>VAT 3%<span>LKR 165</span></p>
                </div>
                <hr>
                <div class="summary-total-final">
                    <strong style="color: white;">Total</strong>
                    <strong><span style="font-size: 1.5rem;">LKR 5500</span></strong>
                </div>
                <hr>
            </div>
        </div>


        <!--Footer-->
        <footer class="footer-container">
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
  </body>
</html>
    
        