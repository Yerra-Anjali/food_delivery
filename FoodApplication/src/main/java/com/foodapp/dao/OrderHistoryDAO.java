package com.foodapp.dao;

import java.util.List;

import com.foodapp.dto.OrderHistory;

public interface OrderHistoryDAO {
	int insertOrderHistory(OrderHistory oHistory);
	OrderHistory getOrderHistoryById(int oId);
	int updateOrderHistoryById(int oHistoryId, String status);
	List<OrderHistory> getOrderHistoryByUserId(int userId);
	
}