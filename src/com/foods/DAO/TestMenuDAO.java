package com.foods.DAO;

import java.util.List;
import com.foods.DAOImpl.MenuDAOImpl;
import com.foods.model.Menu;

public class TestMenuDAO {
    public static void main(String[] args) {
        MenuDAOImpl dao = new MenuDAOImpl();
        List<Menu> list = dao.getAllMenus();
        for (Menu m : list) {
            System.out.println(m.getMenuId() + " - " + m.getItemName() + " - " + m.getPrice());
        }
    }
}
