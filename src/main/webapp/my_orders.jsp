<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.foods.model.Order" %>
<!DOCTYPE html>
<html>
<head>
<title>My Orders | BiteExpress</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
body { background-color: #FFF5EE; }
.navbar { background-color: #222; padding: 14px 40px; display: flex; justify-content: space-between; align-items: center; }
.navbar a { color: #fff; text-decoration: none; font-weight: bold; }
.navbar .accent { color: #FF6B35; }
.page-header { padding: 30px 40px 10px; }
.page-header h1 { color: #222; font-size: 24px; }
.table-wrapper { margin: 20px 40px 50px; background: #fff; border-radius: 14px; box-shadow: 0 4px 14px rgba(0,0,0,0.06); overflow-x: auto; }
table { width: 100%; border-collapse: collapse; font-size: 13px; }
th { text-align: left; background-color: #FFF0E8; color: #333; padding: 14px 16px; font-size: 12px; text-transform: uppercase; }
td { padding: 14px 16px; border-top: 1px solid #f0f0f0; color: #333; }
.status-badge { padding: 4px 10px; border-radius: 6px; font-size: 11px; font-weight: bold; }
.status-placed { background-color: #FFF4E0; color: #B8860B; }
.status-preparing { background-color: #E3F2FD; color: #1565C0; }
.status-delivered { background-color: #E8F5E9; color: #2E7D32; }
.status-cancelled { background-color: #FFE5E0; color: #C0392B; }
.status-default { background-color: #eee; color: #555; }
.empty-state { padding: 60px 40px; text-align: center; color: #999; }
</style>
</head>
<body>

<div class="navbar">
<a href="<%= request.getContextPath() %>/index.jsp">Bite<span class="accent">Express</span></a>
<a href="<%= request.getContextPath() %>/restaurants">Restaurants</a>
</div>

<div class="page-header">
<h1>My Orders</h1>
</div>

<%
@SuppressWarnings("unchecked")
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<% if (orders != null && !orders.isEmpty()) { %>
<div class="table-wrapper">
<table>
<tr>
<th>Order ID</th>
<th>Date</th>
<th>Total</th>
<th>Status</th>
<th>Payment</th>
</tr>
<% for (Order o : orders) {
String status = o.getStatus() != null ? o.getStatus().toLowerCase() : "";
String statusClass = "status-default";
if (status.contains("placed") || status.contains("pending")) statusClass = "status-placed";
else if (status.contains("prepar")) statusClass = "status-preparing";
else if (status.contains("deliver")) statusClass = "status-delivered";
else if (status.contains("cancel")) statusClass = "status-cancelled";
%>
<tr>
<td>#<%= o.getOrderId() %></td>
<td><%= o.getOrderDate() %></td>
<td>₹<%= o.getTotalAmount() %></td>
<td><span class="status-badge <%= statusClass %>"><%= o.getStatus() %></span></td>
<td><%= o.getPaymentMethod() %></td>
</tr>
<% } %>
</table>
</div>
<% } else { %>
<div class="empty-state"><p>You haven't placed any orders yet.</p></div>
<% } %>

</body>
</html>