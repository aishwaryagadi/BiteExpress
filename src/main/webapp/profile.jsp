<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foods.model.User" %>
<!DOCTYPE html>
<html>
<head>
<title>My Profile - BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; min-height: 100vh; }
.navbar { display: flex; justify-content: space-between; align-items: center; background-color: #ffffff; padding: 14px 40px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); }
.navbar .logo { font-size: 22px; font-weight: bold; color: #222; }
.navbar .logo span { color: #FF6B35; }
.navbar a { margin: 0 12px; text-decoration: none; color: #444; font-size: 14px; }
.profile-box {
    max-width: 420px;
    margin: 60px auto;
    background: #fff;
    border-radius: 16px;
    padding: 36px 30px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}
.profile-box h1 { color: #222; font-size: 24px; margin-bottom: 24px; text-align: center; }
.profile-row { padding: 12px 0; border-bottom: 1px solid #eee; }
.profile-row span.label { color: #888; font-size: 13px; display: block; }
.profile-row span.value { color: #222; font-size: 15px; font-weight: bold; }
.logout-btn {
    display: block;
    text-align: center;
    margin-top: 24px;
    background-color: #FF6B35;
    color: #fff;
    text-decoration: none;
    padding: 12px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 8px;
}
.logout-btn:hover { background-color: #e8500c; }
</style>
</head>
<body>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <div>
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <a href="profile.jsp">Profile</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="profile-box">
    <h1>My Profile</h1>
    <div class="profile-row">
        <span class="label">Full Name</span>
        <span class="value"><%= loggedInUser.getName() %></span>
    </div>
    <div class="profile-row">
        <span class="label">Phone Number</span>
        <span class="value"><%= loggedInUser.getPhone() %></span>
    </div>
    <div class="profile-row">
        <span class="label">Email</span>
        <span class="value"><%= loggedInUser.getEmail() %></span>
    </div>
    <a href="logout" class="logout-btn">Logout</a>
</div>

</body>
</html>