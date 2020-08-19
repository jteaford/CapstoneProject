<template>
    <div>

        <h1 class="title">Add Project</h1>

        <div class="field">
            <label class="label" for="projectCode">Project Code</label>
            <div class="control">
                <input id="projectCode" class="input" type="text" v-model="project.projectCode" placeholder="Project Code" />
            </div>
        </div>

        <div class="field">
            <label class="label" for="projectDescription">Project Description</label>
            <div class="control">
                <input id="projectDescription" class="input" type="text" v-model="project.projectDescription" placeholder="Project Description" />
            </div>
        </div>

        <div class="field">
            <label class="label">Status</label>
            <div class="select">
                <select v-model="project.status.id">
                    <option v-for="status in statuses" :value="status.id" :key="status.id">
                        {{ status.status }}
                    </option>
                </select>
            </div>
        </div>

        <div class="field is-grouped">
            <div class="control">
                <button @click="cancel" class="button">Cancel</button>
            </div>
            <div class="control">
                <button @click="save" class="button is-primary">Save</button>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    data: () => ({
        project: {
            projectCode: null,
            projectDescription: null,
            status: {}
        },
        statuses: [],
        clients: []
    }),
    methods: {
        async save() {
            // save project, that project object (data.project) will be sent
            const response = await this.$http.post('http://localhost:8080/api/projects/', this.project);
            console.log('AddProject.save() response=', response);
            if (response.status === 200) {
            this.$router.push({path: '/projects'});
            }
        },
        cancel() {
            this.$router.push({path: '/projects'});
        },
      
        async getStatuses() {
            const { data } = await this.$http.get('http://localhost:8080/api/statuses');
            console.log('getStatuses() data', data)
            return data;
        },
        async getClients() {
            const { data } = await this.$http.get('http://localhost:8080/api/clients');
            console.log('getClients() data', data);
            return data;
        }
    },
    async mounted() {
        this.statuses = await this.getStatuses();
        this.clients = await this.getClients();
    }
}
</script>

<style scoped>
    label.radio {
        margin-right: 1rem;
    }

    button{
        margin-top: 10px;
    }
    
    button.is-primary{
        background-color: black;
        margin-top: 10px;
    }

    button.is-primary:hover{
        background-color: #666666;
    }
</style>