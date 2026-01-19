package com.pro1.dao;

import java.util.List;

import com.pro1.dto.OrderItem;

public interface OrderItemDAO {
  List getOrderItems();
  OrderItem getOrderItem(int Order_Item_ID);
  boolean insertOrderItem(OrderItem oi);	
  boolean updateOrderItem(OrderItem oi);
  boolean deleteOrderItem(int Order_Item_ID);
}
