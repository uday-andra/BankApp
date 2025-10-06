<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | MyBank</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* --------- Base Styles --------- */
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
            overflow-y: scroll;
            color: #fff;
            position: relative;
        }

        /* -------- Floating 3D Gradient Shapes -------- */
        .shape {
            position: absolute;
            border-radius: 50%;
            filter: blur(100px);
            opacity: 0.5;
            animation: float 10s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            width: 350px;
            height: 350px;
            top: 5%;
            left: 10%;
            background: #00b4d8;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 500px;
            height: 500px;
            bottom: -10%;
            right: 5%;
            background: #90e0ef;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            width: 400px;
            height: 400px;
            top: 60%;
            left: -10%;
            background: #0077b6;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-40px) rotate(20deg); }
        }

        /* -------- Form Container (Glassmorphism) -------- */
        .form-container {
            margin-top: 200px;
            margin-bottom: 80px;
            position: relative;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px 50px;
            width: 500px;
            color: #fff;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            z-index: 5;
            animation: fadeIn 1s ease;
            transition: transform 0.4s ease;
        }

        .form-container:hover {
            transform: scale(1.02);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            font-size: 30px;
            margin-bottom: 25px;
            font-weight: 600;
            color: #fff;
            letter-spacing: 1px;
        }

        /* -------- Form Fields -------- */
        form p {
            display: flex;
            flex-direction: column;
            margin: 10px 0;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
        }

        input {
            padding: 10px 12px;
            border: none;
            border-radius: 8px;
            outline: none;
            background: rgba(255, 255, 255, 0.25);
            color: #fff;
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.2);
        }

        input:focus {
            background: rgba(255, 255, 255, 0.35);
            box-shadow: 0 0 10px rgba(0, 183, 255, 0.8);
            transform: scale(1.03);
        }

        /* -------- Submit Button -------- */
        .btn {
            background: linear-gradient(135deg, #023e8a, #0077b6);
            color: #fff;
            padding: 12px 18px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            margin-top: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .btn:hover {
            background: linear-gradient(135deg, #03045e, #023e8a);
            transform: translateY(-3px);
        }

        /* -------- Login Link -------- */
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .login-link a {
            color: #fff;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .login-link a:hover {
            color: #ffea00;
            text-decoration: underline;
        }

        /* -------- Floating 3D Icons -------- */
        .floating-icon {
            position: absolute;
            font-size: 40px;
            opacity: 0.2;
            animation: move 8s infinite ease-in-out;
        }

        .floating-icon:nth-child(4) {
            top: 20%;
            right: 15%;
            animation-delay: 1s;
        }

        .floating-icon:nth-child(5) {
            bottom: 10%;
            left: 10%;
            animation-delay: 2s;
        }

        .floating-icon:nth-child(6) {
            top: 70%;
            right: 35%;
            animation-delay: 3s;
        }

        @keyframes move {
            0%, 100% { transform: translateY(0) rotate(0); }
            50% { transform: translateY(-30px) rotate(15deg); }
        }

    </style>
</head>
<body>

<!-- Floating gradient shapes -->
<div class="shape"></div>
<div class="shape"></div>
<div class="shape"></div>

<!-- Floating 3D icons -->
<div class="floating-icon">💳</div>
<div class="floating-icon">🏦</div>
<div class="floating-icon">💰</div>

<!-- Create Account Form -->
<div class="form-container">
    <h2>Create Account</h2>

    <form action="CreateAccount" method="post">
        <p><label for="accountNumber">Account Number</label>
            <input type="text" id="accountNumber" name="accountNumber" required></p>

        <p><label for="accountHolderName">Name</label>
            <input type="text" id="accountHolderName" name="accountHolderName" required></p>

        <p><label for="balance">Initial Balance</label>
            <input type="number" id="balance" name="balance" required></p>

        <p><label for="accountType">Account Type</label>
            <input type="text" id="accountType" name="accountType" required></p>

        <p><label for="ifscCode">IFSC</label>
            <input type="text" id="ifscCode" name="ifscCode" required></p>

        <p><label for="branchName">Branch</label>
            <input type="text" id="branchName" name="branchName"></p>

        <p><label for="address">Address</label>
            <input type="text" id="address" name="address"></p>

        <p><label for="phone">Phone</label>
            <input type="text" id="phone" name="phone"></p>

        <p><label for="email">Email</label>
            <input type="email" id="email" name="email"></p>

        <p><label for="pin">PIN</label>
            <input type="password" id="pin" name="pin" required></p>

        <input type="submit" value="Create Account" class="btn">
    </form>

    <p class="login-link">
        Already have an account? <a href="login.jsp">Login</a>
    </p>
</div>
</body>
</html>
