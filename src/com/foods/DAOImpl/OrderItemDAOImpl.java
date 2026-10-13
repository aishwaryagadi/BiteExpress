package com.foods.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foods.model.OrderLine;
import com.foods.util.DBConnection;

public class OrderItemDAOImpl {

    public List<OrderLine> getLinesByOrder(int orderId) {
        List<OrderLine> list = new ArrayList<>();
        String sql = "SELECT m.ItemName, m.Price, oi.Quantity, oi.ItemTotal "
                   + "FROM orderitem oi JOIN menu m ON oi.MenuId = m.MenuID "
                   + "WHERE oi.OrderId = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderLine line = new OrderLine();
                    line.setItemName(rs.getString("ItemName"));
                    line.setPrice(rs.getDouble("Price"));
                    line.setQuantity(rs.getInt("Quantity"));
                    line.setItemTotal(rs.getDouble("ItemTotal"));
                    list.add(line);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}