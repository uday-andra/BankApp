package controller;

import dao.BankAccountDao;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updatePIN")
public class updatePIN extends HttpServlet {

    private BankAccountDao bankDAO;

    @Override
    public void init() {
        bankDAO = new BankAccountDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String newPin = request.getParameter("newPin");

        boolean updated = bankDAO.updatePIN(accountNumber, newPin);

        if (updated) {
            request.setAttribute("message", " PIN updated successfully!");
        } else {
            request.setAttribute("message", " Failed to update PIN. Check account number or try again.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updatePIN.jsp");
        dispatcher.forward(request, response);
    }
}
