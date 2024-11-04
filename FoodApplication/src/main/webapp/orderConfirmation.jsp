<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.dto.OrderItem" %>
<%@ page import="com.foodapp.dto.User" %>

<%
    // Fetch session attributes
    User user = (User) session.getAttribute("user");
    List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
    String orderId = request.getParameter("orderId");

    // Redirect to login page if user is not logged in
    if (user == null) {
        response.sendRedirect("Login.jsp?error=Please log in to view your order confirmation.");
        return;
    }

    // Check if orderItems are present
    if (orderItems == null || orderItems.isEmpty()) {
        response.sendRedirect("menu.jsp?error=No order items found for this order.");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h1 {
            text-align: center;
            color: #28a745;
            font-size: 2.5rem;
            margin-bottom: 20px;
            animation: zoomIn 0.8s ease;
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        p {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 20px;
        }

        strong {
            color: #28a745;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            opacity: 0;
            transform: translateY(30px);
            animation: cardSlideUp 0.7s forwards;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        @keyframes cardSlideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card h3 {
            margin: 0 0 10px;
            font-size: 1.4rem;
            color: #333;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        .total-amount {
            text-align: center;
            font-size: 1.5rem;
            color: #333;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #28a745;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.2rem;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn:active {
            transform: scale(0.98);
        }

        .message {
            text-align: center;
            font-size: 1.2rem;
            color: #555;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank You for Your Order!</h1>

        <p>Order ID: <strong><%= orderId %></strong></p>
        <p>Hello, <strong><%= user.getUser_name() %></strong></p>

        <h2>Order Summary</h2>
        <div class="card-container">
            <%
                int totalAmount = 0;
                for (OrderItem item : orderItems) {
                    totalAmount += item.getSubTotal();
            %>
            <div class="card">
                <h3>Item: <%= item.getmItemId() %> <!-- Replace with item name if necessary --></h3>
                <p>Quantity: <%= item.getQuntity() %></p>
                <p>Price: Rs <%= item.getSubTotal() / item.getQuntity() %></p>
                <p>Subtotal: Rs <%= item.getSubTotal() %></p>
            </div>
            <% } %>
        </div>

        <div class="total-amount">
            <h3>Total Amount: Rs <%= totalAmount %></h3>
        </div>

        <h2>What's Next?</h2>
        <p>Your order is currently being processed. We will notify you when it's ready for delivery or pickup.</p>

        <p class="message">If you have any questions, feel free to <a href="contact.jsp">contact us</a>.</p>

        <a href="menu.jsp" class="btn">Continue Shopping</a>
    </div>
</body>
</html>