<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Order Confirmed - BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; min-height: 100vh; }
.navbar { display: flex; justify-content: space-between; align-items: center; background-color: #ffffff; padding: 14px 40px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); }
.navbar .logo { font-size: 22px; font-weight: bold; color: #222; }
.navbar .logo span { color: #FF6B35; }
.navbar a { margin: 0 12px; text-decoration: none; color: #444; font-size: 14px; }

.confirm-box {
    max-width: 480px;
    margin: 60px auto;
    background: #fff;
    border-radius: 16px;
    padding: 40px 30px;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}
.check-circle {
    width: 70px;
    height: 70px;
    background-color: #2ecc71;
    border-radius: 50%;
    color: #fff;
    font-size: 36px;
    line-height: 70px;
    margin: 0 auto 20px;
}
.confirm-box h1 {
    color: #222;
    font-size: 26px;
    margin-bottom: 8px;
}
.confirm-box h1 span { color: #2ecc71; }
.confirm-box p.subtitle {
    color: #777;
    font-size: 14px;
    margin-bottom: 24px;
}
.order-details {
    text-align: left;
    background: #FFF5EE;
    border-radius: 10px;
    padding: 16px 20px;
    margin-bottom: 24px;
}
.order-details .row {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    font-size: 14px;
    color: #333;
}
.order-details .row span:first-child { color: #888; }
.confirm-btn {
    display: inline-block;
    background-color: #FF6B35;
    color: #fff;
    text-decoration: none;
    padding: 12px 24px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 8px;
    margin: 6px;
}
.confirm-btn:hover { background-color: #e8500c; }
</style>
</head>
<body>

<div class="navbar">
    <span class="logo">Bite<span>Express</span></span>
    <a href="index.jsp">Home</a>
    <a href="restaurants">Restaurants</a>
    <a href="login.jsp">Login</a>
</div>

<div class="confirm-box">
    <div class="check-circle">&#10003;</div>
    <h1>Order Placed <span>Successfully!</span></h1>
    <p class="subtitle">Thank you for ordering with BiteExpress. Your delicious food is now being prepared.</p>

    <div class="order-details">
        <div class="row">
            <span>Order ID</span>
            <span>#<%= request.getAttribute("orderId") %></span>
        </div>
        <div class="row">
            <span>Total Amount</span>
            <span>Rs. <%= request.getAttribute("totalAmount") %></span>
        </div>
        <div class="row">
            <span>Payment Method</span>
            <span>Cash on Delivery</span>
        </div>
    </div>

    <a href="restaurants" class="confirm-btn">Order More</a>
</div>

</body>
</html>