<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <!-- Food Menu Container -->
        <div class="food-menu-container">
            <div class="food-menu-title">Food and Beverages</div>

            <nav class="food-nav">
                <button data-target="popcorn" class="active">Popcorn</button>
                <button data-target="beverages">Beverages</button>
                <button data-target="coffee">Coffee</button>
                <button data-target="hot-kitchen">Hot Kitchen</button>
                <button data-target="snacks">Snacks</button>
            </nav>

            <div class="food-slides">
                <div id="popcorn" class="food-slide active">

                    <div class="food-slide active" id="popcorn">
                        <div class="food-cards-container">

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                            <div class="food-card">
                                <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                                <div class="food-info">
                                    <span class="food-name">Salted Popcorn - Large</span>
                                    <p>LKR 500</p>
                                    <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                    </div>
                                    <button class="add-to-cart">ADD</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <div id="beverages" class="food-slide">
                    <div class="food-cards-container">

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                    </div>
                </div>


                <div id="coffee" class="food-slide">
                    <div class="food-cards-container">

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                    </div>
                </div>


                <div id="hot-kitchen" class="food-slide">
                    <div class="food-cards-container">

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                    </div>
                </div>


                <div id="snacks" class="food-slide">
                    <div class="food-cards-container">

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                        <div class="food-card">
                            <img src="images/popcorn.png" alt="Salted Popcorn - Large">
                            <div class="food-info">
                                <span class="food-name">Salted Popcorn - Large</span>
                                <p>LKR 500</p>
                                <div class="food-quantity-control">
                                        <button class="food-quantity-decrement">-</button>
                                        <button class="food-quantity">1</button>
                                        <button class="food-quantity-increment">+</button>
                                </div>
                                <button class="add-to-cart">ADD</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- Purchase Summary Container -->
        <div class="purchase-summary-container">
            <div class="purchase-summary">
                <h2>Purchase Summary</h2>

                <!-- Tickets Section -->
                <div class="summary-section">
                    <h3>Tickets</h3>
                    <div class="ticket-item">
                        <span class="ticket-pro-name">Adult Ticket</span>
                        <span class="ticket-pro-quantity">2</span>
                        <span class="ticket-pro-price">LKR 2500</span>
                    </div>
                    <div class="ticket-item">
                        <span class="ticket-pro-name">Child Ticket</span>
                        <span class="ticket-pro-quantity">1</span>
                        <span class="ticket-pro-price">LKR 1100</span>
                    </div>
                </div>

                <!-- Food and Beverages Section -->
                <div class="summary-section">
                    <h3>Food and Beverages</h3>
                    <div class="summary-item">
                        <span class="sum-pro-name">Popcorn Large</span>
                        <span class="sum-pro-quantity">2</span>
                        <span class="sum-pro-price">LKR 1500</span>
                        <a href="" class="delete-icon">x</a>
                    </div>
                    <div class="summary-item">
                        <span class="sum-pro-name">Milo Shake</span>
                        <span class="sum-pro-quantity">2</span>
                        <span class="sum-pro-price">LKR 700</span>
                        <a href="#" class="delete-icon">x</a>
                    </div>
                </div>

                <!-- Total Price Section -->
                <div class="total-price">
                    <span>Total</span>
                    <span>LKR 5500</span>
                </div>

                <!-- Continue Button -->
                <button class="continue-button">Continue</button>
            </div>
        </div>


        <!-- Footer  -->
        <footer class="footer-container" style="margin-top: 890px;">
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




        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".food-nav button");
                const slides = document.querySelectorAll(".food-slide");

                // Add click event to each navigation button
                navButtons.forEach((button) => {
                    button.addEventListener("click", () => {
                        // Get the target ID
                        const targetId = button.getAttribute("data-target");

                        // Update the active navigation button
                        navButtons.forEach((btn) => btn.classList.remove("active"));
                        button.classList.add("active");

                        // Update the active food slide
                        slides.forEach((slide) => {
                            slide.classList.remove("active");
                            if (slide.id === targetId) {
                                slide.classList.add("active");
                            }
                        });
                    });
                });
            });
        </script>
        
    </body>
</html>

