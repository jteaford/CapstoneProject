<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Business Ledger</h1>
    </div>

    <router-link to="/expense" tag="button" class="button is-primary">Add Expense</router-link>
    <router-link to="/revenue" tag="button" class="button is-primary revenue">Add Revenue</router-link>

    <div class="content">
      <table id="expenses" class="table">
        <thead>
          <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Revenue Type</th>
            <th>Expense Type</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="expense in expenses" :key="expense.id">
            <td>{{ expense.transactionDate }}</td>
            <td>{{ expense.transactionDesc }}<strong> - </strong>{{ expense.location.locationName }}</td>
            <td></td>
            <td>{{ expense.expensetype.expensetype }}</td>
            <td class="amount" style="color: #ca4040;">-{{ expense.transactionAmount | toCurrency }}</td>
          </tr>
          <tr v-for="revenue in revenues" :key="revenue.id">
            <td>{{ revenue.transactionDate }}</td>
            <td>{{ revenue.transactionDesc }}</td>
            <td>{{ revenue.revenuetype.revenuetype }}</td>
            <td></td>
            <td class="amount" style="color: #3273dc;">+{{ revenue.transactionAmount | toCurrency }}</td>
          </tr>
          <tr class="table-total-row">
            <td></td>
            <td></td>
            <td></td>
            <td class="table-total">Total:</td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
  data: () => ({
    expenses: [],
    revenues: [],
  }),
  methods: {
    expenseDetail(expenseId) {
      this.$router.push("expenses/" + expenseId);
    },
  },
  async mounted() {
    console.log("expenses mounted begin");
    const { data } = await this.$http.get("http://localhost:8080/api/expenses");
    console.log("expenses mounted data", data);
    this.expenses = data;

    const revenues = await this.$http.get(
      "http://localhost:8080/api/revenues/"
    );
    this.revenues = revenues.data;
    console.log("revenues mounted data", revenues);
  },
};
</script>

<style scoped>
button {
  float: right;
}

.content table th:not([align]) {
  text-align: left;
}

.button.is-primary {
  background-color: black;
  margin-bottom: 50px;
}

.button.is-primary.revenue {
  margin-right: 1vw;
}

.button.is-primary:hover {
  background-color: #666666;
}

.table-total-row {
    background-color:rgba(50, 115, 220, 0.5);
}

.table-total {
    color: #3273dc;
    text-align: right;
    font-weight: 600;
}

table {
border-top-color: #3273dc;
} 
</style>