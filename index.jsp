<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaBite - Royal Food Ordering Experience</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Cormorant+Garamond:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Cormorant Garamond', serif;
            background: #000;
            color: #fff;
            overflow-x: hidden;
        }

        /* Animated Background Particles */
        .royal-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(ellipse at center, #0f1628 0%, #000000 100%);
            z-index: -1;
        }

        .particle {
            position: absolute;
            width: 3px;
            height: 3px;
            background: #ffd700;
            border-radius: 50%;
            animation: float-particle 20s infinite ease-in-out;
            opacity: 0.6;
        }

        @keyframes float-particle {
            0%, 100% { 
                transform: translateY(0) translateX(0);
                opacity: 0;
            }
            10% { opacity: 0.6; }
            50% { 
                transform: translateY(-100vh) translateX(50px);
                opacity: 0.8;
            }
            90% { opacity: 0.6; }
        }

        /* Ultra Royal Navigation */
        .imperial-nav {
            background: linear-gradient(135deg, rgba(15,22,40,0.98), rgba(10,15,30,0.98));
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 3px solid;
            border-image: linear-gradient(90deg, transparent, #ffd700, #ffed4e, #ffd700, transparent) 1;
            backdrop-filter: blur(20px);
            box-shadow: 0 10px 40px rgba(255,215,0,0.2);
        }

        .nav-royal-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
        }

        .imperial-logo {
            font-family: 'Cinzel', serif;
            font-size: 40px;
            font-weight: 700;
            background: linear-gradient(135deg, #ffd700 0%, #ffed4e 50%, #ffd700 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: 4px;
            text-shadow: 0 0 30px rgba(255,215,0,0.5);
            position: relative;
            animation: glow-pulse 2s infinite;
        }

        .imperial-logo::before {
            content: '👑';
            position: absolute;
            left: -50px;
            animation: crown-spin 4s infinite;
        }

        @keyframes crown-spin {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(15deg); }
        }

        @keyframes glow-pulse {
            0%, 100% { filter: drop-shadow(0 0 10px rgba(255,215,0,0.5)); }
            50% { filter: drop-shadow(0 0 30px rgba(255,215,0,0.9)); }
        }

        .imperial-nav-links {
            display: flex;
            gap: 45px;
        }

        .imperial-nav-links a {
            color: #e8e8e8;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            transition: all 0.4s;
            position: relative;
            padding: 8px 0;
        }

        .imperial-nav-links a::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, #ffd700, transparent);
            transition: width 0.4s;
        }

        .imperial-nav-links a:hover {
            color: #ffd700;
            text-shadow: 0 0 15px rgba(255,215,0,0.6);
        }

        .imperial-nav-links a:hover::before {
            width: 100%;
        }

        .royal-welcome {
            color: #ffd700;
            font-size: 18px;
            font-style: italic;
            text-shadow: 0 0 10px rgba(255,215,0,0.4);
        }

        /* MAJESTIC HERO */
        .supreme-hero {
            height: 100vh;
            background: 
                linear-gradient(135deg, rgba(10,15,30,0.85), rgba(30,40,80,0.85)),
                url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=1920') center/cover fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .supreme-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(ellipse at 30% 50%, rgba(255,215,0,0.15), transparent),
                radial-gradient(ellipse at 70% 50%, rgba(255,215,0,0.15), transparent);
            animation: hero-glow 8s infinite alternate;
        }

        @keyframes hero-glow {
            0% { opacity: 0.3; }
            100% { opacity: 0.7; }
        }

        .hero-royal-content {
            position: relative;
            z-index: 2;
            max-width: 1000px;
            padding: 60px;
        }

        .crown-massive {
            font-size: 120px;
            animation: crown-float 4s ease-in-out infinite;
            filter: drop-shadow(0 0 40px rgba(255,215,0,0.8));
        }

        @keyframes crown-float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            25% { transform: translateY(-30px) rotate(-5deg); }
            75% { transform: translateY(-30px) rotate(5deg); }
        }

        .hero-imperial-title {
            font-family: 'Cinzel', serif;
            font-size: 85px;
            font-weight: 700;
            background: linear-gradient(135deg, #ffd700, #fffacd, #ffd700, #ffed4e, #ffd700);
            background-size: 200% auto;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 30px 0;
            letter-spacing: 6px;
            text-transform: uppercase;
            animation: gradient-slide 3s linear infinite;
            filter: drop-shadow(0 0 40px rgba(255,215,0,0.6));
            line-height: 1.2;
        }

        @keyframes gradient-slide {
            0% { background-position: 0% 50%; }
            100% { background-position: 200% 50%; }
        }

        .hero-royal-subtitle {
            font-size: 28px;
            color: #e8e8e8;
            font-style: italic;
            margin-bottom: 50px;
            line-height: 1.8;
            text-shadow: 0 0 20px rgba(0,0,0,0.5);
            letter-spacing: 1px;
        }

        .hero-royal-buttons {
            display: flex;
            gap: 30px;
            justify-content: center;
        }

        .btn-supreme {
            padding: 22px 60px;
            background: linear-gradient(135deg, #ffd700, #ffed4e, #ffd700);
            background-size: 200% auto;
            color: #000;
            text-decoration: none;
            border-radius: 60px;
            font-weight: bold;
            font-size: 20px;
            letter-spacing: 2px;
            transition: all 0.4s;
            box-shadow: 
                0 15px 50px rgba(255,215,0,0.4),
                inset 0 -5px 20px rgba(0,0,0,0.2);
            border: 3px solid rgba(255,255,255,0.3);
            position: relative;
            overflow: hidden;
            animation: btn-glow 2s infinite;
        }

        @keyframes btn-glow {
            0%, 100% { box-shadow: 0 15px 50px rgba(255,215,0,0.4); }
            50% { box-shadow: 0 20px 60px rgba(255,215,0,0.7); }
        }

        .btn-supreme::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.3), transparent);
            transform: rotate(45deg);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { transform: translateX(-100%) rotate(45deg); }
            100% { transform: translateX(100%) rotate(45deg); }
        }

        .btn-supreme:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 25px 70px rgba(255,215,0,0.6);
        }

        .btn-royal-outline {
            padding: 22px 60px;
            background: transparent;
            color: #ffd700;
            text-decoration: none;
            border-radius: 60px;
            font-weight: bold;
            font-size: 20px;
            letter-spacing: 2px;
            border: 3px solid #ffd700;
            transition: all 0.4s;
            box-shadow: 0 0 30px rgba(255,215,0,0.3);
            position: relative;
            overflow: hidden;
        }

        .btn-royal-outline::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,215,0,0.3), transparent);
            transition: left 0.5s;
        }

        .btn-royal-outline:hover::before {
            left: 100%;
        }

        .btn-royal-outline:hover {
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            color: #000;
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 25px 70px rgba(255,215,0,0.6);
        }

        /* LUXURIOUS FEATURES */
        .royal-features {
            background: linear-gradient(180deg, #000, #0f1628, #000);
            padding: 120px 40px;
            position: relative;
        }

        .section-imperial-title {
            font-family: 'Cinzel', serif;
            font-size: 60px;
            font-weight: 700;
            background: linear-gradient(135deg, #ffd700, #ffed4e, #ffd700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin-bottom: 25px;
            letter-spacing: 4px;
            text-transform: uppercase;
            filter: drop-shadow(0 0 30px rgba(255,215,0,0.5));
        }

        .section-imperial-subtitle {
            font-size: 24px;
            color: #b8b8b8;
            text-align: center;
            max-width: 900px;
            margin: 0 auto 80px;
            line-height: 2;
            font-style: italic;
        }

        .features-imperial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 50px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .feature-royal-card {
            background: linear-gradient(135deg, rgba(20,30,60,0.5), rgba(10,15,30,0.5));
            padding: 50px 40px;
            border-radius: 25px;
            border: 2px solid rgba(255,215,0,0.3);
            transition: all 0.5s;
            position: relative;
            overflow: hidden;
        }

        .feature-royal-card::before {
            content: '';
            position: absolute;
            top: -100%;
            left: -100%;
            width: 300%;
            height: 300%;
            background: radial-gradient(circle, rgba(255,215,0,0.15), transparent);
            transition: all 0.8s;
        }

        .feature-royal-card:hover::before {
            top: -50%;
            left: -50%;
            transform: rotate(180deg);
        }

        .feature-royal-card:hover {
            transform: translateY(-15px);
            border-color: #ffd700;
            box-shadow: 
                0 30px 60px rgba(255,215,0,0.3),
                inset 0 0 40px rgba(255,215,0,0.1);
        }

        .feature-royal-icon {
            font-size: 80px;
            margin-bottom: 25px;
            filter: drop-shadow(0 0 20px rgba(255,215,0,0.4));
            animation: icon-bounce 3s infinite;
        }

        @keyframes icon-bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        .feature-royal-title {
            font-family: 'Cinzel', serif;
            font-size: 28px;
            color: #ffd700;
            margin-bottom: 20px;
            letter-spacing: 2px;
        }

        .feature-royal-desc {
            color: #c8c8c8;
            line-height: 1.8;
            font-size: 18px;
        }

        /* DIVINE MENU SECTION */
        .divine-menu {
            background: linear-gradient(180deg, #000, #0f1628);
            padding: 120px 40px;
        }

        .category-royal-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 40px;
            max-width: 1400px;
            margin: 0 auto 100px;
        }

        .category-royal-box {
            background: linear-gradient(135deg, rgba(30,40,80,0.6), rgba(10,15,30,0.6));
            padding: 50px 30px;
            border-radius: 20px;
            border: 3px solid rgba(255,215,0,0.4);
            text-align: center;
            cursor: pointer;
            transition: all 0.5s;
            text-decoration: none;
            display: block;
            position: relative;
            overflow: hidden;
        }

        .category-royal-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,215,0,0.2), transparent);
            transition: left 0.6s;
        }

        .category-royal-box:hover::before {
            left: 100%;
        }

        .category-royal-box:hover {
            border-color: #ffd700;
            transform: scale(1.08) translateY(-10px);
            box-shadow: 
                0 25px 60px rgba(255,215,0,0.4),
                inset 0 0 50px rgba(255,215,0,0.1);
        }

        .category-royal-icon {
            font-size: 90px;
            margin-bottom: 20px;
            filter: drop-shadow(0 0 25px rgba(255,215,0,0.5));
            animation: category-float 3s ease-in-out infinite;
        }

        @keyframes category-float {
            0%, 100% { transform: translateY(0) scale(1); }
            50% { transform: translateY(-20px) scale(1.1); }
        }

        .category-royal-name {
            font-family: 'Cinzel', serif;
            font-size: 30px;
            color: #ffd700;
            margin-bottom: 12px;
            letter-spacing: 2px;
        }

        .category-royal-desc {
            color: #c8c8c8;
            font-style: italic;
            font-size: 16px;
        }

        /* FOOD CARDS - ULTRA LUXURY */
        .food-divine-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 50px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .food-divine-card {
            background: linear-gradient(135deg, rgba(20,30,60,0.7), rgba(10,15,30,0.7));
            border-radius: 25px;
            overflow: hidden;
            border: 2px solid rgba(255,215,0,0.3);
            transition: all 0.5s;
            position: relative;
        }

        .food-divine-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,215,0,0.1), transparent);
            opacity: 0;
            transition: opacity 0.5s;
        }

        .food-divine-card:hover::after {
            opacity: 1;
        }

        .food-divine-card:hover {
            transform: translateY(-15px) scale(1.02);
            border-color: #ffd700;
            box-shadow: 
                0 35px 80px rgba(255,215,0,0.4),
                inset 0 0 60px rgba(255,215,0,0.1);
        }

        .food-img-divine {
            position: relative;
            height: 280px;
            overflow: hidden;
        }

        .food-img-divine img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s;
            filter: brightness(0.9);
        }

        .food-divine-card:hover .food-img-divine img {
            transform: scale(1.15) rotate(2deg);
            filter: brightness(1.1);
        }

        .food-divine-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            color: #000;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: bold;
            font-size: 14px;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(255,215,0,0.5);
            animation: badge-pulse 2s infinite;
        }

        @keyframes badge-pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .food-divine-info {
            padding: 35px;
        }

        .food-divine-name {
            font-family: 'Cinzel', serif;
            font-size: 28px;
            color: #ffd700;
            margin-bottom: 15px;
            letter-spacing: 2px;
        }

        .food-divine-desc {
            color: #b8b8b8;
            margin-bottom: 25px;
            line-height: 1.8;
            font-size: 17px;
        }

        .food-divine-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .food-divine-price {
            font-family: 'Cinzel', serif;
            font-size: 34px;
            color: #ffd700;
            font-weight: bold;
            text-shadow: 0 0 20px rgba(255,215,0,0.5);
        }

        .add-divine-form {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .qty-divine {
            width: 65px;
            padding: 12px;
            background: rgba(255,255,255,0.1);
            border: 2px solid #ffd700;
            color: #fff;
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        .btn-add-divine {
            padding: 14px 32px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            color: #000;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.4s;
            box-shadow: 0 10px 30px rgba(255,215,0,0.4);
            letter-spacing: 1px;
        }

        .btn-add-divine:hover {
            transform: scale(1.1);
            box-shadow: 0 15px 45px rgba(255,215,0,0.6);
        }

        /* CATEGORY SECTION TITLES */
        .category-display-title {
            font-family: 'Cinzel', serif;
            font-size: 50px;
            background: linear-gradient(135deg, #ffd700, #ffed4e, #ffd700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin: 80px 0 50px;
            letter-spacing: 3px;
            text-transform: uppercase;
            filter: drop-shadow(0 0 25px rgba(255,215,0,0.5));
        }

        /* IMPERIAL FOOTER */
        .imperial-footer {
            background: linear-gradient(180deg, #0f1628, #000);
            padding: 80px 40px 40px;
            border-top: 3px solid;
            border-image: linear-gradient(90deg, transparent, #ffd700, transparent) 1;
        }

        .footer-imperial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 60px;
            max-width: 1400px;
            margin: 0 auto 50px;
        }

        .footer-imperial-section h3 {
            font-family: 'Cinzel', serif;
            color: #ffd700;
            font-size: 28px;
            margin-bottom: 25px;
            letter-spacing: 2px;
        }

        .footer-imperial-section p,
        .footer-imperial-section a {
            color: #b8b8b8;
            line-height: 2.2;
            text-decoration: none;
            display: block;
            transition: all 0.3s;
            font-size: 17px;
        }

        .footer-imperial-section a:hover {
            color: #ffd700;
            text-shadow: 0 0 15px rgba(255,215,0,0.5);
            transform: translateX(10px);
        }

        .footer-imperial-bottom {
            text-align: center;
            padding-top: 40px;
            border-top: 1px solid rgba(255,215,0,0.3);
            color: #888;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <div class="royal-bg">
        <div class="particle" style="left: 10%; animation-delay: 0s;"></div>
        <div class="particle" style="left: 20%; animation-delay: 2s;"></div>
        <div class="particle" style="left: 30%; animation-delay: 4s;"></div>
        <div class="particle" style="left: 40%; animation-delay: 1s;"></div>
        <div class="particle" style="left: 50%; animation-delay: 3s;"></div>
        <div class="particle" style="left: 60%; animation-delay: 5s;"></div>
        <div class="particle" style="left: 70%; animation-delay: 2.5s;"></div>
        <div class="particle" style="left: 80%; animation-delay: 4.5s;"></div>
        <div class="particle" style="left: 90%; animation-delay: 1.5s;"></div>
    </div>

    <!-- Imperial Navigation -->
    <nav class="imperial-nav">
        <div class="nav-royal-container">
            <div class="imperial-logo">JAVABITE</div>
            <div class="imperial-nav-links">
                <a href="home">HOME</a>
                <a href="menu">MENU</a>
                <a href="cart">CART</a>
                <a href="order">ORDERS</a>
                <a href="logout">LOGOUT</a>
            </div>
            <div class="royal-welcome">Welcome, ${userName}</div>
        </div>
    </nav>

    <!-- Supreme Hero -->
    <section class="supreme-hero">
        <div class="hero-royal-content">
            <div class="crown-massive">👑</div>
            <h1 class="hero-imperial-title">JavaBite Royal</h1>
            <p class="hero-royal-subtitle">Online food ordering system to enjoy your favorite meals anytime and anywhere with ease and convenience.</p>
            <div class="hero-royal-buttons">
                <a href="menu" class="btn-supreme">EXPLORE MENU</a>
                <a href="cart" class="btn-royal-outline">VIEW CART</a>
            </div>
        </div>
    </section>

    <!-- Royal Features -->
    <section class="royal-features">
        <h2 class="section-imperial-title">Royal Excellence</h2>
        <p class="section-imperial-subtitle">Indulge in an unparalleled dining experience crafted with precision, passion, and premium ingredients</p>
        <div class="features-imperial-grid">
            <div class="feature-royal-card">
                <div class="feature-royal-icon">🍽️</div>
                <h3 class="feature-royal-title">Premium Quality</h3>
                <p class="feature-royal-desc">Handpicked ingredients sourced globally and prepared by master chefs to ensure royal standards</p>
            </div>
            <div class="feature-royal-card">
                <div class="feature-royal-icon">⚡</div>
                <h3 class="feature-royal-title">Swift Delivery</h3>
                <p class="feature-royal-desc">Hot gourmet meals delivered within 30 minutes with temperature-controlled packaging</p>
            </div>
            <div class="feature-royal-card">
                <div class="feature-royal-icon">🔒</div>
                <h3 class="feature-royal-title">Secure Payments</h3>
                <p class="feature-royal-desc">Multiple payment options with military-grade encryption for absolute peace of mind</p>
            </div>
        </div>
    </section>

    <!-- Divine Menu -->
    <section class="divine-menu">
        <h2 class="section-imperial-title">Royal Menu</h2>
        <div class="category-royal-grid">
            <a href="menu?category=Starters" class="category-royal-box">
                <div class="category-royal-icon">🥗</div>
                <div class="category-royal-name">STARTERS</div>
                <p class="category-royal-desc">Exquisite Appetizers</p>
            </a>
            <a href="menu?category=Main Course" class="category-royal-box">
                <div class="category-royal-icon">🍛</div>
                <div class="category-royal-name">MAIN COURSE</div>
                <p class="category-royal-desc">Signature Delicacies</p>
            </a>
            <a href="menu?category=Desserts" class="category-royal-box">
                <div class="category-royal-icon">🍰</div>
                <div class="category-royal-name">DESSERTS</div>
                <p class="category-royal-desc">Divine Confections</p>
            </a>
            <a href="menu?category=Drinks" class="category-royal-box">
                <div class="category-royal-icon">🥤</div>
                <div class="category-royal-name">BEVERAGES</div>
                <p class="category-royal-desc">Premium Refreshments</p>
            </a>
        </div>

        

    <!-- Imperial Footer -->
    <footer class="imperial-footer">
        <div class="footer-imperial-grid">
            <div class="footer-imperial-section">
                <h3>👑 JAVABITE ROYAL</h3>
                <p>Premium culinary excellence delivered with imperial service and unmatched quality</p>
            </div>
            <div class="footer-imperial-section">
                <h3>QUICK LINKS</h3>
                <a href="home">Home</a>
                <a href="menu">Menu</a>
                <a href="cart">Cart</a>
                <a href="order">My Orders</a>
            </div>
            <div class="footer-imperial-section">
                <h3>CONTACT</h3>
                <p>📞 +91 9786767456</p>
                <p>📧 royal@javabite.com</p>
                <p>📍 Bangalore, India</p>
            </div>
        </div>
        <div class="footer-imperial-bottom">
            <p>&copy; 2026 JavaBite Royal Dining. All Rights Reserved.</p>
        </div>
    </footer>

</body>
</html>