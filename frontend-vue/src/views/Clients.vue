<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Clients</h1>
    </div>

    <router-link to="/client" tag="button" class="button is-primary">Add Client</router-link>

    <div class="content">

      <table id="clients" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Client Code</th>
            <th>Name</th>
            <th>Email Address</th>
            <th>Phone Number</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="client in clients" :key="client.id">
              <td>{{ client.id }}</td>
              <td>{{ client.clientCode }}</td>
              <td><a @click="clientDetail(client.id)">{{ client.firstName }} {{ client.lastName }}</a></td>
              <td>{{ client.emailAddress }}</td>
              <td>{{ client.phoneNumber }}</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Clients',
    data: () => ({ 
      clients: [] 
    }),
        async mounted() {
            console.log('clients mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/clients/');
            console.log('clients mounted data', data);
            this.clients = data;
        },
    methods: {
      clientDetail(clientId) {
          this.$router.push('client/' + clientId);
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

  .table {
    margin-bottom: 100px;
  }
</style>
