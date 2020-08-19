package org.aim.carpentry.expensetype;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "expense_types")
public class ExpenseType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "expense_id")
    private Integer id;

    @Column(name = "expense_type")
    private String expense;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExpense() {
        return expense;
    }

    public void setExpense(String expense) {
        this.expense = expense;
    }

    

}