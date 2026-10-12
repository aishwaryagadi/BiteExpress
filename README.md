# BiteExpress

A food ordering web application built with Java Servlets, JSP and MySQL.

## Features

- Customer signup, login and logout
- Browse restaurants and their menus
- Shopping cart and checkout (Cash on Delivery)
- My Orders page showing each customer's own orders and their status
- Admin login and an admin page to view all orders and update their status

## Tech Stack

- Java (Servlets, JSP)
- Apache Tomcat 10
- MySQL
- JDBC
- HTML and CSS

## How to Run

1. Install JDK, Eclipse IDE for Enterprise Java, Apache Tomcat 10 and MySQL.
2. In MySQL Workbench, create a database named `foodapp` and create the tables: `users`, `restaurant`, `menu`, `ordertable` and `orderitem`.
3. Open `DBConnection.java` in `com.foods.util` and set your own MySQL username and password.
4. Import the project into Eclipse and add it to the Tomcat server.
5. Start Tomcat and open `http://localhost:8080/food/`.

## Pages

| Page | URL |
|------|-----|
| Home | `/food/index.jsp` |
| Restaurants | `/food/restaurants` |
| My Orders | `/food/myorders` |
| Admin Orders | `/food/admin/orders` |

## Author

Aishwarya Gadi
