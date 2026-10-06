<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up - BiteExpress</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }

    body {
        background-color: #FFF5EE;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
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

    .signup-wrapper {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 16px;
    }

    .signup-card {
        background: #ffffff;
        width: 100%;
        max-width: 420px;
        border-radius: 14px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.08);
        padding: 36px 32px;
        text-align: center;
    }

    .signup-card h2 {
        color: #222;
        margin-bottom: 6px;
    }

    .signup-card p.subtitle {
        color: #888;
        font-size: 14px;
        margin-bottom: 24px;
    }

    .form-group {
        text-align: left;
        margin-bottom: 16px;
    }

    .form-group label {
        display: block;
        font-size: 13px;
        color: #555;
        margin-bottom: 6px;
        font-weight: bold;
    }

    .form-group input {
        width: 100%;
        padding: 11px 14px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        transition: border-color 0.2s;
    }

    .form-group input:focus {
        border-color: #FF6B35;
    }

    .signup-btn {
        width: 100%;
        background-color: #FF6B35;
        color: #fff;
        border: none;
        padding: 12px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 8px;
        transition: background-color 0.2s;
    }

    .signup-btn:hover {
        background-color: #e85a2a;
    }

    .error-message {
        background-color: #FFE5E0;
        color: #C0392B;
        padding: 10px 14px;
        border-radius: 8px;
        font-size: 13px;
        margin-bottom: 18px;
        text-align: left;
    }

    .login-link {
        margin-top: 22px;
        font-size: 13px;
        color: #666;
    }

    .login-link a {
        color: #FF6B35;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="navbar">
    <div class="logo">Bite<span>Express</span></div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="restaurants.jsp">Restaurants</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

<div class="signup-wrapper">
    <div class="signup-card">
        <h2>Create Account</h2>
        <p class="subtitle">Sign up to start ordering delicious food</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="signup" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
            </div>

            <button type="submit" class="signup-btn">Sign Up</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>
</div>

</body>
</html>