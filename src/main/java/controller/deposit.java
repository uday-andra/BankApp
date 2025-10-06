package controller;

import service.BankingService;
import service.BankingServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/deposit")
public class deposit extends HttpServlet {

    private BankingService service = new BankingServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long accNo = Long.parseLong(req.getParameter("accountNumber"));
        double amount = Double.parseDouble(req.getParameter("amount"));

        boolean success = service.deposit(accNo, amount);

        if (success) {
            resp.sendRedirect("deposit.jsp?status=success");
        } else {
            resp.sendRedirect("deposit.jsp?status=failed");
        }
    }
}
