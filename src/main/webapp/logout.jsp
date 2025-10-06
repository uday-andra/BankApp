<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout | MyBank</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* ---------- Base Styling ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            height: 100vh;
            background: radial-gradient(circle at top left, #0077b6, #00b4d8, #90e0ef);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            color: #fff;
        }

        /* ---------- Floating Gradient Blobs ---------- */
        .blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(90px);
            opacity: 0.6;
            animation: float 10s ease-in-out infinite alternate;
        }

        .blob:nth-child(1) {
            width: 400px;
            height: 400px;
            background: #00b4d8;
            top: 10%;
            left: 15%;
            animation-delay: 0s;
        }

        .blob:nth-child(2) {
            width: 500px;
            height: 500px;
            background: #90e0ef;
            bottom: 10%;
            right: 10%;
            animation-delay: 2s;
        }

        .blob:nth-child(3) {
            width: 300px;
            height: 300px;
            background: #0077b6;
            top: 60%;
            left: 60%;
            animation-delay: 4s;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-40px) rotate(30deg); }
            100% { transform: translateY(0) rotate(0deg); }
        }

        /* ---------- Wave Motion Background ---------- */
        .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 200%;
            height: 250px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 1000px;
            animation: waveMove 10s linear infinite;
            z-index: 1;
        }

        .wave:nth-child(4) {
            animation-delay: -2s;
            opacity: 0.2;
            height: 220px;
        }

        .wave:nth-child(5) {
            animation-delay: -4s;
            opacity: 0.15;
            height: 200px;
        }

        @keyframes waveMove {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        /* ---------- Logout Container (Glass Effect) ---------- */
        .logout-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            padding: 50px 60px;
            text-align: center;
            z-index: 2;
            width: 500px;
            transform: translateY(30px);
            opacity: 0;
            animation: fadeInUp 1.2s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logout-container h2 {
            color: #00ffb3;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 10px;
            text-shadow: 0 0 10px rgba(0,255,200,0.6);
        }

        .logout-container p {
            color: #e6f7ff;
            font-size: 16px;
            margin-bottom: 25px;
        }

        .back-link a {
            background: linear-gradient(135deg, #023e8a, #0077b6);
            color: #fff;
            text-decoration: none;
            padding: 12px 28px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            display: inline-block;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .back-link a:hover {
            background: linear-gradient(135deg, #03045e, #023e8a);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* ---------- Floating Icons ---------- */
        .floating-icon {
            position: absolute;
            font-size: 40px;
            opacity: 0.3;
            animation: iconFloat 8s ease-in-out infinite;
            z-index: 0;
        }

        .floating-icon:nth-child(6) {
            top: 20%;
            left: 20%;
            animation-delay: 0s;
        }

        .floating-icon:nth-child(7) {
            bottom: 15%;
            right: 20%;
            animation-delay: 2s;
        }

        .floating-icon:nth-child(8) {
            top: 70%;
            left: 60%;
            animation-delay: 4s;
        }

        @keyframes iconFloat {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-25px) rotate(15deg); }
        }

    </style>
</head>

<body>
<!-- Animated background elements -->
<div class="blob"></div>
<div class="blob"></div>
<div class="blob"></div>

<!-- Soft moving waves -->
<div class="wave"></div>
<div class="wave"></div>

<!-- Floating icons -->
<div class="floating-icon">🏦</div>
<div class="floating-icon">💳</div>
<div class="floating-icon">💰</div>

<!-- Logout Message -->
<div class="logout-container">
    <h2>You have been logged out successfully</h2>
    <p>Thank you for using our secure banking services.<br>We hope to see you again soon.</p>

    <p class="back-link">
        <a href="index.jsp">Return to Home</a>
    </p>
</div>
</body>
</html>
