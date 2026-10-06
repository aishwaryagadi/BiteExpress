package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.foods.DAOImpl.UserDAOImpl;
import com.foods.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        UserDAOImpl dao = new UserDAOImpl();
        User u = dao.loginUser(phone, password);

        if (u != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", u);
            response.sendRedirect("restaurants");
        } else {
            request.setAttribute("error", "Invalid phone or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}