package com.foods.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.foods.DAOImpl.OrderDAOImpl;
import com.foods.model.Order;
import com.foods.model.User;

@WebServlet("/myorders")
public class MyOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        List<Order> orders = new OrderDAOImpl().getOrdersByUser(user.getUserId());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/my_orders.jsp").forward(request, response);
    }
}