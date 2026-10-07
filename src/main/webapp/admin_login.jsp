<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login | BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; display: flex; justify-content: center; align-items: center; height: 100vh; }
.box { background: #fff; padding: 36px; border-radius: 14px; box-shadow: 0 4px 14px rgba(0,0,0,0.08); width: 340px; }
h2 { color: #222; margin-bottom: 6px; }
h2 span { color: #FF6B35; }
p.sub { color: #888; font-size: 13px; margin-bottom: 20px; }
input { width: 100%; padding: 12px; margin-bottom: 14px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; }
button { width: 100%; padding: 12px; background: #FF6B35; color: #fff; border: none; border-radius: 8px; font-size: 15px; font-weight: bold; cursor: pointer; }
.error { color: #C0392B; font-size: 13px; margin-bottom: 12px; }
</style>
</head>
<body>
<div class="box">
<h2>Bite<span>Express</span> Admin</h2>
<p class="sub">Sign in to view orders</p>
<% if (request.getAttribute("error") != null) { %>
<div class="error"><%= request.getAttribute("error") %></div>
<% } %>
<form action="<%= request.getContextPath() %>/admin/login" method="post">
<input type="text" name="username" placeholder="Username" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Login</button>
</form>
</div>
</body>
</html>