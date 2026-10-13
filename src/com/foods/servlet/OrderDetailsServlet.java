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
import com.foods.DAOImpl.OrderItemDAOImpl;
import com.foods.model.Order;
import com.foods.model.OrderLine;
import com.foods.model.User;

@WebServlet("/orderdetails")
public class OrderDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            response.sendRedirect("myorders");
            return;
        }

        // Only look in this user's own orders, so nobody can open someone else's order
        Order found = null;
        for (Order o : new OrderDAOImpl().getOrdersByUser(user.getUserId())) {
            if (o.getOrderId() == id) {
                found = o;
                break;
            }
        }

        if (found == null) {
            response.sendRedirect("myorders");
            return;
        }

        List<OrderLine> items = new OrderItemDAOImpl().getLinesByOrder(id);
        request.setAttribute("order", found);
        request.setAttribute("items", items);
        request.getRequestDispatcher("/order_details.jsp").forward(request, response);
    }
}