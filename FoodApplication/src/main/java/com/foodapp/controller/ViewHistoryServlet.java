package com.foodapp.controller;



import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.daoImpl.OrderHistoryDAOImpl;
import com.foodapp.dto.OrderHistory;
import com.foodapp.dto.User;


@WebServlet("/viewHistory")
public class ViewHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assume user ID is stored in session after login
        User user = (User) request.getSession().getAttribute("user");

        // Fetch the order history for the user
        OrderHistoryDAO orderDAO = new OrderHistoryDAOImpl();
        List<OrderHistory> orderHistory = orderDAO.getOrderHistoryByUserId(user.getUser_id());
        
        // Set the order history as request attribute
        request.setAttribute("orderHistory", orderHistory);
        
        // Forward the request to the JSP page for displaying order history
        request.getRequestDispatcher("ooorderHistory.jsp").forward(request, response);
    }
}