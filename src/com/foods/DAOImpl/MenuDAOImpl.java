package com.foods.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foods.DAO.MenuDAO;
import com.foods.model.Menu;
import com.foods.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public boolean insertMenu(Menu m) {
        String sql = "INSERT INTO Menu (RestaurantID, ItemName, Description, Price, IsAvailable, ImagePath) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setString(3, m.getDescription());
            ps.setDouble(4, m.getPrice());
            ps.setBoolean(5, m.isAvailable());
            ps.setString(6, m.getImagePath());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateMenu(Menu m) {
        String sql = "UPDATE Menu SET RestaurantID=?, ItemName=?, Description=?, Price=?, IsAvailable=?, ImagePath=? WHERE MenuID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setString(3, m.getDescription());
            ps.setDouble(4, m.getPrice());
            ps.setBoolean(5, m.isAvailable());
            ps.setString(6, m.getImagePath());
            ps.setInt(7, m.getMenuId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteMenu(int menuId) {
        String sql = "DELETE FROM Menu WHERE MenuID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, menuId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Menu getMenuById(int menuId) {
        String sql = "SELECT * FROM Menu WHERE MenuID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Menu> getAllMenus() {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM Menu";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Menu> getMenusByRestaurant(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM Menu WHERE RestaurantID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Menu mapRow(ResultSet rs) throws SQLException {
        Menu m = new Menu();
        m.setMenuId(rs.getInt("MenuID"));
        m.setRestaurantId(rs.getInt("RestaurantID"));
        m.setItemName(rs.getString("ItemName"));
        m.setDescription(rs.getString("Description"));
        m.setPrice(rs.getDouble("Price"));
        m.setCategory(rs.getString("Category"));
        m.setAvailable(rs.getBoolean("IsAvailable"));
        m.setImagePath(rs.getString("ImagePath"));
        return m;
    }
}
