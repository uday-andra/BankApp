package service;



import dto.BankAccount;
import dto.Transaction;
import java.util.List;

public interface BankingService {
    boolean createAccount(BankAccount account);
    boolean deposit(long accountNumber, double amount);
    boolean withdraw(long accountNumber, double amount, String pin);
    boolean transfer(long fromAcc, long toAcc, double amount, String pin);
    double getBalance(long accountNumber, String pin);
    BankAccount getBankAccountDetails(long accountNumber);
    List<Transaction> getTransactions(long accountNumber);
    boolean updatePin(long accountNumber, String oldPin, String newPin);
    boolean updateBankAccountDetails(BankAccount account);

    boolean withdraw(long accountNumber, String pin, double amount);

    boolean transfer(long fromAcc, String pin, long toAcc, double amount);
//	boolean withdraw(long accountNumber, String pin, double amount);
	boolean withdraw(long accountNumber, double amount);
}
