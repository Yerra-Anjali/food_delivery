<%@ page session="true" %>
<%@ page import="com.foodapp.daoImpl.Cart, com.foodapp.dto.CartItem,com.foodapp.dto.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* Body background with light grey color */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    /* Container for central layout with shadow and plain background */
    .container {
        width: 80%;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 12px; 
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
    }

    /* Heading with simple styling */
    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
        font-weight: bold;
    }

    /* Cart card styling with plain light background and shadow */
    .cart-card {
        border: none;
        border-radius: 10px;
        padding: 15px;
        background-color: #fafafa;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s, transform 0.3s;
        margin-bottom: 20px;
    }

    /* Card hover effect with larger shadow */
    .cart-card:hover {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        transform: translateY(-5px);
    }

    /* Rounded corners for images */
    .cart-card img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
    }

    /* Cart total text styling */
    .cart-total {
        font-size: 1.6em;
        color: #444;
        text-align: center;
        margin-top: 15px;
    }

    /* Cart actions with button styling */
    .cart-actions .btn {
        text-decoration: none;
        margin: 5px;
        padding: 10px 25px;
        border-radius: 8px;
        color: #fff;
        background-color: #007bff; /* Primary button color */
        transition: transform 0.3s;
        font-weight: bold;
    }

    /* Default hover effect for all buttons */
    .cart-actions .btn:hover {
        background-color: #0056b3; /* Darker color on hover */
        transform: scale(1.05);
    }

    /* Empty cart message with fade-in animation */
    .empty-cart {
        text-align: center;
        font-size: 1.2em;
        margin-top: 20px;
        color: #555;
        opacity: 0;
        animation: fadeIn 1s forwards;
    }

    /* Fade-in animation for empty cart */
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
</style>

</head>
<body>
    <div class="container">
        <h1>Your Cart</h1>
        <%
        	Menu menu=new Menu();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        %>
        <div class="row">
            <%
                double total = 0;
                for (CartItem item : cart.getItems().values()) {
                    double itemTotal = item.getQuantity() * item.getPrice();
                    total += itemTotal;
            %>
            <div class="col-md-4">
                <div class="cart-card">
                    <img src="<%= item.getImgPath() != null ? item.getImgPath() : "https://via.placeholder.com/150" %>" alt="<%= item.getName() %>">
                    <h3><%= item.getName() %></h3>
                    <p class="price">Price: Rs <%= String.format("%.2f", item.getPrice()) %></p>
                    <p class="total">Total: Rs <%= String.format("%.2f", itemTotal) %></p>
                    <form action="Cart" method="post" style="display:inline-block;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control" style="width: 100px; display: inline-block;">
                        <input type="hidden" name="act" value="update">
                        <input type="hidden" name="act" value="delete">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                    <form action="Cart" method="post" style="display:inline-block;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="hidden" name="act" value="remove">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
        <div class="cart-total text-right">
            <h3>Total: Rs <%= String.format("%.2f", total) %></h3>
        </div>
        <%
            } else {
        %>
        <p class="empty-cart">Your cart is empty. Start shopping now!</p>
        <%
            }
        %>
        <div class="cart-actions text-center">
            <a href="menu.jsp" class="btn btn-secondary">Continue Shopping</a>
            <a href="checkout.jsp" class="btn checkout-btn">Proceed to Checkout</a>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>