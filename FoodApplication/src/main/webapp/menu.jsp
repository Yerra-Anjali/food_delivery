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
        width: 80%;
        margin: 0 auto;
        padding: 20px;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #f8f8f8, #e0e0e0);
        border-radius: 12px;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .menu-container:hover {
        transform: scale(1.02);
    }

    /* Heading style */
    .menu-container h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        background: linear-gradient(to right, #4CAF50, #66bb6a);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-weight: bold;
    }

    /* Styling for the table */
    .menu-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    /* Table header styles */
    .menu-table th {
        background: linear-gradient(45deg, #4CAF50, #66bb6a);
        color: white;
        padding: 12px;
        text-align: left;
        font-size: 16px;
    }

    /* Table row styles */
    .menu-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        color: #333;
    }

    /* Table row hover effect */
    .menu-table tr:hover {
        background: linear-gradient(45deg, #f0f9f0, #e0e5e0);
    }

    /* Menu image styling */
    .menu-image {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s;
    }

    .menu-image:hover {
        transform: scale(1.1);
    }

    /* Add to Cart button styling */
    .cart-btn {
        background: linear-gradient(to right, #4CAF50, #45a049);
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
        font-weight: bold;
    }

    .cart-btn:hover {
        background: linear-gradient(to right, #66bb6a, #4CAF50);
        transform: translateY(-2px);
    }

    /* Message when no menu is found */
    .no-menu-msg {
        color: red;
        text-align: center;
        font-size: 18px;
        margin-top: 20px;
    }

    /* Link to go back to restaurant selection */
    .back-link {
        display: inline-block;
        margin-top: 20px;
        text-align: center;
        background: linear-gradient(45deg, #4CAF50, #388e3c);
        color: white;
        padding: 12px 25px;
        border-radius: 8px;
        text-decoration: none;
        transition: background 0.3s, box-shadow 0.3s;
        font-weight: bold;
    }

    /* Hover effect for the back link */
    .back-link:hover {
        background: linear-gradient(45deg, #66bb6a, #4CAF50);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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

        <!-- Table to display the menu items -->
        <table class="menu-table">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Available</th>
                    <th>Image</th>
                    <th>Quantity</th> <!-- Added Quantity column -->
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through the menuList and display each item -->
                <%
                    for (Menu menu : menuList) {
                %>
                <tr>
                    <td><%= menu.getItemName() %></td> <!-- Display item name -->
                    <td><%= menu.getDiscription() %></td> <!-- Display description -->
                    <td>Rs:<%= menu.getPrice() %></td> <!-- Display price -->
                    <td><%= menu.isAvailable() ? "Yes" : "No" %></td> <!-- Display availability -->
                    <td>
                        <!-- If image path is available, display the image -->
                        <% if (menu.getImagePath() != null && !menu.getImagePath().isEmpty()) { %>
                            <img src="<%= menu.getImagePath() %>" alt="Menu Image" class="menu-image"/>
                        <% } else { %>
                            <span>No image available</span>
                        <% } %>
                    </td>
                    <td>
                        <!-- Quantity input field with min value of 1 -->
                        <input type="number" name="quantity" value="1" min="1" style="width: 50px;" form="cartForm<%= menu.getItemId() %>"> <!-- Form ID linked to each menu item -->
                    </td>
                    <td>
                        <!-- Add to Cart button -->
                        <form id="cartForm<%= menu.getItemId() %>" action="Cart?itemId=<%= menu.getItemId() %>" method="post"> <!-- Unique form ID per item -->
                            <input type="hidden" name="itemName" value="<%= menu.getItemName() %>">
                            <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                            <input type="hidden" name="act" value="add">
                            <input type="submit" value="Add to Cart" class="cart-btn">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } else {
                // Display a message if no menu items are found for the restaurant
        %>
            <p class="no-menu-msg">No menu items found for this restaurant.</p>
        <%
            }
        %>

        <!-- Optional: Link to go back to the restaurant selection page -->
        <p><a href="home.jsp" class="back-link">Go back to restaurant selection</a></p>
       
    </div>
</body>
</html>