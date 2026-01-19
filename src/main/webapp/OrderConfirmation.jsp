<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List,com.pro1.dto.Order" %>
	
<%
Order order = (Order) request.getAttribute("order");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZUZU Eats - Order Confirmed</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body class="cart-page-bg">

    <div class="confirmation-container">

        <div class="confirmation-wrapper">

            <!-- 1. Success Animation -->
            <div class="success-anim">
                <ion-icon name="checkmark-circle" class="success-icon-large"></ion-icon>
            </div>

            <!-- 2. Neon Text -->
            <h1 class="order-title-neon">Order Placed!</h1>
            <p class="order-subtitle">Your delicious food is being prepared.</p>

            <!-- 3. Tracking Map Visual -->
            <div class="tracking-map-visual">
                <!-- Grid background via CSS -->

                <!-- The Path -->
                <div class="map-path"></div>

                <!-- The Rider Icon Animation -->
                <div class="map-rider">
                    <ion-icon name="bicycle"></ion-icon>
                    <div
                        style="font-size:0.6rem; background:white; color:black; padding:2px 5px; border-radius:4px; position:absolute; top:-20px; left:50%; transform:translateX(-50%); white-space:nowrap; font-weight:bold;">
                        You</div>
                </div>
            </div>

            <!-- 4. Order Details Glass Card -->
            <div class="order-details-glass">
                <div class="detail-row-shine">
                    <span style="opacity:0.7;">Order ID</span>
                    <span style="font-weight:700; font-family:monospace; font-size:1.1rem;">#FDA-<%= session.getAttribute("lastOrderId") %></span>
                </div>
                <div class="detail-row-shine">
                    <span style="opacity:0.7;">Estimated Time</span>
                    <span style="color:#00ff88; font-weight:600;">30 - 45 mins</span>
                </div>
                <div class="detail-row-shine">
    <span style="opacity:0.7;">Payment</span>
    <span style="color:#00ff88; font-weight:600;">
        <%= (order != null) ? order.getStatus() : "Paid Successfully" %>
        <ion-icon name="checkmark-circle-outline"
            style="vertical-align:middle; color:#00ff88;"></ion-icon>
    </span>
</div>
            </div>

            <!-- 5. Action Buttons -->
            <button class="btn-track">Track Order</button>

            <div style="margin-top:10px;">
                <a href="restaurant" class="btn-home-ghost">Back to Home</a>
            </div>

        </div>

    </div>
<jsp:include page="/common-scripts.jsp" />
</body>

</html>