<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Expenses</h1>
    </div>

    <router-link to="/expense" tag="button" class="button is-primary">Add Expense</router-link>

    <div class="content">

      <table id="expenses" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>Description</th>
            <th>Location</th>
            <th>Amount</th>
            <th>Expense Type</th>
            <th>Project ID</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="expense in expenses" :key="expense.id">
              <td>{{ expense.id }}</td>
              <td>{{ expense.transactionDate }}</td>
              <td>{{ expense.transactionDesc }}</td>
              <td>{{ expense.locationName }} {{ expense.addressDesc }}</td>
              <td>{{ expense.transactionAmount | toCurrency }}</td>
              <td>{{ expense.expense }}</td>
              <td>{{ expense.projectId }}</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Expenses',
    data: () => ({ 
      expenses: [] 
    }),
        async mounted() {
            console.log('expenses mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/expenses');
            console.log('expenses mounted data', data);
            this.expenses = data;
        },
    methods: {
      expenseDetail(expense) {
          this.$router.push('expense/' + expense);
      }
    },
}
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

  .button.is-primary:hover {
    background-color: #666666;
  }
</style>