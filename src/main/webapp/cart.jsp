<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foods.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<title>Cart - BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; min-height: 100vh; }
.navbar { display: flex; justify-content: space-between; align-items: center; background-color: #ffffff; padding: 14px 40px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); }
.navbar .logo { font-size: 22px; font-weight: bold; color: #222; }
.navbar .logo span { color: #FF6B35; }
.navbar a { margin: 0 12px; text-decoration: none; color: #444; font-size: 14px; }
.page-header { padding: 30px 40px 10px; }
.page-header h1 { color: #222; font-size: 26px; }
.view-menu-btn { display: inline-block; text-align: center; background-color: #FF6B35; color: #fff; text-decoration: none; padding: 8px 16px; font-size: 13px; font-weight: bold; border: none; border-radius: 6px; cursor: pointer; }
.view-menu-btn:hover { background-color: #e8500c; }
</style>
</head>
<body>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <a href="index.jsp">Home</a>
    <a href="restaurants">Restaurants</a>
    <a href="login.jsp">Login</a>
</div>

<div class="page-header">
    <h1>Your Cart</h1>
</div>

<%
    List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
    double total = 0;
%>

<% if (cart != null && !cart.isEmpty()) { %>
    <div style="padding: 0 40px;">
        <% for (CartItem item : cart) {
            double lineTotal = item.getPrice() * item.getQuantity();
            total += lineTotal;
        %>
            <div style="display:flex; justify-content:space-between; align-items:center; background:#fff; padding:16px; margin-bottom:10px; border-radius:10px; box-shadow:0 2px 6px rgba(0,0,0,0.06);">
                <div>
                    <h3 style="margin:0;"><%= item.getItemName() %></h3>
                    <p style="margin:4px 0; color:#888;">Qty: <%= item.getQuantity() %> x Rs. <%= item.getPrice() %></p>
                </div>
                <div style="display:flex; align-items:center; gap:16px;">
                    <p style="font-weight:bold;">Rs. <%= lineTotal %></p>

                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                        <input type="hidden" name="action" value="decrease">
                        <button type="submit" style="padding:4px 10px; border-radius:6px; border:1px solid #ccc; background:#fff; cursor:pointer;">-</button>
                    </form>

                    <span><%= item.getQuantity() %></span>

                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                        <input type="hidden" name="itemName" value="<%= item.getItemName() %>">
                        <input type="hidden" name="price" value="<%= item.getPrice() %>">
                        <input type="hidden" name="restaurantId" value="<%= session.getAttribute("restaurantId") %>">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" style="padding:4px 10px; border-radius:6px; border:1px solid #ccc; background:#fff; cursor:pointer;">+</button>
                    </form>

                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit" class="view-menu-btn">Remove</button>
                    </form>
                </div>
            </div>
        <% } %>

        <div style="text-align:right; padding:20px 0;">
            <h2>Total: Rs. <%= total %></h2>
            <a href="checkout.jsp" class="view-menu-btn" style="text-decoration:none; display:inline-block; margin-top:10px;">Proceed to Checkout</a>
        </div>
    </div>
<% } else { %>
    <p style="padding:30px 40px;">Your cart is empty.</p>
<% } %>

</body>
</html>