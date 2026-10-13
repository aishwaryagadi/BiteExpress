package com.foods.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static String adminUser;
    private static String adminPass;

    static {
        Properties props = new Properties();
        try (InputStream in = AdminLoginServlet.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (in == null) {
                throw new RuntimeException("db.properties not found");
            }
            props.load(in);
        } catch (IOException e) {
            throw new RuntimeException("Could not read db.properties", e);
        }
        adminUser = props.getProperty("admin.username");
        adminPass = props.getProperty("admin.password");
    }

    private static boolean same(String a, String b) {
        if (a == null || b == null) {
            return false;
        }
        return MessageDigest.isEqual(
                a.getBytes(StandardCharsets.UTF_8),
                b.getBytes(StandardCharsets.UTF_8));
    }

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

        if (same(adminUser, user) && same(adminPass, pass)) {
            request.changeSessionId();
            request.getSession().setAttribute("adminLoggedIn", true);
            response.sendRedirect(request.getContextPath() + "/admin/orders");
        } else {
            request.setAttribute("error", "Wrong username or password");
            request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
        }
    }
}