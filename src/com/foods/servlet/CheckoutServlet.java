package com.foods.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import com.foods.DAOImpl.OrderDAOImpl;
import com.foods.DAOImpl.OrderItemDAOImpl;
import com.foods.model.CartItem;
import com.foods.model.OrderItem;
import com.foods.model.Order;
import com.foods.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String deliveryAddress = request.getParameter("deliveryAddress");

        double total = 0;
        for (CartItem item : cart) {
            total += item.getSubtotal();
        }

        Order order = new Order();
        order.setCustomerName(customerName);
        order.setCustomerPhone(customerPhone);
        order.setDeliveryAddress(deliveryAddress);
        order.setRestaurantId(restaurantId);
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setTotalAmount(total);
        order.setStatus("PLACED");
        order.setUserId(user.getUserId());
        order.setPaymentMethod("Cash on Delivery");

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        boolean orderSaved = orderDAO.insertOrder(order);

        if (orderSaved) {
            OrderItemDAOImpl itemDAO = new OrderItemDAOImpl();
            for (CartItem item : cart) {
                OrderItem oi = new OrderItem();
                oi.setOrderId(order.getOrderId());
                oi.setMenuId(item.getMenuId());
                oi.setQuantity(item.getQuantity());
                oi.setItemTotal(item.getSubtotal());
                itemDAO.insertOrderItem(oi);
            }
            session.removeAttribute("cart");
            request.setAttribute("orderId", order.getOrderId());
            request.setAttribute("totalAmount", total);
            request.getRequestDispatcher("orderconfirmation.jsp").forward(request, response);
        } else {
            response.sendRedirect("cart");
        }
    }
}