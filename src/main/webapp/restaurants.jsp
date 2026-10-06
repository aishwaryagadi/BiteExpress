<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.foods.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<title>Restaurants - BiteExpress</title>
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
    <div class="logo">Bite<span>Express</span></div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

<div class="page-header">
    <h1>Restaurants Near You</h1>
    <p>Choose from the best restaurants in your area</p>
</div>

<%
    List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
%>

<% if (restaurantList != null && !restaurantList.isEmpty()) { %>
    <div class="restaurant-grid">
        <% for (Restaurant r : restaurantList) { %>
            <div class="restaurant-card">
                <% if (r.getImagePath() != null && !r.getImagePath().isEmpty()) { %>
                    <div class="restaurant-img" style="background-image: url('<%= r.getImagePath() %>');"></div>
                <% } else { %>
                    <div class="restaurant-img">🍽️</div>
                <% } %>
                <div class="restaurant-info">
                    <h3><%= r.getName() %></h3>
                    <div class="cuisine"><%= r.getCuisineType() %></div>
                    <div class="restaurant-meta">
                        <span class="rating-badge">★ <%= r.getRating() %></span>
                        <span><%= r.getDeliveryTime() %> mins</span>
                    </div>
                    <div class="address"><%= r.getAddress() %></div>
                    <a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="view-menu-btn">View Menu</a>
                </div>
            </div>
        <% } %>
    </div>
<% } else { %>
    <div class="empty-state">
        <p>No restaurants available right now. Please check back later.</p>
    </div>
<% } %>

</body>
</html>