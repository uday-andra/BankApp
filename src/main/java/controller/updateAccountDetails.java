package controller;

import dao.BankAccountDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateAccountDetails")
public class updateAccountDetails extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String accountHolderName = request.getParameter("accountHolderName");
        String branchName = request.getParameter("branchName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        BankAccountDao updateAccountDetail = new BankAccountDao();
        boolean updated = updateAccountDetail.updateAccountDetails(accountNumber, accountHolderName, branchName, address, phone, email);

        if (updated) {
            request.setAttribute("message", "Account details updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update account details. Please check Account Number.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateAccountDetails.jsp");
        dispatcher.forward(request, response);
    }
}