package org.aim.carpentry.expense;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import org.aim.carpentry.location.Location;
import org.aim.carpentry.project.Project;

@Entity
@Table(name = "expenses")
public class Expense {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name= "transaction_id")
    private Integer id;

    @Column(name="date_of_transaction")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date transactionDate;

    @Column(name="transaction_description")
    private String transactionDesc;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;
    
    @Column(name="transaction_amount")
    private BigDecimal transactionAmount;

    @ManyToOne
    @JoinColumn(name = "expense_id", nullable = false)
    private Expense expense;

    @ManyToOne
    @JoinColumn(name = "project_id", nullable = false)
    private Project project;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionDesc() {
        return transactionDesc;
    }

    public void setTransactionDesc(String transactionDesc) {
        this.transactionDesc = transactionDesc;
    }

    
    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Expense getExpense() {
        return expense;
    }

    public void setExpense(Expense expense) {
        this.expense = expense;
    }

    
}