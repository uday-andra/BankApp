<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>MyBank | Secure Banking</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        /* ---------- Base & Reset ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #0077b6, #00b4d8, #90e0ef);
            color: #fff;
            min-height: 100vh;
            overflow-x: hidden;
            transition: background 0.5s, color 0.5s;
        }

        /* Dark mode styles */
        body.dark {
            background: linear-gradient(135deg, #0b132b, #1c2541, #3a506b);
            color: #f1f1f1;
        }

        /* ---------- Header ---------- */
        header {
            width: 100%;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 10;
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        header h1 {
            font-size: 28px;
            font-weight: 600;
            color: #fff;
        }

        .nav-buttons a {
            text-decoration: none;
            color: #fff;
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 20px;
            border-radius: 6px;
            margin-left: 15px;
            transition: 0.3s;
            border: 1px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(8px);
        }

        .nav-buttons a:hover {
            background: #fff;
            color: #0077b6;
            transform: translateY(-3px);
        }

        /* ---------- Dark Mode Toggle ---------- */
        .toggle-mode {
            margin-left: 20px;
            background: none;
            border: 2px solid #fff;
            color: #fff;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .toggle-mode:hover {
            background: #fff;
            color: #0077b6;
        }

        /* ---------- Hero Section ---------- */
        .main-content {
            text-align: center;
            padding-top: 140px;
            max-width: 900px;
            margin: 0 auto;
            animation: fadeInDown 1s ease forwards;
        }

        .main-content h2 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #f0f0f0;
        }

        /* ---------- 3D Animated Middle Section ---------- */
        .threeD-section {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 60px;
            flex-wrap: wrap;
            margin-top: 60px;
            animation: fadeInUp 1.5s ease forwards;
        }

        .card3D {
            width: 260px;
            height: 180px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            perspective: 1000px;
            transform-style: preserve-3d;
            transition: transform 0.6s ease;
            position: relative;
        }

        .card3D:hover {
            transform: rotateY(180deg);
        }

        .card3D .front,
        .card3D .back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 20px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .card3D .front {
            background: linear-gradient(145deg, #00b4d8, #0077b6);
        }

        .card3D .back {
            background: linear-gradient(145deg, #023e8a, #03045e);
            transform: rotateY(180deg);
        }

        .card3D img {
            width: 70px;
            margin-bottom: 10px;
        }

        /* ---------- Keyframes ---------- */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* ---------- Footer ---------- */
        footer {
            margin-top: 80px;
            text-align: center;
            font-size: 14px;
            color: #f0f0f0;
            opacity: 0.8;
        }
    </style>
</head>

<body>
<!-- Header -->
<header>
    <h1>MyBank 💰</h1>
    <div class="nav-buttons">
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Create Account</a>
        <button class="toggle-mode" id="modeBtn">🌙 Dark</button>
    </div>
</header>

<!-- Hero Section -->
<div class="main-content">
    <h2>Welcome to MyBank</h2>
    <p>Empowering your financial journey with security, innovation, and trust.</p>

    <!-- 3D Animated Cards Section -->
    <div class="threeD-section">
        <div class="card3D">
            <div class="front">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135789.png" alt="Account">
                <h3>Smart Accounts</h3>
                <p>Manage your funds efficiently with AI-powered insights.</p>
            </div>
            <div class="back">
                <h3>Safe & Secure</h3>
                <p>24/7 protection and advanced encryption for your transactions.</p>
            </div>
        </div>

        <div class="card3D">
            <div class="front">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Loan">
                <h3>Instant Loans</h3>
                <p>Apply and get approved in minutes — no paperwork hassle!</p>
            </div>
            <div class="back">
                <h3>Low Interest</h3>
                <p>Flexible repayment options designed to suit your needs.</p>
            </div>
        </div>

        <div class="card3D">
            <div class="front">
                <img src="https://cdn-icons-png.flaticon.com/512/1048/1048953.png" alt="Investment">
                <h3>Smart Investments</h3>
                <p>Grow your wealth with our intelligent investment tools.</p>
            </div>
            <div class="back">
                <h3>High Returns</h3>
                <p>Track and maximize profits with our smart analytics.</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 MyBank Inc. | @UdayChandra_Andra | All rights reserved.
</footer>

<!-- ---------- JavaScript for Dark Mode ---------- -->
<script>
    const modeBtn = document.getElementById("modeBtn");
    modeBtn.addEventListener("click", () => {
        document.body.classList.toggle("dark");
        modeBtn.textContent = document.body.classList.contains("dark") ? "☀️ Light" : "🌙 Dark";
    });
</script>
</body>
</html>
