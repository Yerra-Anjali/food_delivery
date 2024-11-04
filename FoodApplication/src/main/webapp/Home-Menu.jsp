<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.dto.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <style>
        /* Container for the entire menu */
        .menu-container {
            width: 90%; /* Increased width for better visibility */
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        /* Heading style */
        .menu-container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5rem; /* Larger heading */
        }

        /* Grid layout for cards */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* Responsive grid */
            gap: 20px; /* Spacing between cards */
        }

        /* Card styles */
        .menu-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s; /* Transition for shadow */
        }

        /* Card hover effect */
        .menu-card:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        /* Image styles */
        .menu-image {
            width: 100%; /* Full width of the card */
            height: 150px; /* Fixed height for uniformity */
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px; /* Space below the image */
        }

        /* Text container styles */
        .menu-text {
            margin-bottom: 10px; /* Space below text */
        }

        /* Add to Cart button styling */
        .cart-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s; /* Transition for background color and scaling */
            width: 100%; /* Full width button */
        }

        .cart-btn:hover {
            background-color: #45a049;
            transform: translateY(-2px); /* Lift effect on hover */
        }

        /* Message when no menu is found */
        .no-menu-msg {
            color: red;
            text-align: center;
            font-size: 1.5rem; /* Larger font size for message */
            margin-top: 20px;
        }

        /* Link to go back to restaurant selection */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s; /* Transition for background color and scaling */
        }

        /* Hover effect for the back link */
        .back-link:hover {
            background-color: #45a049;
            transform: translateY(-2px); /* Lift effect on hover */
        }
    </style>
</head>
<body>

    <div class="menu-container">
        <h1>Menu for Restaurant</h1>

        <!-- Retrieve the menuList from the session -->
        <%
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");

            if (menuList != null && !menuList.isEmpty()) {
        %>

        <!-- Display each menu item as a card in a grid -->
        <div class="menu-grid">
        <%
            for (Menu menu : menuList) {
        %>
        <div class="menu-card">
            <img src="<%= menu.getImagePath() != null && !menu.getImagePath().isEmpty() ? menu.getImagePath() : "default-image.jpg" %>" alt="Menu Image" class="menu-image"/> <!-- Fixed quote issue here -->
            <div class="menu-text">
                <h2><%= menu.getItemName() %></h2> <!-- Display item name -->
                <p><%= menu.getDiscription() %></p> <!-- Display description -->
                <p><strong>Price:</strong> Rs:<%= menu.getPrice() %></p> <!-- Display price -->
                <p><strong>Available:</strong> <%= menu.isAvailable() ? "Yes" : "No" %></p> <!-- Display availability -->
            </div>
            <div>
                <!-- Add to Cart button -->
                <form id="cartForm<%= menu.getItemId() %>" action="Cart?itemId=<%= menu.getItemId() %>" method="post"> <!-- Unique form ID per item -->
                    <input type="hidden" name="itemName" value="<%= menu.getItemName() %>">
                    <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                     
                </form>
            </div>
        </div>
        <%
            }
        %>
        </div> <!-- End of menu-grid -->

        <%
            } else {
                // Display a message if no menu items are found for the restaurant
        %>
            <p class="no-menu-msg">No menu items found for this restaurant.</p>
        <%
            }
        %>

        <!-- Optional: Link to go back to the restaurant selection page -->
        <p><a href="HomePage.jsp" class="back-link">Go back to restaurant selection</a></p>
       
    </div>
</body>
</html>