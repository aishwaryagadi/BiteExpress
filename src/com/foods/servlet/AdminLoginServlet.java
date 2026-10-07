package com.foods.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String ADMIN_USER = "admin";
    private static final String ADMIN_PASS = "12345";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("adminLoggedIn");
            }
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }
        request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        if (ADMIN_USER.equals(user) && ADMIN_PASS.equals(pass)) {
            request.getSession().setAttribute("adminLoggedIn", true);
            response.sendRedirect(request.getContextPath() + "/admin/orders");
        } else {
            request.setAttribute("error", "Wrong username or password");
            request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
        }
    }
}