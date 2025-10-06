<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Account Details</title>
    <style>
        /* === GLOBAL FUTURISTIC BACKGROUND === */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            background: radial-gradient(circle at top left, #001a33, #000000);
            /*overflow-y: auto;*/
            /*perspective: 1000px;*/
            /*scroll-behavior: smooth;*/
        }

        .form-wrapper {
            margin-top: 120px;
            margin-bottom: 80px;
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .particle {
            position: fixed;
            border-radius: 50%;
            background: rgba(0,255,255,0.5);
            box-shadow: 0 0 20px #00ffff;
            animation: float 6s ease-in-out infinite;
            z-index: -1;
        }

        @keyframes float {
            0%,100% { transform: translateY(0); opacity: 0.8; }
            50% { transform: translateY(-25px); opacity: 1; }
        }

        .particle:nth-child(1) { top: 10%; left: 20%; width: 10px; height: 10px; animation-delay: 0s; }
        .particle:nth-child(2) { top: 80%; left: 75%; width: 14px; height: 14px; animation-delay: 1s; }
        .particle:nth-child(3) { top: 50%; left: 10%; width: 12px; height: 12px; animation-delay: 2s; }
        .particle:nth-child(4) { top: 30%; left: 90%; width: 8px; height: 8px; animation-delay: 1.5s; }

        body::before {
            content: "";
            position: fixed;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            background: conic-gradient(from 0deg, #00ffff22, #0077ff22, #00ffff22, #00ffcc22);
            animation: rotateBg 20s linear infinite;
            z-index: -2;
        }

        @keyframes rotateBg {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .form-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 15px;
            padding: 40px 45px;
            width: 820px; /* wider for two columns */
            box-shadow: 0 0 40px rgba(0,255,255,0.3);
            transform-style: preserve-3d;
            animation: floatCard 6s ease-in-out infinite;
            transition: all 0.6s ease;
        }

        .form-container:hover {
            transform: rotateY(8deg) rotateX(4deg) scale(1.05);
            box-shadow: 0 0 60px rgba(0,255,255,0.5);
        }

        @keyframes floatCard {
            0%,100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        h2 {
            text-align: center;
            color: #00ffff;
            text-shadow: 0 0 20px #00ffff, 0 0 40px #0077ff;
            font-size: 28px;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        label {
            font-weight: 600;
            color: #b3ffff;
            margin-bottom: 5px;
            display: block;
            font-size: 14px;
            text-shadow: 0 0 8px #00ffff33;
        }

        .input-group {
            position: relative;
            margin-bottom: 18px;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #00ffffcc;
            font-size: 18px;
            pointer-events: none;
            text-shadow: 0 0 10px #00ffff;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px 10px 10px 35px;
            border: 1px solid rgba(0,255,255,0.3);
            background: rgba(255,255,255,0.05);
            border-radius: 8px;
            color: #e0ffff;
            font-size: 15px;
            outline: none;
            transition: 0.3s ease;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.1);
        }

        input:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px #00ffff, inset 0 0 10px #00ffff33;
            transform: scale(1.02);
        }

        /* === TWO COLUMN LAYOUT === */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px 40px;
        }

        /* === BUTTONS AREA === */
        .form-actions {
            text-align: center;
            margin-top: 25px;
        }

        .btn-submit {
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: #001020;
            font-weight: bold;
            border: none;
            padding: 12px 28px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            font-size: 16px;
            text-shadow: 0 0 8px #00ffff;
            margin: 0 10px;
        }

        .btn-submit:hover {
            background: linear-gradient(90deg, #00ccff, #00ffff);
            box-shadow: 0 0 30px #00ffff;
            transform: translateY(-3px);
        }

        .message {
            text-align: center;
            color: #00ffcc;
            margin-top: 15px;
            font-weight: bold;
            text-shadow: 0 0 10px #00ffff;
        }

        .back-link a {
            color: #00ffff;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #00ffff66;
            padding: 10px 22px;
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

<!-- Floating particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<div class="form-wrapper">
    <div class="form-container">
        <h2>Update Account Details ⚙️</h2>

        <form action="updateAccountDetails" method="post">
            <input type="hidden" name="action" value="updateAccount">

            <div class="form-grid">
                <!-- LEFT COLUMN -->
                <div>
                    <div class="input-group">
                        <i>🏦</i>
                        <label>Account Number</label>
                        <input type="text" name="accountNumber" required>
                    </div>

                    <div class="input-group">
                        <i>👤</i>
                        <label>Holder Name</label>
                        <input type="text" name="accountHolderName">
                    </div>

                    <div class="input-group">
                        <i>💰</i>
                        <label>Balance</label>
                        <input type="number" step="0.01" name="balance">
                    </div>

                    <div class="input-group">
                        <i>💳</i>
                        <label>Account Type</label>
                        <input type="text" name="accountType">
                    </div>

                    <div class="input-group">
                        <i>🏛️</i>
                        <label>IFSC Code</label>
                        <input type="text" name="ifscCode">
                    </div>
                </div>

                <!-- RIGHT COLUMN -->
                <div>
                    <div class="input-group">
                        <i>📍</i>
                        <label>Branch Name</label>
                        <input type="text" name="branchName">
                    </div>

                    <div class="input-group">
                        <i>🏠</i>
                        <label>Address</label>
                        <input type="text" name="address">
                    </div>

                    <div class="input-group">
                        <i>📞</i>
                        <label>Phone</label>
                        <input type="text" name="phone">
                    </div>

                    <div class="input-group">
                        <i>📧</i>
                        <label>Email</label>
                        <input type="email" name="email">
                    </div>

                    <div class="input-group">
                        <i>🔑</i>
                        <label>PIN</label>
                        <input type="password" name="pin">
                    </div>
                </div>
            </div>

            <!-- BUTTONS AT CENTER -->
            <div class="form-actions">
                <input type="submit" value="Update Account" class="btn-submit">
                <span class="back-link">
                    <a href="dashboard.jsp">⬅ Back to Dashboard</a>
                </span>
            </div>
        </form>

        <p class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </p>
    </div>
</div>

</body>
</html>
