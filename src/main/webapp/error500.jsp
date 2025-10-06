<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>System Error</title>
    <style>
        /* ===== GLOBAL STYLING ===== */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", Arial, sans-serif;
            background: radial-gradient(circle at top left, #1a0000, #000000);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            perspective: 1000px;
        }

        /* Animated neon background swirl */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, #ff000033, #ff333366, #99000033, #ff000033);
            animation: rotateBg 12s linear infinite;
            z-index: -2;
        }
        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* ===== ERROR CONTAINER ===== */
        .error-container {
            position: relative;
            width: 500px;
            padding: 50px 40px;
            background: rgba(25, 0, 0, 0.85);
            border-radius: 15px;
            box-shadow:
                    0 0 30px rgba(255, 0, 0, 0.4),
                    inset 0 0 20px rgba(255, 0, 0, 0.2);
            color: #fff;
            text-align: center;
            transform-style: preserve-3d;
            animation: floatCard 6s ease-in-out infinite;
            transition: 0.6s ease;
        }
        .error-container:hover {
            transform: rotateY(8deg) rotateX(3deg) scale(1.05);
            box-shadow:
                    0 0 50px rgba(255, 50, 50, 0.7),
                    inset 0 0 25px rgba(255, 0, 0, 0.3);
        }
        @keyframes floatCard {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        /* ===== ERROR TITLE ===== */
        .error-container h2 {
            font-size: 28px;
            color: #ff4d4d;
            margin-bottom: 10px;
            text-shadow:
                    0 0 10px #ff0000,
                    0 0 30px #ff3333,
                    0 0 60px #ff6666;
        }

        /* ===== ERROR TEXT ===== */
        .error-container p {
            color: #ffdddd;
            font-size: 16px;
            margin: 10px 0 25px;
            text-shadow: 0 0 10px #ff3333;
        }

        /* ===== GLOWING BORDER EFFECT ===== */
        .error-container::after {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 15px;
            padding: 2px;
            background: linear-gradient(45deg, #ff0000, #ff6600, #ff0000);
            -webkit-mask:
                linear-gradient(#fff 0 0) content-box,
                linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            animation: glow 3s linear infinite;
            pointer-events: none;
        }
        @keyframes glow {
            0% { filter: blur(3px) brightness(1); }
            50% { filter: blur(6px) brightness(1.4); }
            100% { filter: blur(3px) brightness(1); }
        }

        /* ===== BUTTON / LINK ===== */
        .back-link a {
            background: linear-gradient(90deg, #ff3333, #ff6666);
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
            letter-spacing: 0.5px;
            box-shadow: 0 0 20px #ff3333;
            transition: all 0.3s ease;
        }
        .back-link a:hover {
            background: linear-gradient(90deg, #ff6666, #ff9999);
            box-shadow: 0 0 40px #ff6666;
            transform: scale(1.05);
        }

        /* ===== FLOATING PARTICLES ===== */
        .particle {
            position: absolute;
            border-radius: 50%;
            background: #ff000044;
            box-shadow: 0 0 15px #ff0000;
            width: 10px;
            height: 10px;
            animation: floatParticle 6s ease-in-out infinite;
            filter: blur(1px);
        }
        @keyframes floatParticle {
            0% { transform: translateY(0); opacity: 0.8; }
            50% { transform: translateY(-20px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.8; }
        }
        .particle:nth-child(1) { top: 20%; left: 25%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 70%; left: 75%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 40%; left: 60%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 80%; left: 30%; animation-delay: 1.5s; }
    </style>
</head>
<body>

<!-- Glowing background particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<div class="error-container">
    <h2>🚨 System Error!</h2>
    <p>Something went wrong. Please try again later or contact support.</p>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</div>

</body>
</html>
