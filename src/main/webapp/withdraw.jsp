<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Withdraw Money</title>
    <style>
        /* === BACKGROUND & LAYOUT === */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: radial-gradient(circle at top left, #000814, #001d3d, #000);
            overflow: hidden;
            perspective: 1000px;
        }

        /* Rotating Neon Gradient */
        body::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            background: conic-gradient(from 0deg, #ff005522, #ffcc0022, #00ffff22, #ff005522);
            animation: rotateBg 20s linear infinite;
            z-index: -2;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Floating Neon Particles */
        .particle {
            position: absolute;
            border-radius: 50%;
            background: rgba(0,255,255,0.6);
            box-shadow: 0 0 20px #00ffff;
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0%,100% { transform: translateY(0); opacity: 0.7; }
            50% { transform: translateY(-25px); opacity: 1; }
        }
        .particle:nth-child(1) { top: 20%; left: 10%; width: 12px; height: 12px; animation-delay: 0s; }
        .particle:nth-child(2) { top: 60%; left: 85%; width: 14px; height: 14px; animation-delay: 1s; }
        .particle:nth-child(3) { top: 40%; left: 45%; width: 10px; height: 10px; animation-delay: 2s; }
        .particle:nth-child(4) { top: 75%; left: 25%; width: 8px; height: 8px; animation-delay: 1.5s; }

        /* === 3D CARD === */
        .card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            border-radius: 15px;
            padding: 40px;
            width: 420px;
            box-shadow: 0 0 40px rgba(255,255,255,0.1);
            text-align: center;
            transform-style: preserve-3d;
            animation: floatCard 6s ease-in-out infinite;
            transition: transform 0.8s ease, box-shadow 0.8s ease;
        }
        .card:hover {
            transform: rotateY(10deg) rotateX(5deg) scale(1.05);
            box-shadow: 0 0 60px rgba(255,255,255,0.3);
        }
        @keyframes floatCard {
            0%,100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* === TITLE === */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 25px #00ffff, 0 0 40px #0077ff;
            margin-bottom: 25px;
            font-size: 28px;
        }

        /* === FORM INPUTS === */
        label {
            display: block;
            text-align: left;
            color: #b3ffff;
            margin-bottom: 6px;
            font-weight: 600;
            text-shadow: 0 0 8px #00ffff33;
        }
        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #00ffffcc;
            text-shadow: 0 0 10px #00ffff;
            pointer-events: none;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px 10px 10px 35px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(0,255,255,0.3);
            border-radius: 8px;
            color: #e0ffff;
            font-size: 15px;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.1);
            outline: none;
            transition: all 0.3s ease;
        }
        input:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px #00ffff, inset 0 0 10px #00ffff33;
            transform: scale(1.02);
        }

        /* === BUTTON === */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #ff0044, #ff8800);
            border: none;
            border-radius: 8px;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            text-shadow: 0 0 8px #ffaaaa;
            cursor: pointer;
            transition: 0.3s;
            animation: glowPulse 2.5s infinite alternate;
        }
        input[type="submit"]:hover {
            background: linear-gradient(90deg, #ff6600, #ff0044);
            box-shadow: 0 0 25px #ff0044;
            transform: translateY(-3px);
        }
        @keyframes glowPulse {
            from { box-shadow: 0 0 15px #ff004444; }
            to { box-shadow: 0 0 35px #ff0044aa; }
        }

        /* === STATUS MESSAGES === */
        .message {
            margin-bottom: 15px;
            font-weight: bold;
            font-size: 15px;
            text-shadow: 0 0 10px #fff4;
        }
        .success { color: #00ffcc; text-shadow: 0 0 10px #00ffaa; }
        .failed { color: #ff4444; text-shadow: 0 0 10px #ff0000; }
        .invalid { color: #ffcc00; text-shadow: 0 0 10px #ffaa00; }

        /* === BACK LINK === */
        .back-link {
            margin-top: 20px;
        }
        .back-link a {
            color: #00ffff;
            text-decoration: none;
            border: 1px solid #00ffff66;
            padding: 8px 16px;
            border-radius: 8px;
            transition: 0.3s;
            text-shadow: 0 0 8px #00ffff;
        }
        .back-link a:hover {
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: #001020;
            box-shadow: 0 0 25px #00ffff;
        }
    </style>
</head>
<body>

<!-- Floating Neon Particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<div class="card">
    <h2>💸 Withdraw Money</h2>

    <% String status = request.getParameter("status"); %>
    <% if ("success".equals(status)) { %>
    <p class="message success">✅ Withdrawal successful!</p>
    <% } else if ("failed".equals(status)) { %>
    <p class="message failed">❌ Withdrawal failed! Insufficient balance or account not found.</p>
    <% } else if ("invalid".equals(status)) { %>
    <p class="message invalid">⚠️ Invalid input! Please enter numeric values.</p>
    <% } %>

    <form action="withdraw" method="post">
        <div class="input-group">
            <i>🏦</i>
            <label>Account Number:</label>
            <input type="text" name="accountNumber" required>
        </div>
        <div class="input-group">
            <i>💰</i>
            <label>Amount:</label>
            <input type="number" step="0.01" name="amount" required>
        </div>
        <input type="submit" value="Withdraw">
    </form>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</div>

</body>
</html>
