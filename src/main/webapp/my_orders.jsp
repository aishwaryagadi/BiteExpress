<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foods.model.Order" %>
<%@ page import="com.foods.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | BiteExpress</title>
<style>
    * { box-sizing: border-box; }
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #FFF4EE;
        color: #222;
    }
    .navbar {
        background: #222;
        padding: 16px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .logo { color: #fff; font-size: 20px; font-weight: bold; }
    .logo span { color: #FF6B35; }
    .nav-links a {
        color: #fff;
        text-decoration: none;
        margin-left: 24px;
        font-weight: bold;
        font-size: 14px;
    }
    .nav-links a:hover { color: #FF6B35; }

    .container { padding: 30px 40px; }
    h1 { font-size: 26px; margin: 0 0 24px; }

    .orders-table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 14px rgba(0,0,0,0.08);
    }
    .orders-table th {
        background: #FFEFE5;
        text-align: left;
        padding: 14px 18px;
        font-size: 12px;
        text-transform: uppercase;
    }
    .orders-table td {
        padding: 14px 18px;
        font-size: 14px;
        border-top: 1px solid #f1e6df;
    }

    .order-link { color: #FF6B35; font-weight: bold; text-decoration: none; }
    .order-link:hover { text-decoration: underline; }

    .badge {
        padding: 4px 10px;
        border-radius: 10px;
        font-size: 11px;
        font-weight: bold;
        text-transform: uppercase;
    }
    .placed    { background: #FFF1D6; color: #B7791F; }
    .preparing { background: #DDEBFF; color: #1D4ED8; }
    .delivered { background: #DDF5E3; color: #1E8A3C; }
    .cancelled { background: #FDE0E0; color: #C53030; }

    .empty {
        text-align: center;
        color: #999;
        margin-top: 60px;
        font-size: 16px;
    }
</style>
</head>
<body>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <%
            User navUser = (User) session.getAttribute("loggedInUser");
            if (navUser != null) {
        %>
            <a href="myorders">My Orders</a>
            <a href="profile.jsp">Profile</a>
            <a href="logout">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </div>
</div>

<div class="container">
    <h1>My Orders</h1>

    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        if (orders == null || orders.isEmpty()) {
    %>
        <p class="empty">You haven't placed any orders yet.</p>
    <% } else { %>
        <table class="orders-table">
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Total</th>
                <th>Status</th>
                <th>Payment</th>
            </tr>
            <% for (Order o : orders) { %>
            <tr>
                <td><a class="order-link" href="orderdetails?id=<%= o.getOrderId() %>">#<%= o.getOrderId() %></a></td>
                <td><%= o.getOrderDate() %></td>
                <td>&#8377;<%= o.getTotalAmount() %></td>
                <td>
                    <span class="badge <%= o.getStatus().toLowerCase() %>">
                        <%= o.getStatus() %>
                    </span>
                </td>
                <td><%= o.getPaymentMethod() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>
</div>

</body>
</html>