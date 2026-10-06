package com.foods.DAO;

import java.util.List;
import com.foods.DAOImpl.OrderItemDAOImpl;
import com.foods.model.OrderItem;

public class TestOrderItemDAO {
    public static void main(String[] args) {
        OrderItemDAOImpl dao = new OrderItemDAOImpl();
        List<OrderItem> list = dao.getItemsByOrder(1);
        for (OrderItem oi : list) {
            System.out.println(oi.getOrderItemId() + " - MenuId:" + oi.getMenuId() + " - Qty:" + oi.getQuantity() + " - Total:" + oi.getItemTotal());
        }
    }
}
