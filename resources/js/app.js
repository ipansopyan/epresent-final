import 'es6-promise/auto'
import axios from 'axios'
import './bootstrap'
import Vue from 'vue'
import VueAuth from '@websanova/vue-auth'
import VueAxios from 'vue-axios'
import VueRouter from 'vue-router'
import Dosen from './components/dosen/Index'
import MenuDosen from './components/dosen/MenuDosen'
import Admin from './components/admin/Index'
import MenuAdmin from './components/admin/MenuAdmin'
import auth from './auth'
import router from './router'
// Set Vue globally
window.Vue = Vue
// Set Vue router
Vue.router = router
Vue.use(VueRouter)
// Set Vue authentication
Vue.use(VueAxios, axios)
axios.defaults.baseURL = `${process.env.MIX_APP_URL}/api`
Vue.use(VueAuth, auth)
// Load Index
Vue.component('dosen', Dosen)
Vue.component('menu-dosen', MenuDosen)
Vue.component('admin', Admin)
Vue.component('menu-admin', MenuAdmin)
const app = new Vue({
  el: '#app',
  router
});