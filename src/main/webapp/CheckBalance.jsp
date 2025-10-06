<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Balance Checker</title>
    <style>
        /* ===== GLOBAL STYLING ===== */
        body {
            font-family: "Poppins", Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: radial-gradient(circle at 20% 20%, #00172d, #00060f);
            overflow: hidden;
            perspective: 1000px;
        }

        /* Animated background particles */
        body::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, #00ffff10, #0077ff10, #00ffff10);
            animation: rotateBg 12s linear infinite;
            z-index: -2;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Floating neon particles */
        @keyframes floatParticle {
            0% { transform: translateY(0); opacity: 0.7; }
            50% { transform: translateY(-30px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.7; }
        }
        .particle {
            position: absolute;
            background: #00ffff33;
            border-radius: 50%;
            width: 8px;
            height: 8px;
            animation: floatParticle 4s ease-in-out infinite;
            filter: blur(1px);
        }
        .particle:nth-child(1) { top: 10%; left: 30%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 60%; left: 80%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 40%; left: 20%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 80%; left: 50%; animation-delay: 1.5s; }

        /* ===== CARD STYLING ===== */
        .balance-container {
            background: rgba(10, 15, 40, 0.9);
            border-radius: 18px;
            box-shadow:
                    0 0 30px rgba(0, 255, 255, 0.3),
                    inset 0 0 15px rgba(0, 255, 255, 0.1);
            width: 500px;
            padding: 40px 50px;
            text-align: center;
            transform-style: preserve-3d;
            animation: floatCard 5s ease-in-out infinite;
            transition: all 0.6s ease;
            position: relative;
            z-index: 1;
        }

        .balance-container:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.03);
            box-shadow:
                    0 0 60px rgba(0, 255, 255, 0.6),
                    inset 0 0 25px rgba(0, 255, 255, 0.2);
        }
        @keyframes floatCard {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        /* ===== HEADING ===== */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 12px #00ffff, 0 0 30px #0077ff;
            font-size: 26px;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        /* ===== FORM ===== */
        form p {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 15px 0;
            color: #fff;
        }

        label {
            flex: 1;
            color: #a6e7ff;
            font-weight: bold;
            text-shadow: 0 0 6px #00ffff66;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        label i {
            color: #00ffff;
            text-shadow: 0 0 10px #00ffff;
        }

        input[type="text"],
        input[type="password"] {
            flex: 2;
            padding: 8px 10px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.1);
            color: #00eaff;
            outline: none;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.15);
            transition: 0.3s;
        }
        input:focus {
            background: rgba(0,255,255,0.2);
            box-shadow: 0 0 10px #00ffff, inset 0 0 10px #00ffff;
        }

        /* ===== BUTTON ===== */
        .btn {
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            box-shadow: 0 0 15px #00ffff;
            transition: all 0.3s ease;
        }
        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 30px #00ffff, 0 0 40px #0077ff;
        }

        /* ===== BALANCE RESULT ===== */
        .balance-result {
            background: rgba(0, 255, 255, 0.1);
            border: 1px solid #00e6ff55;
            border-radius: 10px;
            padding: 15px;
            margin-top: 25px;
            box-shadow: inset 0 0 20px rgba(0,255,255,0.2);
            animation: glowPulse 2s infinite alternate;
        }
        @keyframes glowPulse {
            from { box-shadow: 0 0 10px #00ffff33; }
            to { box-shadow: 0 0 25px #00ffff99; }
        }
        .balance-result p {
            font-size: 16px;
            color: #b3e6ff;
        }
        .balance-result h3 {
            color: #00ffff;
            font-size: 26px;
            font-weight: bold;
            margin: 8px 0 0;
            text-shadow: 0 0 15px #00ffff, 0 0 30px #00ccff;
        }

        /* ===== BACK LINK ===== */
        .back-link {
            margin-top: 25px;
        }
        .back-link a {
            color: #00e6ff;
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

<!-- Background particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<div class="balance-container">
    <h2>💠 Check Your Balance</h2>

    <form action="CheckBalance" method="post">
        <p>
            <label for="accountNumber"><i>🏦</i>Account:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
        </p>

        <p>
            <label for="pin"><i>🔐</i>PIN:</label>
            <input type="password" id="pin" name="pin" required>
        </p>

        <p style="text-align:center;">
            <input type="submit" value="🔎 Check Balance" class="btn">
        </p>
    </form>

    <% if (request.getAttribute("balance") != null) { %>
    <div class="balance-result">
        <p>Your Current Balance:</p>
        <h3>₹ <%= request.getAttribute("balance") %></h3>
    </div>
    <% } %>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</div>

</body>
</html>
