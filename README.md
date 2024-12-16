# **Zion Cinema** 🎥

## **Overview**

Zion Cinema is a movie ticket booking platform designed for ease of use and efficiency. The system allows users to browse movies, reserve seats, pre-order food, and make payments seamlessly. The platform supports both registered users and guests, ensuring an easy and seamless booking process for everyone.

---

## **Table of Contents**

1. [Features](#features)
2. [Technologies Used](#technologies-used)
3. [Installation and Setup](#installation-and-setup)
4. [Webpages and Their Functionalities](#webpages-and-their-functionalities)
5. [System Architecture](#system-architecture)

---

## **Features**

- **Dynamic Movie Catalog:** Displays now-showing and upcoming movies with detailed information.
- **Seat Selection:** Interactive seat maps for real-time reservation updates.
- **Food Pre-Ordering:** Pre-book snacks and beverages while reserving tickets.
- **Secure Payments:** Integrated PayPal gateway for smooth transactions.
- **Admin Panel:** Manage movies, seats, food menu, and user inquiries efficiently.
- **Guest User Support:** Book tickets without account registration.

---

## **Technologies Used**

- **Backend:** Java (Servlets, JSP)
- **Database:** MySQL
- **Frontend:** HTML, CSS, JavaScript
- **Server:** Apache Tomcat
- **Build Tool:** Maven

---

## **Installation and Setup**

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/zion-cinema.git
2. **Import the project into NetBeans.**

3. **Set up the database:**
   - Create a database named `ZionCinema`.
   - Run the SQL scripts provided in the `/db` directory to set up the schema and seed data.

4. **Configure the `dbcon` class for your database connection:**
   - Update the `dbcon` file with your MySQL credentials (default: user=`root`, password=``).

5. **Start the Apache Tomcat server and deploy the application.**

---

## **Webpages and Their Functionalities**

1. **Home Page:**  
   Displays now-showing and upcoming movies with banners, navigation links, and featured promotions.

2. **Movies Page:**  
   Lists all now-showing and upcoming movies with posters, titles, and brief details. Includes a "View Details" button for more information.

3. **Movie Details Page:**  
   Displays detailed information about the selected movie, including title, genre, and showtimes. Features a "Book Now" button to proceed to seat selection.

4. **Seat Selection Page:**  
   Offers an interactive seat map for selecting seats visually. Allows users to specify ticket types and shows real-time price updates.

5. **Food Preorder Page:**  
   Displays a menu for pre-ordering snacks and beverages. Includes a purchase summary and a button to proceed to checkout.

6. **Checkout Pages:**
   - **Billing Details Page:** Collects user details and displays a purchase summary.
   - **Payment Page:** Completes the transaction via a PayPal gateway.

7. **Booking Confirmation Page:**  
   Confirms the reservation with a detailed summary and sends a confirmation email.

8. **About Us Page:**  
   Showcases the cinema's history, mission, and vision, with an interactive location map and gallery.

9. **Contact Us Page:**  
   Provides a contact form for inquiries and displays essential contact information.

10. **FAQ Page:**  
    Answers common questions about reservations, payments, and cancellations.

11. **User Account Page:**  
    Displays user details, transaction history, and options to cancel reservations.

12. **Reservation Cancellation Page:**  
    Allows users to cancel reservations by validating receipt numbers and OTPs.

13. **Admin Dashboard**

    - **Admin Login Page:** Allows administrators to log in securely using their username and password, granting access to dashboard functionalities.
    - **Customer Details Management Page:** Displays a list of all registered customers with details such as first name, last name, email, and phone number.
    - **Customer Inquiries Management Page:** Provides a listing of all customer inquiries submitted through the Contact Us page, enabling administrators to address them effectively.
    - **Showtime Management Page:** Allows administrators to assign showtimes to movies dynamically. Features input fields for setting ticket prices for adult and child categories.
    - **Movie Management Page:** Includes CRUD (Create, Read, Update, Delete) operations for managing movie details such as name, genre, duration, and release year.
    - **Food Menu Management Page:** Enables administrators to manage food items with functionalities to add, edit, delete, and view details of food offerings.
    - **Transaction Management Page:** Displays a comprehensive list of all completed transactions, including detailed purchase summaries.

---

## **System Architecture**

- **Pattern:** Model-View-Controller (MVC)
- **Backend:** Servlets handle user requests and responses.
- **Database Interaction:** DAO classes manage all database queries.
- **Frontend:** JSP pages dynamically display user data and interfaces.
- **Session Management:** Tracks both registered and guest users during the booking process.

