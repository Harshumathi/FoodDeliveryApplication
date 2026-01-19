<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.pro1.dto.Cart, com.pro1.dto.CartItem" %>

        <% Cart cart=(Cart) session.getAttribute("cart"); double subtotal=0.0; double tax=0.0; double delivery=5.0;
            double total=0.0; if (cart==null || cart.getItems()==null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp"); return; } if (cart !=null && cart.getItems() !=null) { for (CartItem item
            : cart.getItems().values()) { subtotal +=item.getPrice() * item.getQuantity(); } tax=subtotal * 0.10;
            total=subtotal + tax + delivery; } %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>ZUZU Eats - Checkout</title>
                <link rel="stylesheet" href="css/style.css">
                <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
            </head>

            <body class="cart-page-bg">

                <!-- LOGIC: Calculate Cart Count -->
                <% int cartCount=0; if (cart !=null && cart.getItems() !=null) { for (CartItem item :
                    cart.getItems().values()) { cartCount +=item.getQuantity(); } } %>

                    <!-- NAVBAR: Consistent with Menu/Cart Pages -->
                    <nav class="navbar"
                        style="background: rgba(0,0,0,0.5); backdrop-filter: blur(10px); width: 100%; position:fixed; top:0; z-index:100; padding: 1rem 5%;">
                        <a href="restaurant.jsp" class="logo"
                            style="color:white; font-size:1.5rem; font-weight:bold; text-decoration:none;">FoodDelivery</a>
                        <ul class="nav-links"
                            style="list-style:none; display:flex; gap:2rem; margin-left:auto; align-items:center;">
                            <li><a href="restaurant.jsp" style="color:white; text-decoration:none;">Restaurants</a></li>
                            <li>
                                <a href="cart.jsp"
                                    style="color: #FF9966; text-decoration:none; display:flex; align-items:center; gap:5px;">
                                    <ion-icon name="cart"></ion-icon> Cart (<%= cartCount %>)
                                </a>
                            </li>
                        </ul>
                    </nav>

                    <div class="app-container" style="padding-top: 80px;">

                        <div style="text-align: center; margin: 30px 0;">
                            <!-- Using white text with shadow for visibility on the blurred bg -->
                            <h1
                                style="color: white; font-size: 2.5rem; text-shadow: 0 2px 10px rgba(0,0,0,0.3); font-weight: 700;">
                                Secure Checkout <ion-icon name="lock-closed"
                                    style="font-size: 0.8em; color: #E100FF;"></ion-icon>
                            </h1>
                        </div>

                        <form action="checkout" method="post">
                            <div class="checkout-grid-glass">

                                <!-- LEFT COLUMN: Forms -->
                                <div style="display: flex; flex-direction: column; gap: 2rem;">

                                    <!-- 1. Delivery Details -->
                                    <div class="light-glass-card" style="display: block;">
                                        <div class="glass-header">
                                            <div class="step-number">1</div>
                                            <h2 style="margin:0; font-size:1.5rem; font-weight: 700;">Delivery Details
                                            </h2>
                                        </div>

                                        <div class="glass-input-group">
                                            <input type="text" id="fullname" name="fullname" class="glass-input"
                                                placeholder=" " required>
                                            <label for="fullname" class="glass-label">Full Name</label>
                                        </div>

                                        <div class="glass-input-group">
                                            <input type="text" id="address" name="address" class="glass-input"
                                                placeholder=" " required>
                                            <label for="address" class="glass-label">Street Address</label>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                                            <div class="glass-input-group">
                                                <input type="text" id="city" name="city" class="glass-input"
                                                    placeholder=" " required>
                                                <label for="city" class="glass-label">City</label>
                                            </div>
                                            <div class="glass-input-group">
                                                <input type="text" id="zip" name="zip" class="glass-input"
                                                    placeholder=" " required>
                                                <label for="zip" class="glass-label">Zip Code</label>
                                            </div>
                                        </div>

                                        <div class="glass-input-group" style="margin-bottom:0;">
                                            <input type="tel" id="phone" name="phone" class="glass-input"
                                                placeholder=" " required>
                                            <label for="phone" class="glass-label">Phone Number</label>
                                        </div>
                                    </div>

                                    <!-- 2. Payment Method -->
                                    <div class="light-glass-card" style="display: block;">
                                        <div class="glass-header">
                                            <div class="step-number">2</div>
                                            <h2 style="margin:0; font-size:1.5rem; font-weight: 700;">Payment Method
                                            </h2>
                                        </div>

                                        <div class="payment-grid-glass">
                                            <!-- Card -->
                                            <label class="payment-option-glass">
                                                <input type="radio" name="paymentMethod" value="card" checked>
                                                <div class="payment-card-box">
                                                    <ion-icon name="card-outline"></ion-icon>
                                                    <span style="font-weight:600; color:#333;">Card</span>
                                                </div>
                                            </label>

                                            <!-- UPI -->
                                            <label class="payment-option-glass">
                                                <input type="radio" name="paymentMethod" value="upi">
                                                <div class="payment-card-box">
                                                    <ion-icon name="qr-code-outline"></ion-icon>
                                                    <span style="font-weight:600; color:#333;">UPI</span>
                                                </div>
                                            </label>

                                            <!-- COD -->
                                            <label class="payment-option-glass">
                                                <input type="radio" name="paymentMethod" value="cod">
                                                <div class="payment-card-box">
                                                    <ion-icon name="cash-outline"></ion-icon>
                                                    <span style="font-weight:600; color:#333;">Cash</span>
                                                </div>
                                            </label>
                                        </div>

                                        <!-- Card Inputs -->
                                        <div class="glass-input-group">
                                            <input type="text" class="glass-input" placeholder="xxxx xxxx xxxx xxxx">
                                            <label class="glass-label">Card Number</label>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                                            <div class="glass-input-group">
                                                <input type="text" class="glass-input" placeholder="MM/YY">
                                                <label class="glass-label">Expiry</label>
                                            </div>
                                            <div class="glass-input-group">
                                                <input type="text" class="glass-input" placeholder="123">
                                                <label class="glass-label">CVV</label>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <!-- RIGHT COLUMN: Summary -->
                                <div class="checkout-sidebar">
                                    <div class="light-glass-summary" style="top: 40px;">
                                        <h3
                                            style="color:white; border-bottom:1px solid rgba(255,255,255,0.3); padding-bottom:15px; margin-bottom:15px;">
                                            Order Summary</h3>

                                        <!-- Dynamic Items -->
                                        <% if (cart !=null && !cart.getItems().isEmpty()) { for (CartItem item :
                                            cart.getItems().values()) { %>

                                            <div class="summary-item-row">
                                                <div style="display:flex; align-items:center;">
                                                    <span class="summary-item-qty" style="margin-right:10px;">
                                                        <%= item.getQuantity() %>x
                                                    </span>
                                                    <img src="<%=item.getImagePath()%>" alt="<%=item.getName()%>"
                                                        class="checkout-item-img"
                                                        onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c'">
                                                    <span class="summary-item-name" style="margin-left:0;">
                                                        <%= item.getName() %>
                                                    </span>
                                                </div>
                                                <span>₹<%= String.format("%.2f", item.getPrice() * item.getQuantity())
                                                        %></span>
                                            </div>

                                            <% } } %>

                                                <div style="margin-top: 20px;">
                                                    <div class="summary-row-light">
                                                        <span>Subtotal</span>
                                                        <span>₹<%= String.format("%.2f", subtotal) %></span>
                                                    </div>
                                                    <div class="summary-row-light">
                                                        <span>Delivery</span>
                                                        <span>₹<%= String.format("%.2f", delivery) %></span>
                                                    </div>
                                                    <div class="summary-row-light">
                                                        <span>Tax (10%)</span>
                                                        <span>₹<%= String.format("%.2f", tax) %></span>
                                                    </div>

                                                    <div class="summary-row-light">
                                                        <span>Total</span>
                                                        <span style="font-size:1.4rem; font-weight:700;">₹<%=
                                                                String.format("%.2f", total) %></span>
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn-checkout-orange">
                                                    Place Order <ion-icon name="arrow-forward"
                                                        style="vertical-align:middle;"></ion-icon>
                                                </button>

                                                <div
                                                    style="text-align: center; margin-top: 15px; color: rgba(255,255,255,0.7); font-size: 0.9rem;">
                                                    <ion-icon name="shield-checkmark"
                                                        style="vertical-align: middle;"></ion-icon> 100% Secure Payment
                                                </div>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
<jsp:include page="/common-scripts.jsp" />
            </body>

            </html>