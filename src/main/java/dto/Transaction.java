package dto;

import java.util.Date;

public class Transaction {
    private long transactionId;
    private String transactionType;
    private double amount;
    private Date transactionDate;
    private long transactionFrom;
    private long transactionTo;
    private String transactionDescription;

    // Getters and Setters
    public long getTransactionId() { return transactionId; }
    public void setTransactionId(long transactionId) { this.transactionId = transactionId; }

    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }

    public long getTransactionFrom() { return transactionFrom; }
    public void setTransactionFrom(long transactionFrom) { this.transactionFrom = transactionFrom; }

    public long getTransactionTo() { return transactionTo; }
    public void setTransactionTo(long transactionTo) { this.transactionTo = transactionTo; }

    public String getTransactionDescription() { return transactionDescription; }
    public void setTransactionDescription(String transactionDescription) { this.transactionDescription = transactionDescription; }
}
