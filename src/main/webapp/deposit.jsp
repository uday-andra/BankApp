<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deposit Portal</title>
    <style>
        /* ====== GLOBAL STYLES ====== */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            background: radial-gradient(circle at top left, #001020, #000814, #000);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            perspective: 1000px;
        }

        /* Animated glowing background layer */
        body::before {
            content: "";
            position: absolute;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 180deg, #00ffff33, #00ff9533, #0077ff33, #00ffff33);
            top: -50%;
            left: -50%;
            animation: rotateBg 10s linear infinite;
            z-index: -2;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Floating digital particles */
        .particle {
            position: absolute;
            border-radius: 50%;
            background: #00ffff44;
            box-shadow: 0 0 15px #00ffff;
            width: 8px;
            height: 8px;
            animation: floatParticle 6s ease-in-out infinite;
            filter: blur(1px);
        }
        @keyframes floatParticle {
            0% { transform: translateY(0); opacity: 0.7; }
            50% { transform: translateY(-25px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.7; }
        }
        .particle:nth-child(1) { top: 20%; left: 15%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 60%; left: 80%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 80%; left: 40%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 10%; left: 70%; animation-delay: 1.5s; }

        /* ====== CARD STYLES ====== */
        .card {
            background: rgba(10, 20, 40, 0.9);
            border-radius: 16px;
            box-shadow: 0 0 30px rgba(0,255,255,0.3), inset 0 0 15px rgba(0,255,255,0.1);
            width: 500px;
            padding: 40px 45px;
            transform-style: preserve-3d;
            text-align: center;
            animation: floatCard 6s ease-in-out infinite;
            transition: all 0.6s ease;
            position: relative;
            z-index: 1;
        }
        .card:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.05);
            box-shadow: 0 0 50px rgba(0,255,255,0.5), inset 0 0 25px rgba(0,255,255,0.2);
        }
        @keyframes floatCard {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        /* ====== TITLE ====== */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 15px #00ffff, 0 0 30px #0077ff;
            font-size: 26px;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        /* ====== FORM INPUTS ====== */
        label {
            display: block;
            text-align: left;
            margin-bottom: 6px;
            color: #aef7ff;
            font-weight: bold;
            letter-spacing: 0.5px;
            text-shadow: 0 0 6px #00ffff66;
        }
        label i {
            margin-right: 6px;
            color: #00ffff;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            background: rgba(255,255,255,0.1);
            color: #00ffff;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.2);
            transition: 0.3s;
            outline: none;
        }
        input:focus {
            background: rgba(0,255,255,0.15);
            box-shadow: 0 0 15px #00ffff, inset 0 0 10px #00ffff;
        }

        /* ====== BUTTON ====== */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #00ffff, #0077ff);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 0 20px #00ffff;
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover {
            transform: scale(1.05);
            background: linear-gradient(90deg, #00ffcc, #0077ff);
            box-shadow: 0 0 30px #00ffff, 0 0 40px #0077ff;
        }

        /* ====== BACK LINK ====== */
        .back-link {
            margin-top: 20px;
        }
        .back-link a {
            color: #00eaff;
            font-weight: bold;
            text-decoration: none;
            text-shadow: 0 0 8px #00ffff;
            transition: 0.3s;
        }
        .back-link a:hover {
            text-decoration: underline;
            color: #fff;
        }
    </style>
</head>
<body>

<!-- Floating glow particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<!-- 3D Card -->
<div class="card">
    <h2>💳 Deposit Money</h2>
    <form action="deposit" method="post">
        <input type="hidden" name="action" value="deposit">

        <label><i>🏦</i>Account Number:</label>
        <input type="text" name="accountNumber" required>

        <label><i>💰</i>Amount:</label>
        <input type="number" step="0.01" name="amount" required>

        <input type="submit" value="🚀 Deposit">
    </form>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</div>

</body>
</html>
