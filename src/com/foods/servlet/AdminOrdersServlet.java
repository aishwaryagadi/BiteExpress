package com.foods.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.foods.DAOImpl.OrderDAOImpl;
import com.foods.model.Order;

@WebServlet("/admin/orders")
public class AdminOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAOImpl dao = new OrderDAOImpl();
        List<Order> orderList = dao.getAllOrders();

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/admin_orders.jsp").forward(request, response);
    }
}