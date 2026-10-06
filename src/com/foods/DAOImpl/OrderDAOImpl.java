package com.foods.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foods.DAO.OrderDAO;
import com.foods.model.Order;
import com.foods.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public boolean insertOrder(Order order) {
        String sql = "INSERT INTO OrderTable (UserId, OrderDate, TotalAmount, Status, PaymentMethod, RestaurantId) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setTimestamp(2, order.getOrderDate());
            ps.setDouble(3, order.getTotalAmount());
            ps.setString(4, order.getStatus());
            ps.setString(5, order.getPaymentMethod());
            ps.setInt(6, order.getRestaurantId());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        order.setOrderId(rs.getInt(1));
                    }
                }
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderTable ORDER BY OrderId DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderId"));
                o.setUserId(rs.getInt("UserId"));
                o.setOrderDate(rs.getTimestamp("OrderDate"));
                o.setTotalAmount(rs.getDouble("TotalAmount"));
                o.setStatus(rs.getString("Status"));
                o.setPaymentMethod(rs.getString("PaymentMethod"));
                o.setRestaurantId(rs.getInt("RestaurantId"));
                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}