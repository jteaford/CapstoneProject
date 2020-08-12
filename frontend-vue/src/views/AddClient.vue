<template>
    <div>
        <h1 class="title">Add Client</h1>

        <div class="field"> 
            <label class="label">Client Code</label>
            <div class="control">
                <input class="input" type="text" v-model="client.clientCode" placeholder="Enter Initials of Client" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">First Name</label>
            <div class="control">
                <input class="input" type="text" v-model="client.firstName" placeholder="First Name" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Last Name</label>
            <div class="control">
                <input class="input" type="text" v-model="client.lastName" placeholder="Last Name" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Email Address</label>
            <div class="control">
                <input class="input" type="text" v-model="client.emailAddress" placeholder="Email Address" />
            </div> 
        </div>

        <div class="field"> 
            <label class="label">Phone Number</label>
            <div class="control">
                <input class="input" type="text" v-model="client.phoneNumber" placeholder="Phone Number" />
            </div> 
        </div>
   
        <div class="field is-grouped">
            <p class="control">
                <button v-on:click="cancel" class="button">Cancel</button>
            </p> 
            <p class="control">
                <button v-on:click="save" class="button">Save</button>
            </p>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AddClient',
    data: () => ({
        client: {
            clientCode: "",
            firstName: "",
            lastName: "",
            emailAddress: "",
            phoneNumber: ""
        }
    }),

    methods: {
        cancel() {
            this.$router.push({path: '/clients'});
        },
        async save() {
            const response = await this.$http.post('http://localhost:8080/api/clients/', this.clients)
            console.log(response);
            if (response.status === 200) {
                this.$router.push({path: '/clients'});
            }
        }
    }
}
</script>