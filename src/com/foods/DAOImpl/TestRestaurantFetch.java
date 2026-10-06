package com.foods.DAOImpl;

import java.util.List;
import com.foods.model.Restaurant;

public class TestRestaurantFetch {
    public static void main(String[] args) {
        List<Restaurant> list = new RestaurantDAOImpl().getActiveRestaurants();
        System.out.println("Total restaurants found: " + list.size());
        for (Restaurant r : list) {
            System.out.println(r.getName() + " - " + r.getCuisineType() + " - Rating: " + r.getRating());
        }
    }
}