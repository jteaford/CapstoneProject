<template>
    <div>
        <span>{{ actor.firstName }} {{ actor.lastName }}</span>
        <ul>
            <li>{{ actor.firstName }}</li>
            <li>{{ actor.lastName }}</li>
            <li>{{ actor.dateOfBirth }}</li>
        </ul>

        <router-link :to="{ name: 'AddMovie', params: actor}" tag="button" class="button is-primary">Add Movie</router-link>
    
    </div>
</template>

<script>
export default {
    data: () => ({
        actor: null
    }),
    async mounted() {
        const { data } = await this.$http.get('http://localhost:8080/api/actors/' + this.$route.params.id);
        this.actor = data;
    }
}
</script>