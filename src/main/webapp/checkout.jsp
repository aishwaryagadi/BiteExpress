<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Checkout - BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; min-height: 100vh; }
.navbar { display: flex; justify-content: space-between; align-items: center; background-color: #ffffff; padding: 14px 40px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); }
.navbar .logo { font-size: 22px; font-weight: bold; color: #222; }
.navbar .logo span { color: #FF6B35; }
.navbar a { margin: 0 12px; text-decoration: none; color: #444; font-size: 14px; }
.page-header { padding: 30px 40px 10px; }
.page-header h1 { color: #222; font-size: 26px; }
.view-menu-btn { display: block; text-align: center; margin-top: 12px; background-color: #FF6B35; color: #fff; text-decoration: none; padding: 8px; font-size: 13px; font-weight: bold; border: none; border-radius: 6px; cursor: pointer; width: 100%; }
.view-menu-btn:hover { background-color: #e8500c; }
label { font-weight: bold; color: #222; font-size: 14px; }
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
    <h1>Checkout</h1>
</div>

<div style="padding: 0 40px; max-width: 500px;">
    <form action="checkout" method="post">
        <div style="margin-bottom:16px;">
            <label>Full Name</label><br>
            <input type="text" name="customerName" required style="width:100%; padding:10px; margin-top:6px; border-radius:6px; border:1px solid #ccc;">
        </div>
        <div style="margin-bottom:16px;">
            <label>Phone Number</label><br>
            <input type="text" name="customerPhone" required style="width:100%; padding:10px; margin-top:6px; border-radius:6px; border:1px solid #ccc;">
        </div>
        <div style="margin-bottom:16px;">
            <label>Delivery Address</label><br>
            <textarea name="deliveryAddress" required style="width:100%; padding:10px; margin-top:6px; border-radius:6px; border:1px solid #ccc;" rows="3"></textarea>
        </div>
        <button type="submit" class="view-menu-btn">Place Order</button>
    </form>
</div>

</body>
</html>