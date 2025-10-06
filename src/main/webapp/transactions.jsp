<%@ page import="java.util.List"%>
<%@ page import="dto.Transaction"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <style>
        /* === Global 3D Futuristic Background === */
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background: radial-gradient(circle at top left, #000428, #004e92);
            overflow-x: hidden;
            height: 100vh;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding-top: 50px;
            perspective: 1000px;
        }

        /* Floating animated neon grid effect */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 180deg, #00fff2, #0077ff, #00ffcc, #00fff2);
            opacity: 0.1;
            z-index: -1;
            animation: rotateBg 18s linear infinite;
        }
        @keyframes rotateBg {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Floating neon particles */
        .particle {
            position: absolute;
            background: #00ffff66;
            border-radius: 50%;
            box-shadow: 0 0 20px #00ffff;
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0) scale(1); opacity: 0.7; }
            50% { transform: translateY(-30px) scale(1.2); opacity: 1; }
        }
        .particle:nth-child(1) { top: 10%; left: 20%; width: 10px; height: 10px; animation-delay: 0s; }
        .particle:nth-child(2) { top: 70%; left: 80%; width: 14px; height: 14px; animation-delay: 1s; }
        .particle:nth-child(3) { top: 40%; left: 50%; width: 12px; height: 12px; animation-delay: 2s; }
        .particle:nth-child(4) { top: 85%; left: 10%; width: 8px; height: 8px; animation-delay: 1.5s; }

        /* === Header === */
        h2 {
            color: #00ffff;
            text-shadow: 0 0 25px #00ffff, 0 0 50px #00ccff;
            font-size: 32px;
            letter-spacing: 1px;
            margin-bottom: 30px;
            animation: glowTitle 3s ease-in-out infinite alternate;
        }
        @keyframes glowTitle {
            0% { text-shadow: 0 0 10px #00ccff; }
            100% { text-shadow: 0 0 40px #00ffff; }
        }

        /* === Glass 3D Table Container === */
        .table-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 15px;
            box-shadow: 0 0 40px rgba(0,255,255,0.2);
            padding: 25px;
            width: 95%;
            max-width: 1100px;
            transform-style: preserve-3d;
            animation: floatCard 5s ease-in-out infinite;
        }
        @keyframes floatCard {
            0%,100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* === Table Styling === */
        table {
            border-collapse: collapse;
            width: 100%;
            border-radius: 12px;
            overflow: hidden;
            color: #e0ffff;
            font-size: 15px;
        }

        th {
            background: linear-gradient(90deg, #00ffff88, #0077ff88);
            color: #001020;
            padding: 14px 10px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: inset 0 0 10px rgba(0,255,255,0.3);
            text-transform: uppercase;
        }

        td {
            background-color: rgba(255, 255, 255, 0.05);
            border-bottom: 1px solid rgba(0,255,255,0.15);
            padding: 12px 10px;
            transition: 0.4s ease;
        }

        /* Row 3D hover effect */
        tr:hover td {
            background-color: rgba(0,255,255,0.15);
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(0,255,255,0.2);
        }

        /* Table glow border */
        table::before {
            content: "";
            display: block;
            height: 3px;
            background: linear-gradient(90deg, #00ffff, #0077ff, #00ffff);
            animation: glowLine 4s linear infinite;
        }
        @keyframes glowLine {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        /* === Back Button === */
        a {
            display: inline-block;
            margin-top: 30px;
            text-decoration: none;
            color: #00ffff;
            font-weight: bold;
            background: rgba(0,255,255,0.1);
            border: 1px solid #00ffff88;
            padding: 10px 20px;
            border-radius: 10px;
            transition: 0.3s;
            text-shadow: 0 0 10px #00ffff;
        }
        a:hover {
            background: linear-gradient(90deg, #00ffff, #0077ff);
            color: #001020;
            box-shadow: 0 0 25px #00ffff;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>

<!-- Floating neon particles -->
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>

<h2>Transaction History</h2>

<div class="table-container">
    <table>
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
            <th>From</th>
            <th>To</th>
            <th>Description</th>
        </tr>
        <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction t : transactions) {
        %>
        <tr>
            <td><%=t.getTransactionId()%></td>
            <td><%=t.getTransactionType()%></td>
            <td><%=t.getAmount()%></td>
            <td><%=t.getTransactionDate()%></td>
            <td><%=t.getTransactionFrom()%></td>
            <td><%=t.getTransactionTo()%></td>
            <td><%=t.getTransactionDescription()%></td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="7">No transactions found</td>
        </tr>
        <% } %>
    </table>
</div>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>
