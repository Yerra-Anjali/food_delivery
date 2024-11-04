<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,java.util.Set,java.util.HashSet" %>
<%@ page import="com.foodapp.dto.Restaraunt,com.foodapp.daoImpl.Cart " %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food App - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Arial:wght@400&family=Verdana:wght@400&display=swap" rel="stylesheet">

    <style>
    /* Navbar Styling with Vibrant Gradient Background and Logo Animation */
    .navbar {
        background: linear-gradient(90deg, #ff5f6d, #ffc371);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        transition: background-color 0.5s ease-in-out;
    }

    .navbar:hover {
        background: linear-gradient(90deg, #ffc371, #ff5f6d);
    }

    .navbar .logo {
        font-size: 2rem;
        color: #ffffff;
        font-weight: bold;
        transition: transform 0.4s ease-in-out;
        letter-spacing: 2px;
    }

    .navbar .logo .bi-basket3 {
        font-size: 2.5rem;
        margin-right: 15px;
        color: #ffffff;
        transition: color 0.4s ease-in-out, transform 0.4s ease;
    }

    .navbar:hover .logo .bi-basket3 {
        color: #0d6efd;
        transform: rotate(15deg);
    }

    .navbar-nav .nav-link {
        color: #fff !important;
        padding: 10px 20px;
        transition: color 0.4s ease-in-out, border 0.4s;
        position: relative;
    }

    .navbar-nav .nav-link::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 2px;
        background-color: #ffffff;
        bottom: 0;
        left: 0;
        transform: scaleX(0);
        transform-origin: bottom right;
        transition: transform 0.4s ease-out;
    }

    .navbar-nav .nav-link:hover::after {
        transform: scaleX(1);
        transform-origin: bottom left;
    }

    .navbar-nav .nav-link:hover {
        color: #ffc107 !important;
    }

    /* Body Background */
    body {
        background: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
        font-family: 'Arial', sans-serif;
        color: #495057;
    }

    /* Jumbotron with Original Styling (No Gradient Overlay) */
    .jumbotron {
        background: url('https://t3.ftcdn.net/jpg/08/58/72/10/240_F_858721061_sgbB6ZbGYtPNCWEZXg961pd3VM4Ncx7z.jpg') no-repeat center center fixed;
        background-size: cover;
        padding: 100px 0;
        text-align: center;
        margin-bottom: 30px;
        border-radius: 20px;
        box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.5);
    }

    .jumbotron h1 {
        font-size: 3.8em;
        color: white;
        position: relative;
        font-weight: bold;
        text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
    }

    .jumbotron p {
        font-size: 1.6em;
        color: #ffdd59;
        position: relative;
        font-weight: bold;
        text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.3);
        margin-top: 20px;
    }

    /* Card Styling with Soft Shadows and Hover Animation */
    .card {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100%;
        border-radius: 15px;
        background-color: #ffffff;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }

    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 15px 15px 0 0;
    }

    .card-body {
        flex-grow: 1;
        padding: 20px;
        text-align: center;
    }

    .card-body h3 {
        font-size: 1.5em;
        margin-bottom: 15px;
        color: #343a40;
    }

    .card-body p {
        font-size: 1.1em;
        color: #6c757d;
        min-height: 40px;
    }

    .view-menu-btn {
        background: linear-gradient(45deg, #6f42c1, #007bff);
        color: white;
        border: none;
        border-radius: 30px;
        padding: 10px 30px;
        transition: background 0.4s ease, transform 0.3s ease;
    }

    .view-menu-btn:hover {
        background: linear-gradient(45deg, #007bff, #6f42c1);
        transform: scale(1.05);
        color: white;
    }

    /* Slide-In Animation */
    .slideIn {
        animation: slideIn 0.7s ease-in-out forwards;
    }

    @keyframes slideIn {
        from {
            transform: translateY(30px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    /* Styling Testimonials and Contact Sections */
    .testimonial, .contact {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .testimonial:hover, .contact:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
    }
</style>

</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand logo" href="About.jsp">
                <i class="bi bi-basket3"></i> FoodApp
            </a>
            <div class="navbar-nav">
                <a href="LoginPage.html" class="nav-link btn btn-success mx-2">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </a>
                <a href="RegisterPage.html" class="nav-link btn btn-primary">
                    <i class="bi bi-person-plus"></i> Register
                </a>
            </div>
        </div>
    </nav>

    <!-- Jumbotron Section -->
    <div class="jumbotron">
        <div class="container">
            <h1>Welcome to the QuickBite Service</h1>
            <p>Order your favorite food from top restaurants near you</p>
        </div>
    </div>

    <!-- Restaurant Details Section -->
    <div class="container my-5">
        <div class="row">
            <% 
                ArrayList<Restaraunt> restaurantList = (ArrayList<Restaraunt>) session.getAttribute("restaurantList");
                if (restaurantList != null && !restaurantList.isEmpty()) {
                    Set<String> restaurantNames = new HashSet<>();
                    for (Restaraunt res : restaurantList) {
                        if (!restaurantNames.contains(res.getname())) {
                            restaurantNames.add(res.getname());
            %>
                            <div class="col-md-4 mb-4">
                                <div class="card fadeIn">
                                    <img src="<%= res.getimgPath() %>" alt="Image of <%= res.getname() %>">
                                    <div class="card-body">
                                        <h3><%= res.getname() %></h3>
                                        <p><strong>Cuisine:</strong> <%= res.getCusineType() %></p>
                                        <p><strong>Delivery Time:</strong> <%= res.getDeliveryTime() %> mins</p>
                                        <p><strong>Rating:</strong> ⭐⭐⭐⭐</p>
                                        <a href="MenuServlet?restaurantId=<%= res.getrId() %>" class="btn view-menu-btn">View Menu</a>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                    }
                } else {
            %>
                <p class="text-center">No restaurants available at the moment.</p>
            <%
                }
            %>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="container my-5">
        <h2 class="text-center">What Our Customers Say</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"Great food and fast delivery!" - John Doe</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"I love the variety of cuisines!" - Jane Smith</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"Always my go-to app for food!" - Alice Brown</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="container my-5">
        <h2 class="text-center">Contact Us</h2>
        <div class="contact fadeIn">
            <p>If you have any questions or feedback, feel free to reach out to us:</p>
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>