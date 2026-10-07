package com.foods.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.foods.DAOImpl.OrderDAOImpl;

@WebServlet("/admin/updateStatus")
public class AdminUpdateStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("orderId");
        String status = request.getParameter("status");

        if (idParam != null && status != null) {
            try {
                int orderId = Integer.parseInt(idParam);
                new OrderDAOImpl().updateOrderStatus(orderId, status);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}