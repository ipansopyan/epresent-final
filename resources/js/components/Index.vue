<template>
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="index.html"><img src="assets/images/icon/logo.png" alt="logo"></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-dashboard"></i><span>dashboard</span></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Dashboard</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span> <router-link :to="{name: 'tes'}">dsadsa </router-link> </span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">{{user}}<i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" @click.prevent="$auth.logout()" >Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <!-- basic table start -->
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Basic Table</h4>
                                <form class="was-validated" method="POST" @submit.prevent="gqr">
                            <div class="form-group">
                            <label class="col-form-label"></label>
                            <select class="custom-select"  v-model="matkul" required>
                                <option  v-for="(matkul) in matkuls"  v-bind:key="matkul.id" :value="matkul.id" > </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select name="prt" class="custom-select" v-model="prt" required>
                                    <option v-for="i in 16" :key="i">{{i}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-rounded btn-xs pull-right" @click.prevent="gqr" >generate</button>
                            <div class="modal fade bd-example-modal-lg show" v-bind:style="{display: display }" >
                                    <div class="modal-dialog modal-lg modal-xl">
                                        <div class="modal-content">
                                            <!-- <div class="modal-header">
                                                <button @click.prevent="closeModal" type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div> -->
                                            <div class="modal-body d-flex justify-content-center">
                                                    <qrcode-vue :value="value" size='500' ></qrcode-vue>
                                            </div>
                                            <div class="modal-footer">
                                                <button @click.prevent="closeModal" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- basic table end -->
                
                    <!-- Hoverable Rows Table start -->
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">show presents</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">date</th>
                                                    <th scope="col">price</th>
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>Mark</td>
                                                    <td>09 / 07 / 2018</td>
                                                    <td>$120</td>
                                                    <td><i class="ti-trash"></i></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>jone</td>
                                                    <td>09 / 07 / 2018</td>
                                                    <td>$150</td>
                                                    <td><i class="ti-trash"></i></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>Mark</td>
                                                    <td>09 / 07 / 2018</td>
                                                    <td>$120</td>
                                                    <td><i class="ti-trash"></i></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>jone</td>
                                                    <td>09 / 07 / 2018</td>
                                                    <td>$150</td>
                                                    <td><i class="ti-trash"></i></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hoverable Rows Table end -->
                    <!-- Progress Table start -->
                    <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Progress Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">task</th>
                                                    <th scope="col">Deadline</th>
                                                    <th scope="col">Progress</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Progress Table end -->
                </div>
            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <footer>
            <div class="footer-area">
                <p>© Copyright 2018. All right reserved. Template by <a href="https://colorlib.com/wp/">Colorlib</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
</template>
<script>
  import QrcodeVue from 'qrcode.vue'
  export default {
    data(){
          return {
              has_error : false,
              matkuls   : null,
              matkul    : null,
              idmtkl    : null,
              prt       : null,
              value     : "",
              display   : "none",
          }
      },
    mounted() {
      this.getMatkuls()
    },
    methods: {
        getMatkuls(){
            this.$http({
                url     : 'matkuls',
                method  : 'GET'
            }).then((res)   => {
                this.matkuls  = res.data.matkuls
                
            })
        },
        gqr(){
            this.value = '127.0.0.1:8000/api/presents/create/'
            this.value = this.value+'?mtkl_id='+this.matkul+'&prt='+this.prt
            if (this.value && this.matkuls&&this.prt != null) {
                this.display    = 'block'
            }
        },
        closeModal(){
            this.display    = 'none'
        }
    },
    components: {
        QrcodeVue
    }
  }
</script>