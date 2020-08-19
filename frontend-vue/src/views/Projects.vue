<template>
  <div id="main">
    <div class="header">
      <h1 class="title">Projects</h1>
    </div>

    <router-link to="/project/add" tag="button" class="button is-primary">Add Project</router-link>

    <div class="content">

      <table class="table">
        
        <thead>
          <tr>
            <th>#</th>
            <th>Project Code</th>
            <th>Project Description</th>
            <th>Status</th>
            <th>Client</th>
            <th>Project Number</th>
          </tr>
        </thead>

        <tbody>
            <tr v-for="project in projects" :key="project.id">
              <td>{{ project.id }}</td>
              <td>{{ project.projectCode }}</td>
              <td>{{ project.projectDescription }}</td>
              <td>{{ project.status.status }}</td>
              <td>{{ project.client.firstName }} {{ project.client.lastName }}</td>
              <td>{{ project.clientProjectNumber }}</td>
            </tr>
        </tbody>

      </table>
    </div>
  </div>
</template>


<script>
export default {
    name: 'Projects',
    data: () => ({ 
      projects: [] 
    }),
    methods: {
      projectDetail(projectId) {
          this.$router.push('project/' + projectId);
      }
    },
        async mounted() {
            console.log('projects mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/projects');
            console.log('projects mounted data', data);
            this.projects = data;
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
    background-color: #777777;
    margin-bottom: 50px;
  }

  .button.is-primary:hover {
    background-color: #999999;
  }

  .table {
    margin-bottom: 100px;
  }

</style>