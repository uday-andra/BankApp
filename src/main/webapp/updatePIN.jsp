<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update PIN</title>
    <style>
        /* === GLOBAL BACKGROUND === */
        body {
            margin: 0;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            background: radial-gradient(circle at top left, #000814, #001d3d, #000);
            perspective: 1000px;
        }

        /* Rotating gradient aura */
        body::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            background: conic-gradient(from 0deg, #00ffff22, #0077ff22, #00ffff22, #00ffcc22);
            animation: rotateBg 25s linear infinite;
            z-index: -1;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Floating neon particles */
        .particle {
            position: absolute;
            border-radius: 50%;
            background: rgba(0,255,255,0.6);
            box-shadow: 0 0 20px #00ffff;
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0%,100% { transform: translateY(0); opacity: 0.8; }
            50% { transform: translateY(-25px); opacity: 1; }
        }
        .particle:nth-child(1) { top: 20%; left: 10%; width: 12px; height: 12px; animation-delay: 0s; }
        .particle:nth-child(2) { top: 70%; left: 80%; width: 14px; height: 14px; animation-delay: 1s; }
        .particle:nth-child(3) { top: 50%; left: 40%; width: 8px; height: 8px; animation-delay: 2s; }
        .particle:nth-child(4) { top: 30%; left: 90%; width: 10px; height: 10px; animation-delay: 1.5s; }

        /* === 3D FORM CONTAINER === */
        form {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 15px;
            box-shadow: 0 0 40px rgba(0,255,255,0.3);
            padding: 40px 50px;
            width: 420px;
            text-align: center;
            transform-style: preserve-3d;
            animation: floatCard 6s ease-in-out infinite;
            transition: all 0.6s ease;
        }
        form:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.05);
            box-shadow: 0 0 60px rgba(0,255,255,0.5);
        }
        @keyframes floatCard {
            0%,100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* === HEADER === */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 25px #00ffff, 0 0 40px #0077ff;
            font-size: 28px;
            margin-bottom: 25px;
        }

        /* === INPUT FIELDS === */
        label {
            color: #b3ffff;
            text-align: left;
            font-weight: 600;
            display: block;
            margin: 10px 0 5px;
            text-shadow: 0 0 10px #00ffff33;
        }

        .input-group {
            position: relative;
            margin-bottom: 18px;
        }

        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #00ffffcc;
            pointer-events: none;
            text-shadow: 0 0 10px #00ffff;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border-radius: 8px;
            border: 1px solid rgba(0,255,255,0.3);
            background: rgba(255,255,255,0.05);
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

        /* === SUBMIT BUTTON === */
        input[type="submit"] {
            width: 100%;
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: #001020;
            font-weight: bold;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-shadow: 0 0 8px #00ffff;
            transition: 0.3s ease;
            animation: glowPulse 2.5s infinite alternate;
        }
        input[type="submit"]:hover {
            background: linear-gradient(90deg, #00ccff, #00ffff);
            box-shadow: 0 0 25px #00ffff;
            transform: translateY(-3px);
        }
        @keyframes glowPulse {
            from { box-shadow: 0 0 15px #00ffff44; }
            to { box-shadow: 0 0 35px #00ffffaa; }
        }

        /* === MESSAGE === */
        .message {
            margin-top: 15px;
            color: #00ffcc;
            font-weight: bold;
            text-shadow: 0 0 8px #00ffff;
        }

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

<!-- Glowing floating particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<form action="updatePIN" method="post">
    <h2>🔐 Update PIN</h2>
    <input type="hidden" name="action" value="updatePin">

    <div class="input-group">
        <i>🏦</i>
        <label>Account Number:</label>
        <input type="text" name="accountNumber" required>
    </div>

    <div class="input-group">
        <i>🔑</i>
        <label>New PIN:</label>
        <input type="password" name="newPin" required>
    </div>

    <input type="submit" value="Update PIN">

    <div class="message">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</form>

</body>
</html>
