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
            <th>Expense ID</th>
            <th>Project ID</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="client in clients" :key="client.id">
              <td>{{ expense.id }}</td>
              <td>{{ expense.transactionDate }}</td>
              <td>{{ expense.transactionDesc }}</td>
              <td>{{ expense.locationId }}</td>
              <td>{{ expense.transactionAmount }}</td>
              <td>{{ expense.expenseId }}</td>
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
            console.log('actors mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/expenses/');
            console.log('actors mounted data', data);
            this.actors = data;
        },
    methods: {
      expenseDetail(expenseId) {
          this.$router.push('expense/' + expenseId);
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
</style>