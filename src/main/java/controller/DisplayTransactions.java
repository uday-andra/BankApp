package controller;

import dto.Transaction;
import dto.BankAccount;
import service.BankingService;
import service.BankingServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayTransaction")
public class DisplayTransactions extends HttpServlet {
	private BankingService service = new BankingServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("account") != null) {
			BankAccount account = (BankAccount) session.getAttribute("account");
			long accNo = account.getAccountNumber();

			System.out.println("DEBUG: Fetching transactions for account = " + accNo);

			List<Transaction> transactions = service.getTransactions(accNo);
			System.out.println("DEBUG: Transactions fetched = " + (transactions != null ? transactions.size() : 0));

			req.setAttribute("transactions", transactions);
			req.getRequestDispatcher("transactions.jsp").forward(req, resp);
		} else {
			System.out.println("DEBUG: Session expired or no account found.");
			resp.sendRedirect("login.jsp");
		}
	}
}
