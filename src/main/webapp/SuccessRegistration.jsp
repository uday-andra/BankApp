<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
    <style>
        /* ===== GLOBAL STYLES ===== */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: radial-gradient(circle at top left, #001a1a, #000000);
            overflow: hidden;
            perspective: 1000px;
        }

        /* Rotating gradient background glow */
        body::before {
            content: "";
            position: absolute;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            background: conic-gradient(from 0deg, #00ffcc33, #00ffff33, #00ccff33, #00ffcc33);
            animation: rotateBg 15s linear infinite;
            z-index: -2;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Floating particles for futuristic background */
        .particle {
            position: absolute;
            border-radius: 50%;
            background: #00ffcc55;
            box-shadow: 0 0 20px #00ffff;
            width: 10px;
            height: 10px;
            animation: floatParticle 6s ease-in-out infinite;
        }
        @keyframes floatParticle {
            0% { transform: translateY(0); opacity: 0.8; }
            50% { transform: translateY(-30px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.8; }
        }
        .particle:nth-child(1) { top: 20%; left: 30%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 60%; left: 80%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 40%; left: 15%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 80%; left: 50%; animation-delay: 1.5s; }

        /* ===== SUCCESS CARD ===== */
        .success-message {
            position: relative;
            background: rgba(0, 50, 50, 0.85);
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow:
                    0 0 25px rgba(0, 255, 255, 0.3),
                    inset 0 0 15px rgba(0, 255, 255, 0.1);
            color: #ccfff9;
            text-align: center;
            width: 400px;
            transform-style: preserve-3d;
            animation: floatCard 5s ease-in-out infinite;
            transition: all 0.6s ease;
            z-index: 1;
        }
        .success-message:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.05);
            box-shadow:
                    0 0 50px rgba(0,255,255,0.6),
                    inset 0 0 25px rgba(0,255,255,0.2);
        }
        @keyframes floatCard {
            0%,100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        /* ===== SUCCESS ICON ===== */
        .success-icon {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            margin: 0 auto 20px;
            border: 4px solid #00ffcc;
            display: flex;
            align-items: center;
            justify-content: center;
            background: radial-gradient(circle, rgba(0,255,200,0.2), rgba(0,255,255,0.05));
            box-shadow: 0 0 30px #00ffcc, inset 0 0 20px #00ffff55;
            animation: pulseGlow 2s infinite alternate;
        }
        @keyframes pulseGlow {
            from { box-shadow: 0 0 20px #00ffcc66; }
            to { box-shadow: 0 0 40px #00ffffcc; }
        }

        /* Checkmark animation */
        .checkmark {
            font-size: 45px;
            color: #00ffcc;
            text-shadow: 0 0 20px #00ffff, 0 0 40px #00ccff;
            animation: bounceCheck 1.2s ease-out;
        }
        @keyframes bounceCheck {
            0% { transform: scale(0); opacity: 0; }
            60% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); }
        }

        /* ===== TEXT STYLING ===== */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 15px #00ffff, 0 0 35px #00ccff;
            font-size: 26px;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }

        p {
            color: #b3ffff;
            font-size: 16px;
            margin-bottom: 15px;
            text-shadow: 0 0 10px #00ffff55;
        }

        /* ===== LINK STYLING ===== */
        a {
            text-decoration: none;
            color: #00eaff;
            font-weight: bold;
            font-size: 16px;
            text-shadow: 0 0 8px #00ffff;
            border: 1px solid #00ffff88;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: inline-block;
        }
        a:hover {
            background: linear-gradient(90deg, #00ffff, #00ccff);
            color: #001010;
            box-shadow: 0 0 25px #00ffff, 0 0 40px #00ccff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<!-- Animated glowing particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<!-- Success Card -->
<div class="success-message">
    <div class="success-icon">
        <div class="checkmark">✔</div>
    </div>
    <h2>Registration Successful!</h2>
    <p>Your account has been created successfully.</p>
    <p><a href="login.jsp">🔐 Click here to Login</a></p>
</div>

</body>
</html>
