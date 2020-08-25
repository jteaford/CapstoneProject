<template>
    <div id="main">
    <div class="header">
        <div class="flex-start"><h1 class="title">{{ project.projectCode }}</h1> <h2 class="subtitle is-size-4 has-text-weight-medium">{{ project.projectDescription }}</h2>
        
        <div class="status-bar">
                    <a @click.stop.prevent="selectStatus()">{{ project.status.status }}</a>
                    <select @change="setStatus(project.id, $event)" v-model="project.status.id" placeholder="Select Status Type">
                        <option v-for="status in statuses" :value="status.id" :key="status.id">
                            {{ status.status }}
                        </option>
                    </select>
        </div>
        </div>
        
        <div id="client-detail">
        <ul>
            <li>{{ project.client.firstName }} {{ project.client.lastName }}</li>
            <li>{{ project.client.emailAddress }} </li>
            <li>{{ project.client.phoneNumber }}</li>
            <li>Project Number: {{ project.clientProjectNumber }}</li>
            <li>Referral Type: {{ project.client.referral.referral }}</li>
        </ul>
        </div>

    </div>
        <article>
            <div id="doc-buttons" class="project-element">
                <router-link to="/estimate/add" tag="button" class="button is-primary">Create Estimate</router-link>  
                <router-link to="/invoice/add" tag="button" class="button is-primary">Create Invoice</router-link>    
            </div>

            <div id="time-logged" class="project-element">
                <h2 class="subtitle is-size-4 has-text-weight-medium">Time Logged</h2>
                <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-info" value="40" max="100">40%</progress> </div>
                <!-- <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-warning" value="70" max="100">70%</progress></div>
                <div class="progress-bar"><h3>Estimated time: 35 hours</h3><progress class="progress is-large is-danger" value="90" max="100">90%</progress></div> -->
            </div>

            <div id="expenses-revenues" class="project-element">
                <h2 class="subtitle is-size-4 has-text-weight-medium">Transactions</h2>
                <table id="expenses" class="table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Location</th>
                            <th>Revenue Type</th>
                            <th>Expense Type</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
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

            <div id="project-images-1">
            <img src="./assets/example-photo-1.jpg" alt="kitty"/>
            </div>

            <div id="project-images-2">
            <img src="" alt=""/>
            </div>

            <div id="project-images-3">
            <img src="" alt=""/>
            </div>

            <div id="project-images-4">
            <img src="" alt=""/>
            </div>

            <div id="project-images-5">
            <img src="" alt=""/>
            </div>

        </article>
    </div>
</template>

<script>
export default {
    data: () => ({
        project: null,
        statuses: []
    }),
    methods: {
        setStatus: function(projectId, event) {
        console.log(event.target.value);
        console.log(projectId);
        this.updateStatus(projectId, event.target.value);
      },
      selectStatus(){
        alert('Hello');
      },
      async updateStatus(projectId, statusId){
            console.log("statusId = ", statusId);
            let status = {}; 
            status.id = statusId;
            const response = await this.$http.patch('http://localhost:8080/api/projects/' + projectId, status);
            console.log(response);
      }
    },
    async mounted() {
        const { data } = await this.$http.get('http://localhost:8080/api/projects/' + this.$route.params.id);
        this.project = data;
        const statuses = await this.$http.get('http://localhost:8080/api/statuses');
        console.log('statuses mounted data', statuses);
        this.statuses = statuses.data;
    }
}
</script>

<style scoped>
.header {
    display: flex;
    flex-direction: row;
    align-items: baseline;
    margin-bottom: 8vh;
}

.flex-start {
    margin-right: 5vw;
}

#client-detail {
    align-self: flex-end;
}

div > .status-bar {
    align-self: flex-end;
    margin-bottom: 0;
}

.header > h1 {
    margin-right: 1vw;
}

.status-bar {
    margin-bottom: 10vh;
}

article {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
    grid-gap: 4ch;
    padding-bottom: 13vh;
}

#doc-buttons {
    grid-column: 1 / span 1;
}

#doc-buttons > .button:first-child {
    margin-right: 1vw;
}

#time-logged {
    grid-column: 1 / span 1;
}

.button.is-primary {
    background-color: black;
    margin-bottom: 30px;
  }

.button.is-primary:hover {
    background-color: #666666;
}

.progress-bar {
    margin-bottom: 2ch;
}

.progress-bar > h3 {
    float: right;
}

.progress {
    color: white;
}

#expenses-revenues {
    grid-column: 1 / span 2;
    width: 100%;
    align-items: left;
    
}

.table th:not([align]) {
    text-align: left;
}

#project-images-1 {
    grid-column: 3 / span 1;
    grid-row: 1 / span 1;
}

#project-images-1 > img {
    object-fit: cover;
    position: relative;
    margin-top: 0;
}

/* #iphone11-main {
    grid-column: 2 / span 1;
    grid-row: 1 / span 3;
    overflow: scroll;
    text-align: left;
    padding: 5em;
} */
</style>