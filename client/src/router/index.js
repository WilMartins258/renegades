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
    path: '/sobre',
    name: 'sobre',
    component: () => import(/* webpackChunkName: "sobre" */ '../views/Sobre'),
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
    path: '/alterausuario',
    name: 'alterausuario',
    component: () => import(/* webpackChunkName: "AtulUsuario" */ '../views/ViewUsuarios/AtulUsuario'),
  },

  {
    path: '/AreaDoAdm',
    name: 'AreaDoAdm',
    component: () => import(/* webpackChunkName: "AreaDoAdm" */ '../views/ViewAdm/Adm'),
  },

  {
    path: '/gerenciacategoria',
    name: 'gerenciacategoria',
    component: () => import(/* webpackChunkName: "gerenciacategoria" */ '../views/ViewAdm/GerenciaCategoria'),
  },

  {
    path: '/gerenciamusicas',
    name: 'gerenciamusicas',
    component: () => import(/* webpackChunkName: "gerenciamusicas" */ '../views/ViewAdm/GerenciaMusicas'),
  },

  {
    path: '/gerenciopcionais',
    name: 'gerenciopcionais',
    component: () => import(/* webpackChunkName: "gerenciopcionais" */ '../views/ViewAdm/GerenciaOpcionais'),
  },

  {
    path: '/promocao',
    name: 'promocao',
    component: () => import(/* webpackChunkName: "promocao" */ '../views/ViewAreaEstabelecimento/Promocao'),
  },

  {
    path: '/PaginaEstabelecimento',
    name: 'PaginaEstabelecimento',
    component: () => import(/* webpackChunkName: "PaginaEstabelecimento" */ '../views/ViewAreaEstabelecimento/PaginaEstabelecimento'),
  },

  {
    path: '/atulestabelecimento',
    name: 'atulestabelecimento',
    component: () => import(/* webpackChunkName: "Atulestabelecimento" */ '../views/ViewAreaEstabelecimento/AtulEstabelecimento'),
  },


  {
    path: '/avaliacao',
    name: 'avaliacao',
    component: () => import(/* webpackChunkName: "Avaliacao" */ '../views/ViewUsuarios/Avaliacao'),
  },

  {
    path: '/favoritos',
    name: 'favoritos',
    component: () => import(/* webpackChunkName: "Favoritos" */ '../views/ViewUsuarios/Favoritos'),
  },

  {
    path: '/avaliacaoestabelecimento',
    name: 'avaliacaoestabelecimento',
    component: () => import(/* webpackChunkName: "AvaliacaoEstabelecimento" */ '../views/ViewAreaEstabelecimento/AvaliacaoEstabelecimento'),
  },

  {
    path: '/estabelecimentoscadastrados',
    name: 'estabelecimentoscadastrados',
    component: () => import(/* webpackChunkName: "EstabelecimentosCadastrados" */ '../views/ViewAdm/EstabelecimentosCadastrados'),
  },
  
  {
    path: '/usuarioscadastrados',
    name: 'usuarioscadastrados',
    component: () => import(/* webpackChunkName: "UsuariosCadastrados" */ '../views/ViewAdm/UsuariosCadastrados'),
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
