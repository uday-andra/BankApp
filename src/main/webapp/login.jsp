<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyBank | Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* ------------------ Reset & Base ------------------ */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #0077b6, #00b4d8, #90e0ef);
            position: relative;
        }

        /* ------------------ Animated Background Circles ------------------ */
        .circle {
            position: absolute;
            border-radius: 50%;
            opacity: 0.15;
            animation: float 12s infinite ease-in-out;
        }
        .circle:nth-child(1) {
            width: 300px;
            height: 300px;
            background: #ffffff40;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }
        .circle:nth-child(2) {
            width: 500px;
            height: 500px;
            background: #ffffff30;
            bottom: -20%;
            right: -10%;
            animation-delay: 3s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-40px); }
        }

        /* ------------------ Glassmorphism Login Card ------------------ */
        .login-container {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            width: 500px;
            padding: 40px 45px;
            text-align: center;
            color: #fff;
            animation: fadeIn 1.2s ease;
            position: relative;
            z-index: 2;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95) translateY(40px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        /* ------------------ Bank Icon / Logo ------------------ */
        .bank-logo {
            width: 90px;
            height: 90px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: radial-gradient(circle, #00b4d8, #0077b6);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-size: 40px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            transform: rotateY(0);
            animation: spinY 4s infinite linear;
        }

        @keyframes spinY {
            0% { transform: rotateY(0deg); }
            50% { transform: rotateY(180deg); }
            100% { transform: rotateY(360deg); }
        }

        h2 {
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #fff;
        }

        /* ------------------ Input Fields ------------------ */
        form p {
            margin: 15px 0;
            text-align: left;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            color: #e0e0e0;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.25);
            color: #fff;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            box-shadow: 0 0 10px #00b4d8;
            background: rgba(255, 255, 255, 0.35);
        }

        /* ------------------ Buttons ------------------ */
        .btn {
            background: linear-gradient(135deg, #0077b6, #023e8a);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
            width: 100%;
            margin-top: 20px;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.5), transparent);
            transition: all 0.6s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-3px);
        }

        /* ------------------ Sign-up Link ------------------ */
        .signup-link {
            margin-top: 20px;
            font-size: 14px;
        }

        .signup-link a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
            color: #90e0ef;
        }

        /* ------------------ Floating 3D Coins Animation ------------------ */
        .coin {
            position: absolute;
            width: 60px;
            height: 60px;
            background: radial-gradient(circle, #ffd60a, #ffb703);
            border-radius: 50%;
            box-shadow: 0 0 20px rgba(255, 214, 10, 0.6);
            animation: spin 6s linear infinite, floatCoin 4s ease-in-out infinite;
        }

        .coin:nth-child(3) { top: 15%; left: 10%; animation-delay: 0s, 0s; }
        .coin:nth-child(4) { bottom: 20%; right: 15%; animation-delay: 2s, 1s; }

        @keyframes spin {
            0% { transform: rotateY(0deg); }
            100% { transform: rotateY(360deg); }
        }

        @keyframes floatCoin {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-25px); }
        }

    </style>
</head>

<body>
<!-- Animated Background Circles -->
<div class="circle"></div>
<div class="circle"></div>

<!-- Floating 3D Coins -->
<div class="coin"></div>
<div class="coin"></div>

<!-- Login Card -->
<div class="login-container">
    <div class="bank-logo">🏦</div>
    <h2>Welcome Back</h2>
    <form action="LoginServlet" method="post">
        <p>
            <label for="accountNumber">Account Number</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
        </p>

        <p>
            <label for="pin">PIN</label>
            <input type="password" id="pin" name="pin" required>
        </p>

        <input type="submit" value="Login" class="btn">
    </form>

    <p class="signup-link">
        Don’t have an account? <a href="signup.jsp">Create New Account</a>
    </p>
</div>
</body>
</html>
