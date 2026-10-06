<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foods.model.User" %>
<!DOCTYPE html>
<html>
<head>
<title>BiteExpress - Food Delivery</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; min-height: 100vh; }
.navbar { display: flex; justify-content: space-between; align-items: center; background-color: #ffffff; padding: 14px 40px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); }
.navbar .logo { font-size: 22px; font-weight: bold; color: #222; }
.navbar .logo span { color: #FF6B35; }
.navbar a { margin: 0 12px; text-decoration: none; color: #444; font-size: 14px; }

.hero-banner {
    position: relative;
    height: 420px;
    background-image: linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)), url('https://images.pexels.com/photos/6113813/pexels-photo-6113813.jpeg?w=1200');
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: #fff;
}
.hero-banner h1 { font-size: 40px; margin-bottom: 12px; }
.hero-banner h1 span { color: #FF6B35; }
.hero-banner p { font-size: 16px; margin-bottom: 24px; opacity: 0.9; }

.search-box {
    display: flex;
    justify-content: center;
    max-width: 500px;
    margin: 0 auto;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.2);
}
.search-box input { flex: 1; border: none; padding: 14px 16px; font-size: 14px; outline: none; }
.search-box button {
    background-color: #FF6B35;
    color: #fff;
    border: none;
    padding: 0 24px;
    font-weight: bold;
    font-size: 14px;
    cursor: pointer;
}
.search-box button:hover { background-color: #e8500c; }

.categories { max-width: 1100px; margin: 50px auto; padding: 0 40px; }
.categories h2 { text-align: center; color: #222; font-size: 24px; margin-bottom: 30px; }
.category-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(160px, 1fr)); gap: 20px; }
.category-card {
    background: #fff;
    border-radius: 14px;
    overflow: hidden;
    text-align: center;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    text-decoration: none;
    transition: transform 0.15s ease;
}
.category-card:hover { transform: translateY(-4px); }
.category-card .cat-img { height: 100px; background-size: cover; background-position: center; }
.category-card h4 { color: #222; font-size: 14px; padding: 12px 0; }

.bottom-cta { background-color: #FF6B35; color: #fff; text-align: center; padding: 50px 20px; margin-top: 40px; }
.bottom-cta h2 { font-size: 24px; margin-bottom: 10px; }
.bottom-cta p { font-size: 14px; margin-bottom: 20px; opacity: 0.9; }
.bottom-cta a {
    display: inline-block;
    background-color: #fff;
    color: #FF6B35;
    text-decoration: none;
    padding: 12px 28px;
    font-weight: bold;
    border-radius: 8px;
    font-size: 14px;
}
</style>
</head>
<body>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <div>
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <%
            User navUser = (User) session.getAttribute("loggedInUser");
            if (navUser != null) {
        %>
            <a href="profile.jsp">Profile</a>
            <a href="logout">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </div>
</div>

<div class="hero-banner">
    <div>
        <h1>Craving something <span>delicious?</span></h1>
        <p>Order from the best restaurants near you, delivered fast.</p>
        <form action="restaurants" method="get">
            <div class="search-box">
                <input type="text" name="search" placeholder="Search restaurants or dishes...">
                <button type="submit">Search</button>
            </div>
        </form>
    </div>
</div>

<div class="categories">
    <h2>Popular Categories</h2>
    <div class="category-grid">
        <a href="restaurants" class="category-card">
            <div class="cat-img" style="background-image:url('https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?w=300');"></div>
            <h4>South Indian</h4>
        </a>
        <a href="restaurants" class="category-card">
            <div class="cat-img" style="background-image:url('https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?w=300');"></div>
            <h4>Cafe & Coffee</h4>
        </a>
        <a href="restaurants" class="category-card">
            <div class="cat-img" style="background-image:url('https://images.pexels.com/photos/12984979/pexels-photo-12984979.jpeg?w=300');"></div>
            <h4>Asian</h4>
        </a>
        <a href="restaurants" class="category-card">
            <div class="cat-img" style="background-image:url('https://images.pexels.com/photos/2703468/pexels-photo-2703468.jpeg?w=300');"></div>
            <h4>Continental</h4>
        </a>
        <a href="restaurants" class="category-card">
            <div class="cat-img" style="background-image:url('https://images.pexels.com/photos/12737917/pexels-photo-12737917.jpeg?w=300');"></div>
            <h4>Biryani</h4>
        </a>
    </div>
</div>

<div class="bottom-cta">
    <h2>Ready to order?</h2>
    <p>Explore our full list of restaurants and get your favorite meal delivered.</p>
    <a href="restaurants">Browse Restaurants</a>
</div>

</body>
</html>