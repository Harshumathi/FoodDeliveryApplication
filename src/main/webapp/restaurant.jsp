<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List,com.pro1.dto.Cart,com.pro1.dto.CartItem" %>
	
	<%@ page import="java.util.List,com.pro1.dto.Restaurant" %>
<% 
			
Cart cartObj=(Cart) session.getAttribute("cart"); 
			
double subtotal=0.0; double tax=0.0; 
double deliveryFee=5.0; 
double total=0.0; 
int cartCount=0; 
if (cartObj !=null && cartObj.getItems() !=null) 
{
   subtotal=cartObj.getTotalPrice(); 
   tax=subtotal * 0.10; 
   total=subtotal + tax + deliveryFee; 
   for (CartItem item : cartObj.getItems().values()) 
     { 
         	cartCount +=item.getQuantity(); 
     } 
 }
%>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>ZUZU Eats | Premium Food Delivery</title>
			<link rel="stylesheet" href="css/style.css">

			<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
			<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
		</head>

		<body>

			<div class="app-container" >

				<!-- Navigation Bar -->
				<nav class="navbar">
					<a href="#" class="logo">
						<div class="logo-icon"><ion-icon name="fast-food"></ion-icon></div>
						ZUZU EATS
					</a>

					<ul class="nav-links">
						<li><a href="#" class="active">Restaurants</a></li>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="index.html">Sign Up</a></li>
						<li><a href="cart.jsp">Orders</a></li>
					</ul>

					<div class="nav-actions">
						<button class="icon-btn"><ion-icon name="search-outline"></ion-icon></button>
						<a href="cart.jsp">
							<button class="icon-btn cart-btn">
								<ion-icon name="cart-outline"></ion-icon>
								<span class="cart-badge"><%= cartCount %></span>
							</button>
						</a>
						
						<a href="login.jsp">
							<button class="icon-btn"><ion-icon name="person-outline"></ion-icon></button>
						</a>
						
					</div>
				</nav>

				<!-- Hero Section -->
				<header class="hero-banner">
					<!-- Slider Container -->
					<div class="hero-slider" id="heroSlider">
						<div class="hero-slide"></div>
						<div class="hero-slide"></div>
						<div class="hero-slide"></div>
					</div>

					<div class="hero-overlay"></div>

					<div class="hero-content">
						<h1>EXQUISITE FLAVORS<br>DELIVERED.</h1>
						<p>Order from top chefs & Michelin-starred restaurants.</p>
						<button class="btn-hero">Explore Collection</button>
					</div>

					<div class="hero-dots">
						<span class="dot active"></span>
						<span class="dot"></span>
						<span class="dot"></span>
					</div>
				</header>

				<script>
					// Simple Slideshow Script
					const slider = document.getElementById('heroSlider');
					const dots = document.querySelectorAll('.dot');
					let currentSlide = 0;
					const totalSlides = 3;

					function nextSlide() {
						currentSlide = (currentSlide + 1) % totalSlides;
						updateSlider();
					}

					function updateSlider() {
						// Move the slider
						slider.style.transform = "translateX(-" + (currentSlide * 100) + "%)";


						// Update dots
						dots.forEach(dot => dot.classList.remove('active'));
						dots[currentSlide].classList.add('active');
					}

					// Auto slide every 3 seconds
					setInterval(nextSlide, 3000);
				</script>

				<!-- Main Content -->

				<!-- Restaurant Grid -->
				<div class="restaurant-grid" id="restaurant-container">

					<%
List<Restaurant> allRestaurants =
        (List<Restaurant>) request.getAttribute("allRestaurants");

if (allRestaurants != null && !allRestaurants.isEmpty()) {
    for (Restaurant restaurant : allRestaurants) {
%>

<a href="menu?restaurantId=<%=restaurant.getRestaurant_Id()%>">
    <div class="restaurant-card">
        <div class="card-content-wrapper">
            <div class="card-image-container">
                <img src="<%=restaurant.getImage_Path()%>"
                     alt="<%=restaurant.getName()%>"
                     class="card-image">
            </div>

            <div class="card-info">
                <div class="card-header">
                    <h3 class="restaurant-name">
                        <%=restaurant.getName()%>
                    </h3>
                    <div class="rating-badge">
                        <ion-icon name="star"></ion-icon>
                        <%=restaurant.getRating()%>
                    </div>
                </div>

                <p class="cuisine-type">
                    <%=restaurant.getCuisine_Type()%>
                </p>

                <div class="meta-info">
                    <span class="time-badge">
                        <ion-icon name="time-outline"></ion-icon>
                        <%=restaurant.getDelivery_Time()%>
                    </span>
                    <span class="address">
                        <%=restaurant.getAddress()%>
                    </span>
                </div>
            </div>
        </div>
    </div>
</a>

<%
    } 
} else { 
%>

<p style="color:red; grid-column: 1/-1; text-align: center;">
    No restaurants available.
</p>

<%
}
%>

				</div>

			</div>
			<jsp:include page="/common-scripts.jsp" />
		</body>

		</html>