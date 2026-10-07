# BiteExpress

A food ordering web application built with Java Servlets, JSP and MySQL.

## Features

- Browse restaurants and their menus
- Add items to a cart
- Checkout with Cash on Delivery and an order confirmation page showing the order ID
- Orders and order items saved in a MySQL database
- Admin login with a page listing all orders

## Tech Stack

- Java (Servlets, JSP)
- Apache Tomcat 10
- MySQL
- JDBC
- Eclipse IDE

## How to Run

1. Install Java, Apache Tomcat 10 and MySQL.
2. Create a MySQL database named `foodapp` with the tables `menu`, `orderitem`, `ordertable`, `restaurant` and `users`.
3. Open `src/com/foods/util/DBConnection.java` and set your MySQL username and password.
4. Import the project into Eclipse and add it to a Tomcat server.
5. Start Tomcat and open `http://localhost:8080/food/`.

## Admin Page

Go to `http://localhost:8080/food/admin/orders` and log in to see all orders.

## Author

Aishwarya