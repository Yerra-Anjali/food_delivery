package com.foodapp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoImpl.OrderItemDAOImpl;
import com.foodapp.dto.OrderItem;


@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Initialize the DAO for Order Items
    private OrderItemDAOImpl orderItemDAO;

    public ViewServlet() {
        super();
        orderItemDAO = new OrderItemDAOImpl();  // Initialize DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the orderId from the request
        String orderIdParam = request.getParameter("orderId");
        int orderId = -1;

        try {
            orderId = Integer.parseInt(orderIdParam); // Parse orderId
        } catch (NumberFormatException e) {
            response.sendRedirect("orderHistory.jsp?error=Invalid Order ID");
            return;
        }

        // Get the list of OrderItems for this orderId
        List<OrderItem> orderItems = orderItemDAO.getOrderItemByOrderId(orderId);

        if (orderItems != null && !orderItems.isEmpty()) {
            // Add the orderItems to the session
            HttpSession session = request.getSession();
            session.setAttribute("orderItems", orderItems);  // Store the order items in session

            // Redirect to a JSP page that will display the order items
            response.sendRedirect("viewOrderDetails.jsp");
        } else {
            // If no items found for the orderId, redirect back with an error message
            response.sendRedirect("ooorderHistory.jsp?error=No items found for this order");
        }
    }
}