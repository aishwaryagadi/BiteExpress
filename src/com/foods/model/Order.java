package com.foods.model;

public class Order {
    private int orderId;
    private String customerName;
    private String customerPhone;
    private String deliveryAddress;
    private int restaurantId;
    private double totalAmount;
    private String status;
    private int userId;
    private java.sql.Timestamp orderDate;
    private String paymentMethod;

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public java.sql.Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(java.sql.Timestamp orderDate) { this.orderDate = orderDate; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }

    public String getDeliveryAddress() { return deliveryAddress; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}