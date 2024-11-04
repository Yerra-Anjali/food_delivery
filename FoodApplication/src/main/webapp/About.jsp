<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - FoodApp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .section {
            padding: 60px 0;
            background-color: #f0f4f8;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .banner {
            background: linear-gradient(135deg, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
            color: #fff;
            text-align: center;
            padding: 100px 20px;
            position: relative;
        }
        .banner::before {
            content: '';
            background-image: url('./images/banner-bg.png'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            opacity: 0.2;
            z-index: 0;
        }
        .banner h2, .banner p {
            position: relative;
            z-index: 1;
        }
        .team-member {
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 30px;
        }
        .team-member:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }
        footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s forwards;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .testimonials {
            background-color: #f0f4f8;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .icon {
            font-size: 40px;
            color: #5A6268;
            transition: color 0.3s;
        }
        .icon:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

    <header class="bg-dark text-white text-center py-3">
        <h1>FoodApp</h1>
    </header>

    <section class="banner fade-in">
        <h2>About Us</h2>
        <p>We are passionate about delivering the best food experience.</p>
    </section>

    <section class="section fade-in">
        <div class="container text-center">
            <h2>About FoodApp</h2>
            <p>
                At FoodApp, we believe in the power of food to connect people and enrich lives. Founded by a team of food enthusiasts, our goal is to revolutionize the dining experience by making it easier and more enjoyable for everyone.
            </p>
            <p>
                Our platform offers a seamless connection between food lovers and the best local restaurants. We take pride in showcasing a diverse range of culinary options, ensuring that there is something for every taste and occasion.
            </p>
            <p>
                We are committed to supporting local businesses and fostering community connections. Join us on this delicious journey, and let’s explore the vibrant world of food together!
            </p>
            <div class="mt-4">
                <i class="fas fa-utensils icon"></i>
                <i class="fas fa-heart icon mx-3"></i>
                <i class="fas fa-globe icon"></i>
            </div>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container text-center">
            <h2>Our Mission</h2>
            <p>
                At FoodApp, our mission is to connect food lovers with the best local restaurants. We believe in quality, freshness, and a diverse menu that satisfies every palate. Our platform is designed with our users in mind, bringing you the best dining options at the touch of a button.
            </p>
            <p>
                We take pride in our commitment to sustainable practices. By supporting local businesses, we not only provide you with fresh ingredients but also contribute to the local economy. Join us on our culinary journey!
            </p>
            <div class="mt-4">
                <i class="fas fa-bicycle icon"></i>
                <i class="fas fa-leaf icon mx-3"></i>
                <i class="fas fa-users icon"></i>
            </div>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container text-center">
            <h2>Our Values</h2>
            <p>At FoodApp, our core values guide every decision we make and shape our culture.</p>
            <ul class="list-unstyled">
                <li><strong>Quality:</strong> We prioritize fresh ingredients and high standards.</li>
                <li><strong>Community:</strong> Supporting local businesses is at the heart of our mission.</li>
                <li><strong>Innovation:</strong> We're always looking for ways to improve your experience.</li>
                <li><strong>Integrity:</strong> We believe in honesty and transparency.</li>
                <li><strong>Customer Focus:</strong> Our users are our top priority.</li>
            </ul>
            <p>These values are the principles that drive our daily actions and decisions.</p>
            <div class="mt-4">
                <i class="fas fa-star icon"></i>
                <i class="fas fa-hand-holding-heart icon mx-3"></i>
                <i class="fas fa-sync-alt icon"></i>
            </div>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container text-center">
            <h2>Meet Our Team</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-member">
                        
                        <h4>Anju</h4>
                        <p>CEO & Founder</p>
                        <p>Anju is a visionary leader with a passion for food and technology.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        
                        <h4>Rohith</h4>
                        <p>Chief Technology Officer</p>
                        <p>Anju brings a wealth of technical expertise to the team.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        
                        <h4>Sam</h4>
                        <p>Head of Marketing</p>
                        <p>Anju is the creative force behind FoodApp’s marketing strategies.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container text-center testimonials">
            <h2>Customer Testimonials</h2>
            <p>"FoodApp has transformed the way I order food! The variety and quality are unmatched!" - <em>Rita</em></p>
            <p>"I love supporting local restaurants through FoodApp! The app is easy to use." - <em>James</em></p>
            <p>"The service is fantastic! I've had nothing but great experiences!" - <em>Alice</em></p>
            <p>"FoodApp has made my life so much easier. I can explore new restaurants!" - <em>Mark</em></p>
            <p>"The delivery is fast, and the food always arrives hot and fresh. Highly recommend!" - <em>Sara</em></p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container text-center">
            <h2>Join Us</h2>
            <p>If you are passionate about food and technology, consider joining our team! We offer competitive salaries, benefits, and a chance to work
             with some of the brightest minds in the industry.</p>
            <p>Check out our <a href="careers.jsp">Careers</a> page for current openings.</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>