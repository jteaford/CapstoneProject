<template>
    <div>
        <span>{{ project.projectCode }} {{ project.projectDescription }}</span>
        <ul>
            <li>{{ project.statusId }}</li>
            <li>{{ project.clientId }}</li>
            <li>{{ project.clientProjectNumber }}</li>
        </ul>
    </div>
</template>

<script>
export default {
    data: () => ({
        project: null
    }),
    async mounted() {
        const { data } = await this.$http.get('http://localhost:8080/api/projects/' + this.$route.params.id);
        this.movie = data;
    }
}
</script>