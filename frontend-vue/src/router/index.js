import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

  const routes = [
  {path: '/', name: 'Home', component: Home},

  {
    path: '/client',
    name: 'Client',
    component: () => import('../views/AddClient.vue')
  },

  { path: '/clients',
    name: 'Clients',
    // route level code-splitting
    // this generates a separate chunk (actors.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "actors" */ '../views/Actors.vue')},

  {path: '/client/:id', name:'ClientDetail', component: () => import('../views/ClientDetail.vue')},
  {path: '/projects', name: 'Projects', component: () => import('../views/Projects.vue')},
  {path: '/project/add', name: 'AddProject', component: () => import('../views/AddProject.vue')},
  {path: '/project/:id', name: 'Project', component: () => import('../views/ProjectDetail.vue')}
  
]

const router = new VueRouter({
  routes
})

export default router
