<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Zion Cinema</title>
        
        <link rel="stylesheet" href="StyleSheet1.css" />

    </head>
    <body>
        <!-- Header -->
        <div class="header-background">
            <div class="header-container">

                <!--Zion Cinema logo-->
                <img src="images/icons/logo.png">
                <a href="HomePage.html" class="logo-name">Zion Cinema</a>

                <!--Navigation Bar-->
                <div class="nav">
                    <span><a href="HomePage.html">Home</a></span>
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
                    <div>Login</div>
                </a>

            </div>
        </div>

        <!-- Movie Banner -->
        <div class="carousel">
            <div class="carousel-slides">
                <!-- Slide 1 -->
                <div class="slide">
                    <img src="images/Carousal/Spider Man No Way Home.jpg" alt="Spider-Man No Way Home">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Spider-Man No Way Home</h1>
                        <p>Experience the thrill of the big screen with Spider-Man: No Way Home! Witness Peter Parker's epic battle to restore his secret identity, featuring jaw-dropping action, multiverse twists, and your favorite iconic villains.!</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <!-- Slide 2 -->
                <div class="slide">
                    <img src="images/Carousal/The Wild Robot.jpg" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>The Wild Robot</h1>
                        <p>Embark on an extraordinary journey with The Wild Robot! Follow Roz, a robot stranded on a remote island, as she discovers the beauty of nature, forms unexpected friendships, and learns what it truly means to be alive.</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <!-- Slide 3 -->
                <div class="slide">
                    <img src="images/Carousal/End Game.png" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Avengers Endgame</h1>
                        <p>After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <!--slide 4-->
                <div class="slide">
                    <img src="images/Carousal/The Lion King.jpg" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Mufasa: The Lion King</h1>
                        <p>Journey into the majestic pride lands with Mufasa: The Lion King! Uncover the untold story of Simba's father, as young Mufasa rises from humble beginnings to become a legendary king. Experience breathtaking visuals, heartfelt bonds!</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
            </div>
        </div>

        
        
        <script src="LandingPageScript.js"></script>

    </body>
</html>
