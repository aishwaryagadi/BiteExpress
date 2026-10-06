package com.foods.DAOImpl;

import java.sql.*;

import com.foods.DAO.UserDAO;
import com.foods.model.User;
import com.foods.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public boolean registerUser(User u) {
        String sql = "INSERT INTO users (Name, Phone, Password, Email) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getPhone());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getEmail());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User loginUser(String phone, String password) {
        String sql = "SELECT * FROM users WHERE Phone=? AND Password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, phone);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserId"));
                u.setName(rs.getString("Name"));
                u.setPhone(rs.getString("Phone"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean phoneExists(String phone) {
        String sql = "SELECT UserId FROM users WHERE Phone=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
