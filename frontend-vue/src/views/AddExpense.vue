<template>
    <div>
        <h1 class="title">Add Expense</h1>

        <div class="field"> 
            <label class="label">Date</label>
            <div class="control">
                <input class="input" type="date" v-model="expense.transactionDate" placeholder="Date" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Description</label>
            <div class="control">
                <input class="input" type="text" v-model="expense.transactionDesc" placeholder="i.e. Wood, Tool, Screws, etc." />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Location</label>
            <div class="control">
                <input class="input" type="text" v-model="expense.location.locationName" placeholder="Start typing location.." />
            </div> 
        </div>

        <div class="field">
            <label class="label">Expense Type</label>
            <div class="select">
                <select v-model="expense.expensetype.id" placeholder="Select Expense Type">
                    <option v-for="expensetype in expensetypes" :value="expensetype.id" :key="expensetype.id">
                        {{ expensetype.expensetype }}
                    </option>
                </select>
            </div>
        </div>

        <div class="field">
            <label class="label">Project</label>
            <div class="select">
                <select v-model="project.id" placeholder="Select Project">
                    <option v-for="project in projects" :value="project.id" :key="project.id">
                        {{ project.projectCode }}{{ project.projectDescription }}
                    </option>
                </select>
            </div>
        </div>
   
        <div class="field is-grouped">
            <p class="control">
                <button v-on:click="cancel" class="button">Cancel</button>
            </p> 
            <p class="control">
                <button v-on:click="save" class="button is-primary">Save</button>
            </p>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AddExpense',
    data: () => ({
        expense: {
            transactionDate: "",
            transactionDesc: "",
            location: "",
            transactionAmount: "",
            expensetype: {},
            project: [],
            itemQuantity: ""
        }
    }),
    methods: {
        cancel() {
            this.$router.push({path: '/businessledger'});
        },
        async save() {
            const response = await this.$http.post('http://localhost:8080/api/expenses/', this.expense)
            console.log(response);
            if (response.status === 200) {
                this.$router.push({path: '/businessledger'});
            }
        },
        async getProjects() {
            const { data } = await this.$http.get('http://localhost:8080/api/projects/');
            console.log('getProjects() data', data)
            return data;
        },

},
}
</script>
<style scoped>
button {
    margin-top: 20px;
    margin-bottom: 100px;
}

button.is-primary {
    background-color: black;
    margin-top: 20px;
    margin-bottom: 100px;
}

button.is-primary:hover {
    background-color: #666666;
}

.input, .textarea {
    width: 50%;
}
</style>