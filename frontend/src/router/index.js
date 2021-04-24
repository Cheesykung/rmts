import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'home',
    component: () => import('../views/Home.vue'),
    meta: {title: 'Home - Railway Mass Transit System'}
  },
  {
    path: '/map_select',
    name: 'map_select',
    component: () => import('../views/Map_Select.vue'),
    meta: {title: 'Map Select - Railway Mass Transit System'}
  },
  {
    path: '/arl_map',
    name: 'arl_map',
    component: () => import('../views/ARL_Map.vue'),
    meta: {title: 'ARL - Railway Mass Transit System'}
  },
  {
    path: '/bts_map',
    name: 'bts_map',
    component: () => import('../views/BTS_Map.vue'),
    meta: {title: 'BTS - Railway Mass Transit System'}
  },
  {
    path: '/mrt_map',
    name: 'mrt_map',
    component: () => import('../views/MRT_Map.vue'),
    meta: {title: 'MRT - Railway Mass Transit System'}
  },
  {
    path: '/srt_map',
    name: 'srt_map',
    component: () => import('../views/SRT_Map.vue'),
    meta: {title: 'SRT - Railway Mass Transit System'}
  },
  {
    path: '/route_search',
    name: 'route_search',
    component: () => import('../views/Route_Search.vue'),
    meta: {title: 'Search - Railway Mass Transit System'}
  }
]

const router = new VueRouter({
  routes
})

export default router