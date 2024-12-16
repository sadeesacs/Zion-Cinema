<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <!-- ADMovie details -->
            <p>Movie Details</p>
            <div class="divider"></div>


               <div class="movie-details">
                <div class="detail">
                    <span class="label">Movie Name</span>
                    <span class="value" style="font-size:21px">: Pirates of the Caribbean Dead Men Tell No Tales</span>
                </div>
                <div class="detail">
                    <span class="label">Movie Date</span>
                    <span class="value" style="font-size:21px">: Mon, 25 Nov 2024</span>
                </div>
                <div class="detail">
                    <span class="label">Movie Time</span>
                    <span class="value" style="font-size:21px">: 10:00 AM</span>
                </div>
                <div class="detail">
                    <span class="label">Seat Info</span>
                    <span class="value" style="font-size:21px">: E7, E8</span>
                </div>
            </div>

            



            <div class="billing-details">
                <!-- Billing details -->
                <p>Billing Details</p>
                <div class="divider"></div>





            <div class="Billing-details">
                <div class="detail">
                    <span class="label">Name</span>
                    <span class="value" style="font-size:21px">: Johny Deep</span>
                </div>
                <div class="detail">
                    <span class="label">Phone number</span>
                    <span class="value" style="font-size:21px">: +94 778895625</span>
                </div>
                <div class="detail">
                    <span class="label">Email Address</span>
                    <span class="value" style="font-size:21px">: johnydeep@example.com</span>
                </div>
            </div>
            
            


            <!--continue button-->
           <a href="#" class="continue-btn">Continue</a>



            
            
            <!--summary table-->
        <div class="purchase-summary-container">
            <div class="purchase-summary">
                <h2>Purchase Summary</h2>
                <hr>
                <div class="summary-header">
                </div>
                <div class="summary-header">
                    <div>
                       <p style="color: white">Date</p>
                        <p>24 NOV 2024</p>
                    </div>
                    <div>
                       <p style="color: white">Order Number</p>
                        <p>1111</p>
                    </div>
                    <div>
                        <p style="color: white">Payment Method</p>
                        <p>Credit card</p>
                    </div>
                </div>

                <h3>Tickets</h3>
                <div class="summary-items">
                    <p>Adult Ticket<span>2</span>
                        <span>LKR 2500</span></p>
                    <p>Child Ticket<span>1</span>
                        <span>LKR 1100</span></p>
                </div>
                <h3>Food and Beverages</h3>
                <div class="summary-items">
                    <p>Popcorn large<span> 2</span>
                        <span>LKR 1500 </span></p>
                    <p>Milo Shake<span>&nbsp 2</span>
                        <span>LKR 700 </span></p>
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
                <pre>
                    Experience premium entertainment with advanced screens,
                    immersive sound,and comfortable seating. Enjoy the latest
                    blockbusters and timeless classics like never before!
                </pre>
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
    





</html>