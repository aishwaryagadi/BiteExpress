   package com.foods.DAO;

   import java.util.List;
   import com.foods.model.Order;

   public interface OrderDAO {
       boolean insertOrder(Order order);
       List<Order> getAllOrders();
   }