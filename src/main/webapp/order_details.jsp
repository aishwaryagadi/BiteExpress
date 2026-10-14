<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foods.model.Order" %>
<%@ page import="com.foods.model.OrderLine" %>
<%@ page import="com.foods.model.User" %>
<%!
    private static String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details | BiteExpress</title>
<style>
    * { box-sizing: border-box; }
    body { margin: 0; font-family: Arial, sans-serif; background: #FFF4EE; color: #222; }
    .navbar { background: #222; padding: 16px 40px; display: flex; justify-content: space-between; align-items: center; }
    .logo { color: #fff; font-size: 20px; font-weight: bold; }
    .logo span { color: #FF6B35; }
    .nav-links a { color: #fff; text-decoration: none; margin-left: 24px; font-weight: bold; font-size: 14px; }
    .nav-links a:hover { color: #FF6B35; }

    .container { padding: 30px 40px; }
    h1 { font-size: 26px; margin: 0 0 8px; }
    .back { color: #FF6B35; text-decoration: none; font-weight: bold; font-size: 14px; }
    .summary { margin: 16px 0 24px; font-size: 14px; color: #555; }
    .summary span { margin-right: 24px; }

    .items-table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 14px rgba(0,0,0,0.08); }
    .items-table th { background: #FFEFE5; text-align: left; padding: 14px 18px; font-size: 12px; text-transform: uppercase; }
    .items-table td { padding: 14px 18px; font-size: 14px; border-top: 1px solid #f1e6df; }
    .total-row td { font-weight: bold; background: #fffaf6; }

    .badge { padding: 4px 10px; border-radius: 10px; font-size: 11px; font-weight: bold; text-transform: uppercase; }
    .placed    { background: #FFF1D6; color: #B7791F; }
    .preparing { background: #DDEBFF; color: #1D4ED8; }
    .delivered { background: #DDF5E3; color: #1E8A3C; }
    .cancelled { background: #FDE0E0; color: #C53030; }

    .cancel-box { margin-top: 24px; }
    .cancel-btn {
        background: #fff;
        color: #C53030;
        border: 2px solid #C53030;
        padding: 10px 22px;
        border-radius: 8px;
        font-weight: bold;
        font-size: 14px;
        cursor: pointer;
    }
    .cancel-btn:hover { background: #C53030; color: #fff; }

    .empty { text-align: center; color: #999; margin-top: 40px; font-size: 16px; }
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

<%
    Order order = (Order) request.getAttribute("order");
    List<OrderLine> items = (List<OrderLine>) request.getAttribute("items");
%>

<div class="container">
    <a class="back" href="myorders">&larr; Back to My Orders</a>
    <h1>Order #<%= order.getOrderId() %></h1>

    <div class="summary">
        <span>Date: <%= order.getOrderDate() %></span>
        <span>Payment: <%= esc(order.getPaymentMethod()) %></span>
        <span>Status:
            <span class="badge <%= order.getStatus().toLowerCase() %>"><%= order.getStatus() %></span>
        </span>
    </div>

    <% if (items == null || items.isEmpty()) { %>
        <p class="empty">No item details are available for this order.</p>
    <% } else { %>
        <table class="items-table">
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
            <% for (OrderLine line : items) { %>
            <tr>
                <td><%= esc(line.getItemName()) %></td>
                <td>&#8377;<%= line.getPrice() %></td>
                <td><%= line.getQuantity() %></td>
                <td>&#8377;<%= line.getItemTotal() %></td>
            </tr>
            <% } %>
            <tr class="total-row">
                <td colspan="3">Order total</td>
                <td>&#8377;<%= order.getTotalAmount() %></td>
            </tr>
        </table>
    <% } %>

    <% if ("PLACED".equals(order.getStatus())) { %>
        <div class="cancel-box">
            <form action="cancelorder" method="post"
                  onsubmit="return confirm('Cancel this order?');">
                <input type="hidden" name="id" value="<%= order.getOrderId() %>">
                <button type="submit" class="cancel-btn">Cancel Order</button>
            </form>
        </div>
    <% } %>
</div>

</body>
</html>