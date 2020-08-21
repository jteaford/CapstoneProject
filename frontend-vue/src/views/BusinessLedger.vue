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
            <th>#</th>
            <th>Date</th>
            <th>Description</th>
            <th>Location</th>
            <th>Amount</th>
            <th>Transaction Type</th>
            <th>Expense Type</th>
            <th>Project Code</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="transaction in transactions" :key="transaction.id">
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
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
    methods: {
      expenseDetail(expenseId) {
          this.$router.push('expenses/' + expenseId);
      }
    },
        async mounted() {
            console.log('expenses mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/expenses');
            console.log('expenses mounted data', data);
            this.expenses = data;
        }
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

  .button.is-primary.revenue {
      margin-right: 1vw;
  }

  .button.is-primary:hover {
    background-color: #666666;
  }
</style>