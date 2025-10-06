package controller;


import service.BankingService;
import service.BankingServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/CheckBalance")
public class CheckBalance extends HttpServlet {
    private BankingService service = new BankingServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long accNo = Long.parseLong(req.getParameter("accountNumber"));
        String pin = req.getParameter("pin");

        double balance = service.getBalance(accNo, pin);
        if(balance >= 0){
            req.setAttribute("balance", balance);
            req.getRequestDispatcher("CheckBalance.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("CheckBalance.jsp?error=invalid");
        }
    }
}
