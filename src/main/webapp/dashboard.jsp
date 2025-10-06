<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyBank | Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* ---------- Base & Background ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #0077b6, #00b4d8, #90e0ef);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            color: #fff;
        }

        /* Floating background orbs */
        .circle {
            position: absolute;
            border-radius: 50%;
            opacity: 0.2;
            animation: float 12s infinite ease-in-out;
        }

        .circle:nth-child(1) {
            width: 400px;
            height: 400px;
            background: #ffffff30;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }

        .circle:nth-child(2) {
            width: 600px;
            height: 600px;
            background: #ffffff25;
            bottom: -20%;
            right: -10%;
            animation-delay: 2s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-40px); }
        }

        /* ---------- Dashboard Container ---------- */
        .dashboard-container {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            padding: 40px 50px;
            width: 700px;
            text-align: center;
            z-index: 2;
            animation: fadeIn 1.2s ease;
            transition: transform 0.3s ease;
        }

        .dashboard-container:hover {
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #fff;
        }

        /* ---------- Bank Icon ---------- */
        .bank-logo {
            width: 80px;
            height: 80px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: radial-gradient(circle, #00b4d8, #0077b6);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-size: 38px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
            animation: spinY 5s infinite linear;
        }

        @keyframes spinY {
            0% { transform: rotateY(0deg); }
            50% { transform: rotateY(180deg); }
            100% { transform: rotateY(360deg); }
        }

        /* ---------- Menu Grid ---------- */
        .dashboard-grid {
            display: flex;
            justify-content: space-between;
            gap: 30px;
            margin-top: 20px;
        }

        .menu-column {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .dashboard-menu a {
            display: block;
            background: linear-gradient(135deg, #023e8a, #0077b6);
            color: white;
            padding: 12px 0;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        }

        .dashboard-menu a::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.5), transparent);
            transition: all 0.6s;
        }

        .dashboard-menu a:hover::before {
            left: 100%;
        }

        .dashboard-menu a:hover {
            background: linear-gradient(135deg, #03045e, #023e8a);
            transform: translateY(-4px);
        }

        /* ---------- Logout Button ---------- */
        .logout-btn {
            background: linear-gradient(135deg, #e63946, #c1121f) !important;
            margin-top: 30px;
            display: inline-block;
            padding: 14px 50px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #c1121f, #780000) !important;
            transform: translateY(-3px);
        }

        /* ---------- Floating 3D Coins ---------- */
        .coin {
            position: absolute;
            width: 60px;
            height: 60px;
            background: radial-gradient(circle, #ffd60a, #ffb703);
            border-radius: 50%;
            box-shadow: 0 0 25px rgba(255, 214, 10, 0.6);
            animation: spin 6s linear infinite, floatCoin 4s ease-in-out infinite;
            z-index: 1;
        }

        .coin:nth-child(3) { top: 20%; left: 15%; animation-delay: 0s, 0s; }
        .coin:nth-child(4) { bottom: 25%; right: 10%; animation-delay: 2s, 1s; }

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

<!-- Background animations -->
<div class="circle"></div>
<div class="circle"></div>
<div class="coin"></div>
<div class="coin"></div>

<!-- Dashboard -->
<div class="dashboard-container">
    <div class="bank-logo">🏦</div>
    <h2>Welcome to Your Dashboard</h2>

    <div class="dashboard-grid">
        <!-- Left column -->
        <div class="menu-column dashboard-menu">
            <a href="account.jsp">View Account</a>
            <a href="bankTransfer.jsp">Transfer Money</a>
            <a href="CheckBalance.jsp">Check Balance</a>
            <a href="DisplayTransaction">Transaction History</a>
        </div>

        <!-- Right column -->
        <div class="menu-column dashboard-menu">
            <a href="deposit.jsp">Deposit</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="updatePIN.jsp">Update PIN</a>
            <a href="updateAccountDetails.jsp">Update Details</a>
        </div>
    </div>

    <!-- Center logout button -->
    <a href="logout.jsp" class="logout-btn">Logout</a>
</div>

</body>
</html>
