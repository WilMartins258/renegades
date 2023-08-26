import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Login from '../views/Login.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/Login',
    name: 'Login',
    component: () => import(/* webpackChunkName: "login" */ '../views/Login.vue'),
  },
  
  {
  path: '/Usuario',
  name: 'Usuario',
  component: () => import(/* webpackChunkName: "Usuario" */ '../views/ViewUsuarios/Usuario'),
  },

  {
    path: '/AreaDoEstabelecimento',
    name: 'AreaDoEstabelecimento',
    component: () => import(/* webpackChunkName: "Estabelecimento" */ '../views/ViewAreaEstabelecimento/Estabelecimento'),
  },

  {
    path: '/cadestabelecimento',
    name: 'cadestabelecimento',
    component: () => import(/* webpackChunkName: "CadEstabelecimento" */ '../views/ViewAreaEstabelecimento/CadEstabelecimento'),
  },

  {
    path: '/gerenciacategoria',
    name: 'gerenciacategoria',
    component: () => import(/* webpackChunkName: "gerenciacategoria" */ '../views/ViewAdm/GerenciaCategoria'),
  },

  {
    path: '/CadUsuario',
    name: 'CadUsuario',
    component: () => import(/* webpackChunkName: "CadUsuario" */ '../views/ViewUsuarios/CadUsuario'),
  },

  {
    path: '/AreaDoAdm',
    name: 'AreaDoAdm',
    component: () => import(/* webpackChunkName: "AreaDoAdm" */ '../views/ViewAdm/Adm'),
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
