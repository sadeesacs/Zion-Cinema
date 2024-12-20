<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
        <link rel="stylesheet" href="StyleSheet11.css">
    </head>
    <body>
        <!-- Header Section -->
          <div class="header-container">
              <img src="images/icons/logo.png" alt="Zion Cinema Logo">
              <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

              <!-- Navigation Bar -->
              <div class="nav">
                  <a href="HomePageServlet">Home</a>
                  <a href="MovieListingServlet">Movies</a>
                  <a href="AboutUs.jsp">About us</a>
                  <a href="ContactUs.jsp">Contact</a>
                  <span><a href="FAQ.jsp">FAQ</a></span>
              </div>

              <!-- Header Buttons -->
              <a href="MovieListingServlet" class="but-buytickets">
                <div>Buy Tickets</div>
            </a>
             <%  Integer userID = (Integer) session.getAttribute("UserID");
                if (userID != null) {
            %>
            <a href="UserAccountServlet" class="but-login">
                <div>My Account</div>
            </a>
            <%
            } else {
            %>
            <a href="UserLogin.jsp" class="but-login">
                <div>Login</div>
            </a>
            <%
                }
            %>
          </div>
          <div class="header-line"></div>

          <!-- FAQ Header Section -->
          <div class="faq-header">
              <h1>Frequently Asked <br>Questions</h1><br>
              <pre>
Here, you’ll find answers to the most commonly asked questions. If you can’t find
what you’re looking for, feel free to reach out to us through our Contact Us page.
We’re here to ensure your cinema experience is seamless and enjoyable!
              </pre>
          </div>



      <div class="FAQ-image">
      <img src="images/others/FAQ-image.png" alt="faq image">
      </div>







          <!-- FAQ Questions and Answers -->
      <div class="faq-container">
          <div class="faq-column">
              <div class="faq-item">
                  <div class="faq-title">Why Become An Online Member? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>By becoming an online member, you can access your purchase history to keep track of past bookings.
                      Additionally, you can save your payment information securely, making future bookings quicker and more convenient.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Any Additional Charges for Online Ticket Booking? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>Yes, a minimal convenience fee is charged for online ticket bookings. This fee ensures the smooth functioning 
                      of our secure booking system and payment gateways, offering you a hassle-free experience.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Can I Cancel Tickets Booked Online And Get A Refund? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                     <br> Yes, you can cancel your tickets online by visiting the cancellation page on our website. Once you complete the cancellation, 
                      your refund will be processed automatically as per the refund policies.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">How Can I Purchase Tickets Online? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>Visit our website and select the movie you want to watch. Choose from the available showtimes 
                      and seats, then proceed to payment. Once your booking is confirmed, you will receive a confirmation email with your e-ticket.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Can I Book Tickets In Advance? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>Tickets can only be booked for the movies currently displayed on our website. Check the listings regularly to find available 
                      movies and their respective showtimes.<br><br>
                  </div>
              </div>
          </div>

          <div class="faq-column">
              <div class="faq-item">
                  <div class="faq-title">What Should I Do if I Don’t Receive My E-Ticket? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>If you haven’t received your e-ticket, please visit the Contact Us page on our website and fill out the form detailing your issue. 
                      Our customer support team will address your concern and assist you promptly.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Do You Offer Group Discounts? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                     <br> No, we currently do not offer group discounts. Each ticket is priced individually as displayed during the booking process.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Are Snacks and Drinks Allowed Inside the Theatre? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                     <br> Outside snacks and drinks are not permitted. However, you can pre-order snacks and drinks during the ticket booking process. 
                      These pre-ordered items will be available for you at the theatre.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">What Happens If a Show is Cancelled? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                     <br> In the event of a show cancellation, you will be notified via email or message. For further assistance, 
                      please visit the Contact Us page and reach out to our customer support team.<br><br>
                  </div>
              </div>
              <div class="faq-item">
                  <div class="faq-title">Do You Offer Gift Cards? <span class="faq-plus">+</span></div>
                  <div class="faq-answer">
                      <br>No, we do not offer gift cards at this time. Please check our website for other exciting features.<br><br>
                  </div>
              </div>
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
                        <li><a href="HomePageServlet">Home</a></li>
                        <li><a href="MovieListingServlet">Buy Tickets</a></li>
                        <li><a href="MovieListingServlet">Movies</a></li>
                        <li><a href="AboutUs.jsp">About us</a></li>
                        <li><a href="ContactUs.jsp">Contact</a></li>
                    </ul>
                    <ul class="quick-links">
                        <li><a href="Cancellation.jsp">Cancellations</a></li>
                        <li><a href="UserAccount.jsp">My Account</a></li>
                        <li><a href="UserLogin.jsp">Login</a></li>
                        <li><a href="UserRegistration.jsp">Signup</a></li>
                        <li><a href="FAQ.jsp">FAQ</a></li>
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
          document.querySelectorAll('.faq-title').forEach(title => {
    title.addEventListener('click', () => {
        const answer = title.nextElementSibling;

        // Close all other open answers
        document.querySelectorAll('.faq-answer').forEach(otherAnswer => {
            if (otherAnswer !== answer) {
                otherAnswer.style.maxHeight = null;
                const otherPlusIcon = otherAnswer.previousElementSibling.querySelector('.faq-plus');
                if (otherPlusIcon) otherPlusIcon.textContent = "+";
            }
        });

        // Toggle the clicked answer
        if (answer.style.maxHeight) {
            answer.style.maxHeight = null;
        } else {
            answer.style.maxHeight = answer.scrollHeight + "px";
        }

        // Toggle the "+" to "-" for the clicked item
        const plusIcon = title.querySelector('.faq-plus');
        plusIcon.textContent = plusIcon.textContent === "+" ? "-" : "+";
    });
});
    
       </script>
    </body>
</html>
