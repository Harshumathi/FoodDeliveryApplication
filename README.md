<img width="1899" height="863" alt="Screenshot 2026-01-19 213616" src="https://github.com/user-attachments/assets/ca2aa129-098d-4fc5-a9dc-8e2b42b5d923" />A premium, modern, and interactive food delivery web application with a robust MVC-based Java backend and visually striking neon-glass UI.

# ✨ Features

**Dynamic Restaurant Listing:** Browse curated restaurants with real-time search.
**Neon-Themed Menu:** Interactive menus with category filters and hover effects.
**Glassmorphic Cart:** Live item counting and automatic price calculations.
**Premium Checkout:** Multi-step checkout with delivery details and multiple payment options.
**Order Tracking:** Animated order confirmation and status updates.
**User Authentication:** Secure login/registration with gradient animations and floating labels.

# 🎨 Design Philosophy

**Glassmorphism:** Frosted glass effects using backdrop-filter: blur.
**Neon UI:** Vibrant neon accents for a futuristic feel.
**Micro-Animations:** Smooth transitions, hover effects, and interactive feedback.
**Responsive Layout:** Optimized for desktop, tablet, and mobile devices.

# 🛠️ Technology Stack

**Frontend:** HTML5, CSS3, JavaScript (ES6+), Ionicons
**Backend:** Java Servlets, JSP, DAO/DTO patterns, JDBC
**Automation:** Python scripts for menu image handling and data management

# 🏗️ Architecture (MVC)

**Controller:** Servlets (com.mainproject) handle requests like Cart, Checkout, Login, Menu, Restaurant.
**Model:** DAO, DTO, and connector classes (pro1) manage data and database interactions.
**View:** JSP/HTML (webapp) renders dynamic pages.

# 📁 Project Structure

**FoodOrderingAppl/
├── src/main/java/
│   ├── com.mainproject/  # Servlets
│   ├── pro1/             # DAO, DTO, Connector
│   └── jdbc/             # JDBC resources
├── webapp/               # Frontend assets & views
│   ├── assets/
│   ├── css/
│   ├── images/
│   ├── JS/
│   ├── WEB-INF/
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── index.html
│   ├── login.jsp
│   ├── menu.jsp
│   └── restaurant.jsp
└── README.md**
