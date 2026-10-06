package com.foods.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foods.DAO.RestaurantDAO;
import com.foods.model.Restaurant;
import com.foods.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public boolean insertRestaurant(Restaurant r) {
        String sql = "INSERT INTO Restaurant (Name, CuisineType, DeliveryTime, Address, Rating, IsActive, ImagePath) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setInt(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setDouble(5, r.getRating());
            ps.setBoolean(6, r.isActive());
            ps.setString(7, r.getImagePath());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateRestaurant(Restaurant r) {
        String sql = "UPDATE Restaurant SET Name=?, CuisineType=?, DeliveryTime=?, Address=?, Rating=?, IsActive=?, ImagePath=? WHERE RestaurantID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setInt(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setDouble(5, r.getRating());
            ps.setBoolean(6, r.isActive());
            ps.setString(7, r.getImagePath());
            ps.setInt(8, r.getRestaurantId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteRestaurant(int restaurantId) {
        String sql = "DELETE FROM Restaurant WHERE RestaurantID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        String sql = "SELECT * FROM Restaurant WHERE RestaurantID=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM Restaurant";
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
    public List<Restaurant> getActiveRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM Restaurant WHERE IsActive = true";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Restaurant mapRow(ResultSet rs) throws SQLException {
        Restaurant r = new Restaurant();
        r.setRestaurantId(rs.getInt("RestaurantID"));
        r.setName(rs.getString("Name"));
        r.setCuisineType(rs.getString("CuisineType"));
        r.setDeliveryTime(rs.getInt("DeliveryTime"));
        r.setAddress(rs.getString("Address"));
        r.setRating(rs.getDouble("Rating"));
        r.setActive(rs.getBoolean("IsActive"));
        r.setImagePath(rs.getString("ImagePath"));
        return r;
    }
}
