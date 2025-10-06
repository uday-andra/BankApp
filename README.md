# BankApp
💳 Bank Management System built using ☕ Java, 🖥️ JSP, ⚙️ Servlets, and 🗄️ MySQL. 

💰 Perform view account details, deposits, withdrawals, and fund transfers, check balance, transaction history, update account details, update PIN with secure authentication. 

🚀 A complete full-stack banking project using JDBC and Tomcat Server.


# 🏦 Bank Management System (JSP + JDBC + MySQL)

A full-stack Java web application that simulates a simple online banking system.  
Built using JSP, Servlets, JDBC, and MySQL, and managed via Maven in IntelliJ IDEA.

---

# 🏷️ Badges

![Java](https://img.shields.io/badge/Java-24-orange)
![JSP](https://img.shields.io/badge/JSP-Enabled-blue)
![JDBC](https://img.shields.io/badge/JDBC-MySQL-success)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Tomcat](https://img.shields.io/badge/Server-Apache%20Tomcat-red)
![IntelliJ IDEA](https://img.shields.io/badge/IDE-IntelliJ%20IDEA-purple)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

---

## 🚀 Features

- 🔐 User registration & login  
- 🧾 Account creation and management  
- 💰 Deposit, withdraw, and transfer funds  
- 📊 View account details & transaction history  
- ⚙️ Update PIN and account details  
- 🛡️ Secure JDBC connection and session handling  

---

## 🛠️ Tech Stack

| Layer      | Technology          |
|------------|---------------------|
| Frontend   | HTML5, CSS3, JSP    |
| Backend    | Java Servlets (MVC) |
| Database   | MySQL (via JDBC)    |
| Server     | Apache Tomcat 10.1  |
| Build Tool | Maven               |
| IDE        | IntelliJ IDEA       |


---


## ⚙️ Installation & Setup Guide

Follow these steps to set up and run the Bank Management System project on your local machine 🏦

🧩 Prerequisites

Before you begin, make sure you have the following installed:

☕ Java JDK 11+

🖥️ IntelliJ IDEA / Eclipse IDE

🐱‍🏍 Apache Tomcat 9+

🗄️ MySQL Server & MySQL Workbench

⚙️ Maven (optional, if using Maven-based project)

## 🚀 Step 1: Clone the Repository
```
git clone https://github.com/uday-andra/BankApp.git

cd BankApp
```

Then open it in IntelliJ IDEA (or Eclipse).

## 🧱 Step 2: Set Up the Database

Open MySQL Workbench (or your SQL client).

Create a new database:
```
CREATE DATABASE bankdb;
```

Select your database:
```
USE bankdb;
```

Import the provided SQL script (usually located in database/bankdb.sql) or manually run:

## ⚙️ Database Configuration

 Create the database:

```sql
CREATE DATABASE bankdb;
USE bankdb;

-- BankAccount Table
CREATE TABLE bank_accounts (
    accountNumber BIGINT PRIMARY KEY,
    accountHolderName VARCHAR(100) NOT NULL,
    balance DOUBLE NOT NULL,
    accountType VARCHAR(20) NOT NULL,
    ifscCode VARCHAR(20) NOT NULL,
    branchName VARCHAR(50),
    address VARCHAR(200),
    phone VARCHAR(15),
    email VARCHAR(100),
    pin VARCHAR(10) NOT NULL
);

-- Transactions Table
CREATE TABLE transactions (
    transactionId BIGINT AUTO_INCREMENT PRIMARY KEY,
    transactionType VARCHAR(20) NOT NULL, -- credit/debit/self_transfer
    amount DOUBLE NOT NULL,
    transactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transactionFrom BIGINT,
    transactionTo BIGINT,
    transactionDescription VARCHAR(200),
    FOREIGN KEY (transactionFrom) REFERENCES bank_accounts(accountNumber),
    FOREIGN KEY (transactionTo) REFERENCES bank_accounts(accountNumber)
);
```

✅ Your database is now ready!

## 🔑 Step 3: Configure Database Connection

Open the file:
```
src/main/java/util/DBConnection.java
```

Edit your MySQL credentials:
```
private static final String URL = "jdbc:mysql://localhost:3306/bankdb";
private static final String USER = "root";
private static final String PASSWORD = "your_mysql_password";
```
💡 Make sure MySQL is running before you start the server.

## ⚙️ Step 4: Configure Apache Tomcat

Go to Run → Edit Configurations → Add New Configuration → Tomcat Server → Local

Set:

Application context: /BankSystem

Port: 8080 (default)

Select your project’s artifacts (WAR exploded) under Deployment.

## ▶️ Step 5: Run the Project

Click Run ▶️ in IntelliJ to start the Tomcat server.

Open your browser and go to:
```
👉 http://localhost:8080/BankApp/
```
You should see your Bank Management System homepage 🏦✨

## 🧠 Step 6: Login / Create Account

Create a new account using the Create Account form.

You can then login, view account details, or perform transactions.

✅ That’s It!

Your Bank Management System is now running locally. 🎉


## 🧩 1. Project Structure

```
BankApp/
│
├── .idea/                       # IntelliJ project metadata (ignored in Git)
├── .mvn/                        # Maven wrapper
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/
│       │   │   ├── BankTransfer.java
│       │   │   ├── CheckBalance.java
│       │   │   ├── CreateAccount.java
│       │   │   ├── Deposit.java
│       │   │   ├── DisplayTransactions.java
│       │   │   ├── LoginServlet.java
│       │   │   ├── UpdateAccountDetails.java
│       │   │   ├── UpdatePIN.java
│       │   │   └── Withdraw.java
│       │   │
│       │   ├── dao/
│       │   │   ├── BankAccountDao.java
│       │   │   └── TransactionsDao.java
│       │   │
│       │   ├── dto/
│       │   │   ├── BankAccount.java
│       │   │   └── Transaction.java
│       │   │
│       │   ├── service/
│       │   │   ├── BankingService.java
│       │   │   └── BankingServiceImpl.java
│       │   │
│       │   └── util/
│       │       └── DBConnection.java
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml
│           │
│           ├── index.jsp
│           ├── login.jsp
│           ├── signup.jsp
│           ├── dashboard.jsp
│           ├── account.jsp
│           ├── deposit.jsp
│           ├── withdraw.jsp
│           ├── bankTransfer.jsp
│           ├── CheckBalance.jsp
│           ├── updateAccountDetails.jsp
│           ├── updatePIN.jsp
│           ├── transactions.jsp
│           ├── logout.jsp
│           ├── SuccessRegistration.jsp
│           └── error500.jsp
│
├── pom.xml                       # Maven dependencies
├── .gitignore                    # Added file
├── LICENSE                       # Added file
├── README.md                     # Added file
└── target/                       # Build folder (ignored in Git)
```

## 👩‍💻 Author

Developed by: UDAYCHANDRA ANDRA
 💙
Full Stack Java Developer | JSP • JDBC • MySQL Enthusiast

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the issues page
.

Steps to Contribute:

1. Fork this repository 🍴

2. Create a new branch (``` git checkout -b feature/AmazingFeature ```)

3. Commit your changes ( ``` git commit -m 'Add some AmazingFeature' ```)

4. Push to the branch (``` git push origin feature/AmazingFeature ```)

5. Open a Pull Request 🚀

 

## 📬 Contact

UDAYCHANDRA ANDRA

📧 Email: udayandra003@gmail.com

💼 LinkedIn: https://www.linkedin.com/in/andra-udaychandra

🐙 GitHub: https://github.com/uday-andra
