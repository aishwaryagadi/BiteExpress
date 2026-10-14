package com.foods.DAOImpl;

import java.sql.*;

import at.favre.lib.crypto.bcrypt.BCrypt;

import com.foods.DAO.UserDAO;
import com.foods.model.User;
import com.foods.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public boolean registerUser(User u) {
        String sql = "INSERT INTO users (Name, Phone, Password, Email) VALUES (?, ?, ?, ?)";
        String hash = BCrypt.withDefaults().hashToString(12, u.getPassword().toCharArray());
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getPhone());
            ps.setString(3, hash);
            ps.setString(4, u.getEmail());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User loginUser(String phone, String password) {
        String sql = "SELECT * FROM users WHERE Phone=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("UserId");
                String stored = rs.getString("Password");
                boolean ok;

                if (stored != null && stored.startsWith("$2")) {
                    ok = BCrypt.verifyer().verify(password.toCharArray(), stored).verified;
                } else {
                    ok = stored != null && stored.equals(password);
                    if (ok) {
                        upgradePassword(con, userId, password);
                    }
                }

                if (ok) {
                    User u = new User();
                    u.setUserId(userId);
                    u.setName(rs.getString("Name"));
                    u.setPhone(rs.getString("Phone"));
                    u.setEmail(rs.getString("Email"));
                    return u;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void upgradePassword(Connection con, int userId, String plain) throws SQLException {
        String hash = BCrypt.withDefaults().hashToString(12, plain.toCharArray());
        try (PreparedStatement ps = con.prepareStatement("UPDATE users SET Password=? WHERE UserId=?")) {
            ps.setString(1, hash);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
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

    // Updates only name and email, for the user with this id
    public boolean updateProfile(int userId, String name, String email) {
        String sql = "UPDATE users SET Name=?, Email=? WHERE UserId=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}