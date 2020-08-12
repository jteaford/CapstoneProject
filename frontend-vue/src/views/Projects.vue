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
            <th>Client Name</th>
          </tr>
        </thead>

        <tbody>
            <tr v-for="project in projects" :key="project.id">
              <td>{{ project.id }}</td>
              <td><a @click="projectDetail(project.id)">{{ project.projectCode }}</a></td>
              <td>{{ client.clientStatus }}</td>
              <td>{{ client.firstName }} {{ client.lastName }}</td>
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
</style>