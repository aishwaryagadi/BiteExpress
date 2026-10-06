package com.foods.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foods.DAO.OrderItemDAO;
import com.foods.model.OrderItem;
import com.foods.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public boolean insertOrderItem(OrderItem oi) {
        String sql = "INSERT INTO OrderItem (OrderID, MenuID, Quantity, ItemTotal) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, oi.getOrderId());
            ps.setInt(2, oi.getMenuId());
            ps.setInt(3, oi.getQuantity());
            ps.setDouble(4, oi.getItemTotal());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateOrderItem(OrderItem oi) {
        String sql = "UPDATE OrderItem SET OrderID=?, MenuID=?, Quantity=?, ItemTotal=? WHERE OrderItemID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, oi.getOrderId());
            ps.setInt(2, oi.getMenuId());
            ps.setInt(3, oi.getQuantity());
            ps.setDouble(4, oi.getItemTotal());
            ps.setInt(5, oi.getOrderItemId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteOrderItem(int orderItemId) {
        String sql = "DELETE FROM OrderItem WHERE OrderItemID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderItemId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public OrderItem getOrderItemById(int orderItemId) {
        String sql = "SELECT * FROM OrderItem WHERE OrderItemID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<OrderItem> getItemsByOrder(int orderId) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderItem WHERE OrderID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private OrderItem mapRow(ResultSet rs) throws SQLException {
        OrderItem oi = new OrderItem();
        oi.setOrderItemId(rs.getInt("OrderItemID"));
        oi.setOrderId(rs.getInt("OrderID"));
        oi.setMenuId(rs.getInt("MenuID"));
        oi.setQuantity(rs.getInt("Quantity"));
        oi.setItemTotal(rs.getDouble("ItemTotal"));
        return oi;
    }
}