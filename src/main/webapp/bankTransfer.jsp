<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Bank Transfer</title>
    <style>
        /* ======== GLOBAL STYLES ======== */
        body {
            font-family: "Poppins", Arial, sans-serif;
            background: radial-gradient(circle at top left, #0a0f29, #010312, #000);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            perspective: 1200px;
            overflow: hidden;
        }

        /* ======== CARD CONTAINER ======== */
        .transfer-container {
            width: 500px;
            padding: 40px 50px;
            border-radius: 20px;
            background: rgba(15, 20, 45, 0.85);
            box-shadow:
                    0 0 40px rgba(0, 170, 255, 0.4),
                    inset 0 0 20px rgba(0, 255, 255, 0.1);
            transform-style: preserve-3d;
            transform: rotateY(0deg);
            transition: transform 1s ease, box-shadow 0.5s ease;
            animation: floatCard 5s ease-in-out infinite;
        }

        /* Hover gives a parallax tilt effect */
        .transfer-container:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.03);
            box-shadow:
                    0 0 60px rgba(0, 255, 255, 0.6),
                    inset 0 0 25px rgba(0, 255, 255, 0.15);
        }

        /* Floating card animation */
        @keyframes floatCard {
            0%, 100% { transform: translateY(0px) rotateY(0deg); }
            50% { transform: translateY(-10px) rotateY(2deg); }
        }

        /* ======== TITLE ======== */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 10px #00ffff, 0 0 30px #00ccff;
            font-size: 28px;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        /* ======== FORM STYLING ======== */
        form p {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 15px 0;
            color: #fff;
        }

        label {
            flex: 1;
            font-weight: bold;
            color: #b3e6ff;
            text-shadow: 0 0 5px rgba(0,255,255,0.5);
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            flex: 2;
            padding: 8px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.1);
            color: #00eaff;
            outline: none;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.2);
            transition: 0.3s;
        }

        input:focus {
            background: rgba(0,255,255,0.15);
            box-shadow: 0 0 10px #00ffff, inset 0 0 10px #00ffff;
        }

        /* ======== BUTTON ======== */
        .btn {
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 0 15px #00ffff;
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px #00ffff, 0 0 35px #0077ff;
        }

        /* ======== BACK LINK ======== */
        .back-link {
            margin-top: 25px;
        }

        .back-link a {
            color: #00e6ff;
            font-weight: bold;
            text-decoration: none;
            text-shadow: 0 0 8px #00ffff;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        /* ======== NEON BACKGROUND ANIMATION ======== */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 180deg, #00ffff33, #0077ff33, #00ffff33);
            animation: rotateBg 10s linear infinite;
            z-index: -1;
        }

        @keyframes rotateBg {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<div class="transfer-container">
    <h2> Bank Transfer</h2>

    <form action="BankTransfer" method="post">
        <p>
            <label for="fromAcc">From:</label>
            <input type="text" id="fromAcc" name="fromAcc" required>
        </p>

        <p>
            <label for="pin">PIN:</label>
            <input type="password" id="pin" name="pin" required>
        </p>

        <p>
            <label for="toAcc">To:</label>
            <input type="text" id="toAcc" name="toAcc" required>
        </p>

        <p>
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>
        </p>

        <p style="text-align:center;">
            <input type="submit" value="Transfer" class="btn">
        </p>
    </form>

    <p class="back-link">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </p>
</div>

</body>
</html>
