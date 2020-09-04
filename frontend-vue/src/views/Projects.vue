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
            <th>Project</th>
            <th>Client</th>
            <th>Status</th>
            <th>Inquiry Date</th>
            <th>Start Date</th>
            <th>Completion Date</th>
          </tr>
        </thead>

        <tbody>
            <tr v-for="project in projects" :key="project.id">
              <td>{{ project.id }}</td>
              <td><a @click="projectDetail(project.id)"><strong>{{ project.projectCode }}</strong> {{ project.projectDescription }}</a></td>
              <td>{{ project.client.firstName }} {{ project.client.lastName }}</td>
              <td>  
                <div v-if="!project.visible"><a @click.stop.prevent="selectStatus(project, $event)">{{ project.status.status }}</a></div>
                <div v-else><select @change="setStatus(project, $event)" v-model="project.status.id" placeholder="Select Status Type">
                    <option v-for="status in statuses" :value="status.id" :key="status.id">
                        {{ status.status }}
                    </option>
                </select></div>
              </td>
              <td>{{ project.inquiryDate }}</td>
              <td>{{ project.startDate }}</td>
              <td>{{ project.completionDate }}</td>
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
      projects: [],
      statuses: []
    }),
    methods: {
      projectDetail(projectId) {
          this.$router.push('project/' + projectId);
      },
      setStatus: function(project, event) {
        console.log(event.target.value);
        console.log(project);
        this.updateStatus(project, event.target.value);
      },
      selectStatus(project, event){
        console.log("Select status = ", project);
        project.visible = true;
        console.log(event);
      },
      
      async updateStatus(project, statusId){
            console.log("statusId = ", statusId);
            let status = {}; 
            status.id = statusId;
            const response = await this.$http.patch('http://localhost:8080/api/projects/' + project.id, status);
            project.visible = false;
            console.log(response);
      }
    },
        async mounted() {
            console.log('projects mounted begin');
            const { data } = await this.$http.get('http://localhost:8080/api/projects');
            console.log('projects mounted data', data);
            
            data.forEach(element => {
              element.visible = false;
            });
            this.projects = data;
            const statuses = await this.$http.get('http://localhost:8080/api/statuses');
            console.log('statuses mounted data', statuses);
            this.statuses = statuses.data;
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

  .table {
    margin-bottom: 100px;
  }

</style>