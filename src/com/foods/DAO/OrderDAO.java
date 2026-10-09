package com.foods.DAO;

import java.util.List;
import com.foods.model.Order;

public interface OrderDAO {
    boolean insertOrder(Order order);
    List<Order> getAllOrders();
    boolean updateOrderStatus(int orderId, String status);
    List<Order> getOrdersByUser(int userId);
}