<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foods.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<title>Menu - BiteExpress</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }

    body {
        background-color: #FFF5EE;
        min-height: 100vh;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #ffffff;
        padding: 14px 40px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.05);
    }

    .navbar .logo {
        font-size: 22px;
        font-weight: bold;
        color: #222;
    }

    .navbar .logo span {
        color: #FF6B35;
    }

    .navbar .nav-links a {
        margin: 0 12px;
        text-decoration: none;
        color: #444;
        font-size: 14px;
    }

    .page-header {
        padding: 30px 40px 10px;
    }

    .page-header h1 {
        color: #222;
        font-size: 26px;
    }

    .page-header p {
        color: #888;
        font-size: 14px;
        margin-top: 4px;
    }

    .restaurant-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 20px;
        padding: 20px 40px 40px;
    }

    .restaurant-card {
        background: #ffffff;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 4px 14px rgba(0,0,0,0.06);
        transition: transform 0.15s ease;
    }

    .restaurant-card:hover {
        transform: translateY(-4px);
    }

    .restaurant-img {
        width: 100%;
        height: 150px;
        background-color: #f0e6df;
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #FF6B35;
        font-size: 40px;
    }

    .restaurant-info {
        padding: 16px;
    }

    .restaurant-info h3 {
        font-size: 17px;
        color: #222;
        margin-bottom: 4px;
    }

    .restaurant-info .cuisine {
        font-size: 13px;
        color: #888;
        margin-bottom: 8px;
    }

    .restaurant-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 13px;
        color: #555;
        margin-bottom: 6px;
    }

    .rating-badge {
        background-color: #E8F5E9;
        color: #2E7D32;
        padding: 2px 8px;
        border-radius: 6px;
        font-weight: bold;
        font-size: 12px;
    }

    .address {
        font-size: 12px;
        color: #999;
        margin-top: 6px;
    }

    .view-menu-btn {
        display: block;
        text-align: center;
        margin-top: 12px;
        background-color: #FF6B35;
        color: #fff;
        text-decoration: none;
        padding: 9px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: bold;
    }

    .view-menu-btn:hover {
        background-color: #e85a2a;
    }

    .empty-state {
        padding: 60px 40px;
        text-align: center;
        color: #999;
    }
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
    <h1>Menu</h1>
</div>

<%
    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<% if (menuList != null && !menuList.isEmpty()) { %>
    <div class="restaurant-grid">
        <% for (Menu m : menuList) { %>
            <div class="restaurant-card">
                <div class="restaurant-img" style="background-image: url('<%= m.getImagePath() %>');"></div>
                <div class="restaurant-info">
                    <h3><%= m.getItemName() %></h3>
                    <p class="cuisine"><%= m.getDescription() %></p>
                    <p class="address">Rs. <%= m.getPrice() %></p>
                    <form action="cart" method="post">
                        <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
                        <input type="hidden" name="itemName" value="<%= m.getItemName() %>">
                        <input type="hidden" name="price" value="<%= m.getPrice() %>">
                        <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="view-menu-btn">Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>
<% } else { %>
    <p style="padding:30px 40px;">No menu items available for this restaurant right now.</p>
<% } %>

</body>
</html>