package dao;



import dto.Transaction;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionsDao {
    private Connection conn = DBConnection.getConnection();

    public boolean saveTransaction(Transaction txn) {
        String sql = "INSERT INTO transactions (transactionType, amount, transactionFrom, transactionTo, transactionDescription) VALUES (?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, txn.getTransactionType());
            ps.setDouble(2, txn.getAmount());
            ps.setLong(3, txn.getTransactionFrom());
            ps.setLong(4, txn.getTransactionTo());
            ps.setString(5, txn.getTransactionDescription());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Transaction> getTransactionsByAccount(long accountNumber) {
        List<Transaction> txnList = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE transactionFrom = ? OR transactionTo = ? ORDER BY transactionDate DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, accountNumber);
            ps.setLong(2, accountNumber);

            System.out.println("DEBUG SQL: " + sql + " [account=" + accountNumber + "]");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Transaction txn = new Transaction();
                txn.setTransactionId(rs.getLong("transactionId"));
                txn.setTransactionType(rs.getString("transactionType"));
                txn.setAmount(rs.getDouble("amount"));
                txn.setTransactionDate(rs.getTimestamp("transactionDate"));
                txn.setTransactionFrom(rs.getLong("transactionFrom"));
                txn.setTransactionTo(rs.getLong("transactionTo"));
                txn.setTransactionDescription(rs.getString("transactionDescription"));
                txnList.add(txn);
            }

            System.out.println("DEBUG: Transactions retrieved from DB = " + txnList.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return txnList;
    }
}
