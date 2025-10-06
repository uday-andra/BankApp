package dao;

import dto.BankAccount;
import dto.Transaction;
import util.DBConnection;

import java.sql.*;

public class BankAccountDao {
	private Connection conn = DBConnection.getConnection();
	private TransactionsDao txnDao = new TransactionsDao();

	// ✅ Create account
	public boolean saveAccount(BankAccount account) {
		String sql = "INSERT INTO bank_accounts VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setLong(1, account.getAccountNumber());
			ps.setString(2, account.getAccountHolderName());
			ps.setDouble(3, account.getBalance());
			ps.setString(4, account.getAccountType());
			ps.setString(5, account.getIfscCode());
			ps.setString(6, account.getBranchName());
			ps.setString(7, account.getAddress());
			ps.setString(8, account.getPhone());
			ps.setString(9, account.getEmail());
			ps.setString(10, account.getPin());

			boolean inserted = ps.executeUpdate() > 0;

			// Initial transaction (Account Creation = credit of opening balance)
			if (inserted && account.getBalance() > 0) {
				Transaction txn = new Transaction();
				txn.setTransactionType("credit");
				txn.setAmount(account.getBalance());
				txn.setTransactionFrom(account.getAccountNumber());
				txn.setTransactionTo(account.getAccountNumber());
				txn.setTransactionDescription("Initial Deposit / Account Opening");
				txnDao.saveTransaction(txn);
			}
			return inserted;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Deposit
	public boolean updateBalance(long accountNumber, double amount, String type) {
		String sql = "UPDATE bank_accounts SET balance = balance + ? WHERE accountNumber = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			if (type.equalsIgnoreCase("credit")) {
				ps.setDouble(1, amount);
			} else {
				ps.setDouble(1, -amount);
			}
			ps.setLong(2, accountNumber);

			boolean updated = ps.executeUpdate() > 0;

			if (updated) {
				Transaction txn = new Transaction();
				txn.setTransactionType(type);
				txn.setAmount(amount);
				txn.setTransactionFrom(accountNumber);
				txn.setTransactionTo(accountNumber);
				txn.setTransactionDescription(type.equalsIgnoreCase("credit") ? "Deposit" : "Withdraw");
				txnDao.saveTransaction(txn);
			}
			return updated;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Withdraw with PIN check
	public boolean updateBalanceWithPin(long accountNumber, String pin, double amount, String type) {
		String sql = "SELECT balance, pin FROM bank_accounts WHERE accountNumber = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setLong(1, accountNumber);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				double currentBalance = rs.getDouble("balance");
				String dbPin = rs.getString("pin");

				if (!dbPin.equals(pin)) {
					return false; // Wrong PIN
				}

				if (type.equalsIgnoreCase("debit") && currentBalance < amount) {
					return false; // Insufficient balance
				}

				return updateBalance(accountNumber, amount, type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Transfer Money (Between Accounts)
	public boolean transferAmount(long fromAcc, String pin, long toAcc, double amount) {
		try {
			conn.setAutoCommit(false);

			// Verify sender PIN and balance
			String checkSql = "SELECT balance, pin FROM bank_accounts WHERE accountNumber = ?";
			try (PreparedStatement ps = conn.prepareStatement(checkSql)) {
				ps.setLong(1, fromAcc);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					double senderBalance = rs.getDouble("balance");
					String dbPin = rs.getString("pin");

					if (!dbPin.equals(pin)) {
						conn.rollback();
						return false;
					}
					if (senderBalance < amount) {
						conn.rollback();
						return false;
					}
				}
			}

			// Debit sender
			String debitSql = "UPDATE bank_accounts SET balance = balance - ? WHERE accountNumber = ?";
			try (PreparedStatement ps = conn.prepareStatement(debitSql)) {
				ps.setDouble(1, amount);
				ps.setLong(2, fromAcc);
				ps.executeUpdate();
			}

			// Credit receiver
			String creditSql = "UPDATE bank_accounts SET balance = balance + ? WHERE accountNumber = ?";
			try (PreparedStatement ps = conn.prepareStatement(creditSql)) {
				ps.setDouble(1, amount);
				ps.setLong(2, toAcc);
				ps.executeUpdate();
			}

			// ✅ Log transaction
			Transaction txn = new Transaction();
			txn.setTransactionType("transfer");
			txn.setAmount(amount);
			txn.setTransactionFrom(fromAcc);
			txn.setTransactionTo(toAcc);
			txn.setTransactionDescription("Fund Transfer");
			txnDao.saveTransaction(txn);

			conn.commit();
			conn.setAutoCommit(true);
			return true;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Get Balance (with PIN)
	public double getBalance(long accountNumber, String pin) {
		String sql = "SELECT balance, pin FROM bank_accounts WHERE accountNumber = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setLong(1, accountNumber);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getString("pin").equals(pin)) {
				return rs.getDouble("balance");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // Wrong PIN or not found
	}

	// ✅ Get Account Details
	public BankAccount getAccountByNumber(long accountNumber) {
		String sql = "SELECT * FROM bank_accounts WHERE accountNumber = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setLong(1, accountNumber);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				BankAccount acc = new BankAccount();
				acc.setAccountNumber(rs.getLong("accountNumber"));
				acc.setAccountHolderName(rs.getString("accountHolderName"));
				acc.setBalance(rs.getDouble("balance"));
				acc.setAccountType(rs.getString("accountType"));
				acc.setIfscCode(rs.getString("ifscCode"));
				acc.setBranchName(rs.getString("branchName"));
				acc.setAddress(rs.getString("address"));
				acc.setPhone(rs.getString("phone"));
				acc.setEmail(rs.getString("email"));
				acc.setPin(rs.getString("pin"));
				return acc;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// ✅ Change PIN
	public boolean changePin(long accountNumber, String oldPin, String newPin) {
		String sql = "UPDATE bank_accounts SET pin = ? WHERE accountNumber = ? AND pin = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, newPin);
			ps.setLong(2, accountNumber);
			ps.setString(3, oldPin);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Update account details
	public boolean updateAccount(BankAccount account) {
		String sql = "UPDATE bank_accounts SET accountHolderName=?, accountType=?, branchName=?, address=?, phone=?, email=? WHERE accountNumber=?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, account.getAccountHolderName());
			ps.setString(2, account.getAccountType());
			ps.setString(3, account.getBranchName());
			ps.setString(4, account.getAddress());
			ps.setString(5, account.getPhone());
			ps.setString(6, account.getEmail());
			ps.setLong(7, account.getAccountNumber());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updatePIN(String accountNumber, String newPin) {
        String sql = "UPDATE bank_accounts SET pin = ? WHERE accountNumber = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPin);
            ps.setString(2, accountNumber);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	public boolean updateAccountDetails(String accountNumber, String accountHolderName, String branchName, String address, String phone, String email) {
        String sql = "UPDATE bank_accounts SET accountHolderName=?, branchName=?, address=?, phone=?, email=? WHERE accountNumber=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, accountHolderName);
            ps.setString(2, branchName);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, accountNumber);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	public boolean withdraw(String accountNumber, double amount) {
        String sql = "SELECT balance FROM bank_accounts WHERE accountNumber = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                if (currentBalance >= amount) {
                    return updateBalance(Long.parseLong(accountNumber), amount, "debit");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
