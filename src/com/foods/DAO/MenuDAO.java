package com.foods.DAO;

import java.util.List;
import com.foods.model.Menu;

public interface MenuDAO {
    boolean insertMenu(Menu menu);
    boolean updateMenu(Menu menu);
    boolean deleteMenu(int menuId);
    Menu getMenuById(int menuId);
    List<Menu> getAllMenus();
    List<Menu> getMenusByRestaurant(int restaurantId);
}
