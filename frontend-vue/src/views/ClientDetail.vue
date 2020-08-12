<template>
    <div>
        <span>{{ client.firstName }} {{ client.lastName }}</span>
        <ul>
            <li>{{ client.clientCode }} </li>
            <li>{{ client.firstName }}</li>
            <li>{{ client.lastName }}</li>
            <li>{{ client.emailAddress }}</li>
            <li>{{ client.phoneNumber }}</li>
        </ul>

        <router-link :to="{ name: 'AddProject', params: actor}" tag="button" class="button is-primary">Add Project</router-link>
    
    </div>
</template>

<script>
export default {
    data: () => ({
        actor: null
    }),
    async mounted() {
        const { data } = await this.$http.get('http://localhost:8080/api/projects/' + this.$route.params.id);
        this.actor = data;
    }
}
</script>