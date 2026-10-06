package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import com.foods.DAOImpl.RestaurantDAOImpl;
import com.foods.model.Restaurant;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RestaurantServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RestaurantDAOImpl dao = new RestaurantDAOImpl();
        List<Restaurant> restaurantList = dao.getAllRestaurants();

        request.setAttribute("restaurantList", restaurantList);
        request.getRequestDispatcher("restaurants.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}