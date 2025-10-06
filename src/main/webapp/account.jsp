<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="dto.BankAccount" %>
<%
    BankAccount account = (BankAccount) session.getAttribute("account");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Details | MyBank</title>
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
            overflow: hidden;
            position: relative;
            color: #fff;
        }

        /* -------- Floating Animated Orbs -------- */
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(100px);
            opacity: 0.6;
            animation: float 10s ease-in-out infinite;
        }

        .orb:nth-child(1) {
            width: 350px;
            height: 350px;
            background: #00b4d8;
            top: 10%;
            left: 15%;
            animation-delay: 0s;
        }

        .orb:nth-child(2) {
            width: 450px;
            height: 450px;
            background: #90e0ef;
            bottom: 10%;
            right: 10%;
            animation-delay: 2s;
        }

        .orb:nth-child(3) {
            width: 300px;
            height: 300px;
            background: #0077b6;
            top: 60%;
            left: 60%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-40px) rotate(20deg); }
        }

        /* -------- Glassmorphism Account Card -------- */
        .account-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px 50px;
            width: 500px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            z-index: 5;
            animation: fadeIn 1s ease;
            transform: perspective(1000px) rotateX(0);
            transition: transform 0.5s ease;
        }

        .account-container:hover {
            transform: perspective(1000px) rotateX(5deg) rotateY(-5deg);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 25px;
            color: #fff;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }

        .details-box p {
            margin: 12px 0;
            font-size: 16px;
            color: #eaf9ff;
            letter-spacing: 0.5px;
            animation: slideIn 0.6s ease forwards;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .details-box strong {
            color: #ffea00;
            text-shadow: 0 0 5px rgba(255, 234, 0, 0.5);
        }

        .no-data {
            text-align: center;
            color: #fff;
            font-size: 16px;
            margin-top: 20px;
            opacity: 0.9;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            background: linear-gradient(135deg, #023e8a, #0077b6);
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .back-link a:hover {
            background: linear-gradient(135deg, #03045e, #023e8a);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        }

        /* -------- Floating Icons -------- */
        .floating-icon {
            position: absolute;
            font-size: 40px;
            opacity: 0.2;
            animation: move 8s ease-in-out infinite;
        }

        .floating-icon:nth-child(4) {
            top: 15%;
            right: 10%;
            animation-delay: 0s;
        }

        .floating-icon:nth-child(5) {
            bottom: 15%;
            left: 10%;
            animation-delay: 2s;
        }

        .floating-icon:nth-child(6) {
            top: 70%;
            right: 35%;
            animation-delay: 4s;
        }

        @keyframes move {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-25px) rotate(15deg); }
        }
    </style>
</head>

<body>

<!-- Background Orbs -->
<div class="orb"></div>
<div class="orb"></div>
<div class="orb"></div>

<!-- Floating Icons -->
<div class="floating-icon">💳</div>
<div class="floating-icon">🏦</div>
<div class="floating-icon">💰</div>

<div class="account-container">
    <h2>Account Details</h2>

    <% if (account != null) { %>
    <div class="details-box">
        <p><strong>Account Number:</strong> <%= account.getAccountNumber() %></p>
        <p><strong>Name:</strong> <%= account.getAccountHolderName() %></p>
        <p><strong>Balance:</strong> ₹<%= account.getBalance() %></p>
        <p><strong>Account Type:</strong> <%= account.getAccountType() %></p>
        <p><strong>IFSC Code:</strong> <%= account.getIfscCode() %></p>
        <p><strong>Branch:</strong> <%= account.getBranchName() %></p>
        <p><strong>Phone:</strong> <%= account.getPhone() %></p>
        <p><strong>Email:</strong> <%= account.getEmail() %></p>
        <p><strong>Address:</strong> <%= account.getAddress() %></p>
    </div>
    <% } else { %>
    <div class="no-data">
        <p>No account information available.</p>
    </div>
    <% } %>

    <p class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </p>
</div>

</body>
</html>
