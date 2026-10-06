package com.foods.DAOImpl;

import java.util.List;
import com.foods.model.Menu;

public class TestMenuFetch {
    public static void main(String[] args) {
        List<Menu> list = new MenuDAOImpl().getAllMenus();
        System.out.println("Total menu items found: " + list.size());
        for (Menu m : list) {
            System.out.println(m.getItemName() + " - " + m.getCategory() + " - Rs." + m.getPrice());
        }
    }
}