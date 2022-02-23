import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'InfoList',
        component: () => import('../views/Info.vue'),
    },
    {
        path: '/detail',
        name: 'Pipe Detail PAge',
        component: () => import('../views/Detail.vue'),
    },

    { path: '*', redirect: '/' }
]
const router = new VueRouter({
    routes
})

export default router