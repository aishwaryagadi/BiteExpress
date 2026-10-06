package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.foods.DAOImpl.UserDAOImpl;
import com.foods.model.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        UserDAOImpl dao = new UserDAOImpl();

        if (dao.phoneExists(phone)) {
            request.setAttribute("error", "Phone number already registered. Please login instead.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        User u = new User();
        u.setName(name);
        u.setPhone(phone);
        u.setPassword(password);
        u.setEmail(email);

        boolean success = dao.registerUser(u);

        if (success) {
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Signup failed. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}