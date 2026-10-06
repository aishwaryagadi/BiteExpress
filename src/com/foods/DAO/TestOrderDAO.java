package com.foods.DAO;

import java.util.List;

import com.foods.DAOImpl.OrderDAOImpl;
import com.foods.model.Order;

public class TestOrderDAO {
    public static void main(String[] args) {
        OrderDAOImpl dao = new OrderDAOImpl();
        List<Order> list = dao.getAllOrders();
        for (Order o : list) {
            System.out.println(o.getOrderId() + " - " + o.getStatus());
        }
    }
}