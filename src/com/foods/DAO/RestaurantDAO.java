package com.foods.DAO;

import java.util.List;
import com.foods.model.Restaurant;

public interface RestaurantDAO {
    boolean insertRestaurant(Restaurant restaurant);
    boolean updateRestaurant(Restaurant restaurant);
    boolean deleteRestaurant(int restaurantId);
    Restaurant getRestaurantById(int restaurantId);
    List<Restaurant> getAllRestaurants();
    List<Restaurant> getActiveRestaurants();
}