import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: () => import('../views/Home.vue')
  },
  {
    path: '/map_select',
    name: 'map_select',
    component: () => import('../views/Map_Select.vue')
  },
  {
    path: '/arl_map',
    name: 'arl_map',
    component: () => import('../views/ARL_Map.vue')
  },
  {
    path: '/bts_map',
    name: 'bts_map',
    component: () => import('../views/BTS_Map.vue')
  },
]

const router = new VueRouter({
  routes
})

export default router