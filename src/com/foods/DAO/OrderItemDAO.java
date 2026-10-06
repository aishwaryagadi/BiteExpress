package com.foods.DAO;

import java.util.List;
import com.foods.model.OrderItem;

public interface OrderItemDAO {
    boolean insertOrderItem(OrderItem item);
    boolean updateOrderItem(OrderItem item);
    boolean deleteOrderItem(int orderItemId);
    OrderItem getOrderItemById(int orderItemId);
    List<OrderItem> getItemsByOrder(int orderId);
}
