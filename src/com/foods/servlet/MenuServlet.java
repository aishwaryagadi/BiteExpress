package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.foods.DAOImpl.MenuDAOImpl;
import com.foods.model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        MenuDAOImpl dao = new MenuDAOImpl();
        List<Menu> menuList = dao.getMenusByRestaurant(restaurantId);

        request.setAttribute("menuList", menuList);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}