<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Account</title>
        <link rel="stylesheet" href="StyleSheet9.css" />
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
                <a href="Movie.html">Movies</a>
                <a href="About.html">About us</a>
                <a href="Contact.html">Contact</a>
                <a href="FAQ.html">FAQ</a>
            </div>

            <!-- Header Buttons -->
            <a href="Movies.html" class="but-buytickets">
                <div>Buy Tickets</div>
            </a>
            <a href="Login.html" class="but-login">
                <img src="images/Accounticon.png">
                <div>Account</div>
            </a>
        </div>
        <div class="header-line"></div>
        
        
        
        
        <!-- User Details listing Container -->
        
        <div class="userdetails">
            <img src="images/usericon.png" class="user-icon">
            
            <div class="label-fname">First Name :</div>
            <div class="user-fname">Leo</div>
            
            <div class="label-lname">Last Name :</div>
            <div class="user-lname">Perera</div>
            
            <div class="label-phone">Phone Number :</div>
            <div class="user-phone">0712549783</div>
            
            <div class="label-email">Email Address :</div>
            <div class="user-email">leoperepa@gmail.com</div>
            
            <a href="Cancellation.jsp" class="but-cancel">
                <div>Cancel Order</div>
            </a>
            
            <button class="logout">
                <img src="images/Logouticon.png"></img>
                <span>Logout</span>
            </button>
        </div>
        
        
        
        <!-- User ADTransaction history listing Container -->
        <div class="Trans-history">
            <h1>ADTransaction History</h1>
            <div class="middle-container">
                <div class="middle-header-container">
                    <span class="header-top" style="margin-left:20px">Receipt No</span>
                    <span class="header-top" style="margin-left:140px">Movie Name</span>
                    <span class="header-top" style="margin-left:34%">Show Time</span>
                    <span class="header-top" style="margin-left:53%">Seats</span>
                    <span class="header-top" style="margin-left:65%">Food Order</span>
                    <span class="header-top" style="margin-left:87%">Total</span>
                </div>
                <div class="content-container">
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                    <div class="Transactions">
                        <p class="Trans-id">012536</p>
                        <p class="Trans-movie-name">Venom: The Last Dance</p>
                        <p class="Trans-show-time">2020/05/25 1.30PM</p>
                        <p class="Trans-seats">
                            <span>E1</span>
                            <span>E2</span>
                            <span>E3</span>
                            <span>E4</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                            <span>E5</span>
                        </p>
                        <div class="Trans-food-order">
                            <div class="food-Trow">
                                <span class="food-Tname">Popcorn L</span>
                                <span class="food-Tquantity">1</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Pepsi L</span>
                                <span class="food-Tquantity">2</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                            <div class="food-Trow">
                                <span class="food-Tname">Coffee</span>
                                <span class="food-Tquantity">3</span>
                            </div>
                        </div>
                        <p class="Trans-total">LKR 6000</p>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!-- Footer  -->
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
