package service;



import dao.BankAccountDao;
import dao.TransactionsDao;
import dto.BankAccount;
import dto.Transaction;

import java.util.List;

public class BankingServiceImpl implements BankingService {
    private final BankAccountDao accountDao = new BankAccountDao();
    private final TransactionsDao txnDao = new TransactionsDao();

    @Override
    public boolean createAccount(BankAccount account) {
        return accountDao.saveAccount(account);
    }

    @Override
    public boolean deposit(long accountNumber, double amount) {
        return accountDao.updateBalance(accountNumber, amount, "credit");
    }

    @Override
    public boolean withdraw(long accountNumber, String pin, double amount) {
        return accountDao.updateBalanceWithPin(accountNumber, pin, amount, "debit");
    }

    @Override
    public boolean transfer(long fromAcc, String pin, long toAcc, double amount) {
        return accountDao.transferAmount(fromAcc, pin, toAcc, amount);
    }

    @Override
    public boolean withdraw(long accountNumber, double amount) {
        return false;
    }

    @Override
    public double getBalance(long accountNumber, String pin) {
        return accountDao.getBalance(accountNumber, pin);
    }

    @Override
    public BankAccount getBankAccountDetails(long accountNumber) {
        return accountDao.getAccountByNumber(accountNumber);
    }

    @Override
    public List<Transaction> getTransactions(long accountNumber) {
        return txnDao.getTransactionsByAccount(accountNumber);
    }

    @Override
    public boolean updatePin(long accountNumber, String oldPin, String newPin) {
        return accountDao.changePin(accountNumber, oldPin, newPin);
    }

    @Override
    public boolean updateBankAccountDetails(BankAccount account) {
        return accountDao.updateAccount(account);
    }

  
	@Override
	public boolean transfer(long fromAcc, long toAcc, double amount, String pin) {
		return false;
	}

	@Override
	public boolean withdraw(long accountNumber, double amount, String pin) {
		return false;
	}
}

