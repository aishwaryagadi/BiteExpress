package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import com.foods.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("remove".equals(action)) {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            cart.removeIf(item -> item.getMenuId() == menuId);

        } else if ("decrease".equals(action)) {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            for (CartItem item : cart) {
                if (item.getMenuId() == menuId) {
                    if (item.getQuantity() > 1) {
                        item.setQuantity(item.getQuantity() - 1);
                    } else {
                        cart.remove(item);
                    }
                    break;
                }
            }

        } else {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            String itemName = request.getParameter("itemName");
            double price = Double.parseDouble(request.getParameter("price"));
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            session.setAttribute("restaurantId", restaurantId);

            boolean found = false;
            for (CartItem item : cart) {
                if (item.getMenuId() == menuId) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                cart.add(new CartItem(menuId, itemName, price, 1));
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}