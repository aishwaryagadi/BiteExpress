<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foods.model.User" %>
<%!
    private static String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<%
    User navUser = (User) session.getAttribute("loggedInUser");
    if (navUser == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | BiteExpress</title>
<style>
    * { box-sizing: border-box; }
    body { margin: 0; font-family: Arial, sans-serif; background: #FFF4EE; color: #222; }
    .navbar { background: #222; padding: 16px 40px; display: flex; justify-content: space-between; align-items: center; }
    .logo { color: #fff; font-size: 20px; font-weight: bold; }
    .logo span { color: #FF6B35; }
    .nav-links a { color: #fff; text-decoration: none; margin-left: 24px; font-weight: bold; font-size: 14px; }
    .nav-links a:hover { color: #FF6B35; }

    .container { padding: 30px 40px; max-width: 560px; }
    h1 { font-size: 26px; margin: 0 0 24px; }
    .card { background: #fff; border-radius: 12px; padding: 28px; box-shadow: 0 4px 14px rgba(0,0,0,0.08); }
    label { display: block; font-size: 12px; font-weight: bold; text-transform: uppercase; margin: 16px 0 6px; }
    label:first-of-type { margin-top: 0; }
    input[type=text], input[type=email] {
        width: 100%; padding: 12px; border: 1px solid #e3d6cd; border-radius: 8px; font-size: 14px;
    }
    input[readonly] { background: #f6f0ec; color: #777; }
    .hint { font-size: 12px; color: #999; margin-top: 4px; }
    .save-btn {
        margin-top: 24px; background: #FF6B35; color: #fff; border: none;
        padding: 12px 28px; border-radius: 8px; font-weight: bold; font-size: 14px; cursor: pointer;
    }
    .save-btn:hover { background: #e55a26; }
    .msg { padding: 12px 16px; border-radius: 8px; margin-bottom: 20px; font-size: 14px; }
    .ok  { background: #DDF5E3; color: #1E8A3C; }
    .err { background: #FDE0E0; color: #C53030; }
</style>
</head>
<body>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="restaurants">Restaurants</a>
        <a href="myorders">My Orders</a>
        <a href="profile.jsp">Profile</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="container">
    <h1>My Profile</h1>

    <% if (request.getParameter("saved") != null) { %>
        <div class="msg ok">Profile updated.</div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="msg err">Could not save. Enter a name and a valid email.</div>
    <% } %>

    <div class="card">
        <form action="updateprofile" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" maxlength="60" required
                   value="<%= esc(navUser.getName()) %>">

            <label for="email">Email</label>
            <input type="email" id="email" name="email" maxlength="100"
                   value="<%= esc(navUser.getEmail()) %>">

            <label for="phone">Phone</label>
            <input type="text" id="phone" value="<%= esc(navUser.getPhone()) %>" readonly>
            <div class="hint">Your phone number is your login ID, so it can't be changed here.</div>

            <button type="submit" class="save-btn">Save Changes</button>
        </form>
    </div>
</div>

</body>
</html>