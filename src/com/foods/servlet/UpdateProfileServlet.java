package com.foods.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.foods.DAOImpl.UserDAOImpl;
import com.foods.model.User;

@WebServlet("/updateprofile")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("profile.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        name = (name == null) ? "" : name.trim();
        email = (email == null) ? "" : email.trim();

        if (name.isEmpty() || name.length() > 60 || email.length() > 100
                || (!email.isEmpty() && !email.contains("@"))) {
            response.sendRedirect("profile.jsp?error=1");
            return;
        }

        // The user id comes from the session, never from the form
        boolean ok = new UserDAOImpl().updateProfile(user.getUserId(), name, email);

        if (ok) {
            user.setName(name);
            user.setEmail(email);
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("profile.jsp?saved=1");
        } else {
            response.sendRedirect("profile.jsp?error=1");
        }
    }
}