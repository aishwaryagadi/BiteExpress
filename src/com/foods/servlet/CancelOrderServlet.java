package com.foods.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.foods.DAOImpl.OrderDAOImpl;
import com.foods.model.User;

@WebServlet("/cancelorder")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("myorders");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        new OrderDAOImpl().cancelOrder(id, user.getUserId());
        response.sendRedirect("orderdetails?id=" + id);
    }
}