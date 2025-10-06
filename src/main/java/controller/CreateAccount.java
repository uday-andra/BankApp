package controller;

import dto.BankAccount;
import service.BankingService;
import service.BankingServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
    private BankingService service = new BankingServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); 
        BankAccount acc = new BankAccount();
        try {
            acc.setAccountNumber(Long.parseLong(req.getParameter("accountNumber")));
            acc.setAccountHolderName(req.getParameter("accountHolderName"));
            acc.setBalance(Double.parseDouble(req.getParameter("balance")));
            acc.setAccountType(req.getParameter("accountType"));
            acc.setIfscCode(req.getParameter("ifscCode"));
            acc.setBranchName(req.getParameter("branchName"));
            acc.setAddress(req.getParameter("address"));
            acc.setPhone(req.getParameter("phone"));
            acc.setEmail(req.getParameter("email"));
            acc.setPin(req.getParameter("pin"));

            boolean success = service.createAccount(acc);
            if (success) {
                resp.sendRedirect("SuccessRegistration.jsp");
            } else {
                resp.sendRedirect("error500.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // log the error
            resp.sendRedirect("error500.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // log other unexpected errors
            resp.sendRedirect("error500.jsp");
        }
    }
}
