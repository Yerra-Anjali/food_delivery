<%@ page session="true" %>
<%@ page import="com.foodapp.daoImpl.Cart, com.foodapp.dto.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        /* Base styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: slideUp 1s ease-out;
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 30px;
            animation: zoomIn 1.2s ease;
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .checkout-section {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="radio"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
        }

        .payment-options {
            margin-bottom: 20px;
        }

        .confirm-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #28a745;
            color: white;
            border: none;
            text-align: center;
            border-radius: 5px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            position: relative;
            z-index: 1;
        }

        .confirm-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .confirm-btn:active {
            transform: scale(0.98);
        }

        /* Section for the total amount */
        .total-section {
            background-color: #e9ffe9;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 30px;
            text-align: center;
            font-size: 1.5rem;
            color: #333;
            transition: transform 0.5s ease;
        }

        .total-section:hover {
            transform: scale(1.02);
            background-color: #daf7da;
        }

        /* Animation when confirming payment */
        .confirmation-message {
            display: none;
            text-align: center;
            font-size: 1.8rem;
            color: #4CAF50;
            margin-top: 30px;
            animation: bounceIn 1s ease forwards;
        }

        @keyframes bounceIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Go back to menu link */
        .back-link {
            display: inline-block;
            margin-top: 30px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .back-link:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Checkout</h1>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            double total = 0;
            if (cart != null && !cart.getItems().isEmpty()) {
                for (CartItem item : cart.getItems().values()) {
                    total += item.getQuantity() * item.getPrice();
                }
        %>
        <!-- Total Amount Section -->
        <div class="total-section">
            <h3>Total Amount: Rs <%= total %></h3>
        </div>

        <!-- Checkout Form -->
        <form id="checkoutForm" action="OrderServlet" method="post">
            <!-- Address Section -->
            <div class="checkout-section">
                <label for="address">Delivery Address</label>
                <input type="text" name="address" id="address" placeholder="Enter your delivery address" required>
            </div>

            <!-- Payment Options -->
            <div class="checkout-section payment-options">
                <label>Payment Mode</label>
                <input type="radio" name="paymentMode" value="Cash on Delivery" required> Cash on Delivery<br>
                <input type="radio" name="paymentMode" value="Card" required> Card<br>
                <input type="radio" name="paymentMode" value="UPI" required> UPI
            </div>

            <!-- Confirm Payment Button -->
            <button type="submit" class="confirm-btn">Confirm Payment</button>
        </form>

        <!-- Confirmation message will appear here after submitting -->
        <div id="confirmationMessage" class="confirmation-message">
            Payment confirmed! Thank you for your order.
        </div>

        <%
            } else {
        %>
            <p>Your cart is empty. <a href="menu.jsp">Go back to the menu</a> to add items to your cart.</p>
        <%
            }
        %>

        <!-- Back to Menu Link -->
        <p><a href="menu.jsp" class="back-link">Back to Menu</a></p>
    </div>

    <!-- JavaScript to handle animation after form submission -->
    <script>
        document.getElementById('checkoutForm').addEventListener('submit', function(event) {
            event.preventDefault();
            document.getElementById('confirmationMessage').style.display = 'block';
            setTimeout(() => {
                this.submit();
            }, 2000); // Simulate a 2-second delay before actual form submission
        });
    </script>
</body>
</html>