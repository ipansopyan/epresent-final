import VueRouter from 'vue-router'
// Pages
import Dosen from './components/dosen/Dashboard'
import Admin from './components/admin/Dashboard'
import AdminMatkul from './components/admin/Matkul'
import AdminMahasiswa from './components/admin/Mahasiswa'
import AdminDosen from './components/admin/Dosen'
// Routes
const routes = [  
  {
    path: '/dosen',
    name: 'dosen',
    component: Dosen,
    meta: {
      auth: false
    }
  },
  {
    path: '/admin',
    name: 'admin',
    component: Admin,
    meta: {
      auth: false
    }
  },
  {
    path: '/admin/#/matkul',
    name: 'admin/#/matkul',
    component: AdminMatkul,
    meta: {
      auth: false
    }
  },
  {
    path: '/admin/#/mahasiswa',
    name: 'admin/#/mahasiswa',
    component: AdminMahasiswa,
    meta: {
      auth: false
    }
  },
  {
    path: '/admin/#/dosen',
    name: 'admin/#/dosen',
    component: AdminDosen,
    meta: {
      auth: false
    }
  },

]
const router = new VueRouter({
  history: true,
  mode: 'history',
  routes,
})
export default router