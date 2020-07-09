<template>
            <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <!-- basic table start -->
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Generate Barcode</h4>
                                <form class="was-validated" method="POST" @submit.prevent="gqr">
                            <div class="form-group">
                            <label class="col-form-label"></label>
                            <select v-model="matkul" class="custom-select" required>
                                <option value="">--Select Matkul--</option>
                                <option v-for="matkul in matkuls" v-bind:key="matkul.id" :value="matkul.id" >{{matkul.name_matkul}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select v-model="prt" class="custom-select"  required>
                                    <option value="">--Select Meeting--</option>
                                    <option v-for="i in 16" v-bind:key="i">{{i}}</option>
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
                                                    <qrcode-vue :value="value" size='200' ></qrcode-vue>
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
                                <h4 class="header-title">Show presents</h4>
                                <form class="was-validated" method="POST" @submit.prevent="gqr">
                            <div class="form-group">
                            <label class="col-form-label"></label>
                            <select v-model="matkulid" class="custom-select" required>
                                <option value="">--Select Matkul--</option>
                                <option v-for="matkul in matkuls" v-bind:key="matkul.id" :value="matkul.id" >{{matkul.name_matkul}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-rounded btn-xs pull-right" @click.prevent="showpresents(matkulid)" >Show</button>
                        </div>
                    </form>
                            </div>
                        </div>
                    </div>
                    <!-- Hoverable Rows Table end -->
                    <!-- Progress Table start -->
                    <div v-if="show" class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Progress Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">No</th>
                                                    <th scope="col">Mahasiswa</th>
                                                    <th scope="col">mata Kuliah</th>
                                                    <th scope="col">1</th>
                                                    <th scope="col">2</th>
                                                    <th scope="col">3</th>
                                                    <th scope="col">4</th>
                                                    <th scope="col">5</th>
                                                    <th scope="col">6</th>
                                                    <th scope="col">7</th>
                                                    <th scope="col">8</th>
                                                    <th scope="col">9</th>
                                                    <th scope="col">10</th>
                                                    <th scope="col">11</th>
                                                    <th scope="col">12</th>
                                                    <th scope="col">13</th>
                                                    <th scope="col">14</th>
                                                    <th scope="col">15</th>
                                                    <th scope="col">16</th>
                                                </tr>
                                            </thead>
                                            <tbody v-for="(present,index) in presents" :key="present.id" >
                                                <td>{{(pagination.current_page*pagination.per_page)-pagination.per_page + index+1}}</td>
                                                <td>{{present.name}}</td>
                                                <td>{{present.name_matkul}}</td>
                                                <td v-if="present.prt1">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt2">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt3">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt4">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt5">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt6">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt7">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt8">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt9">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt10">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt11">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt12">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt13">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt14">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt15">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>
                                                <td v-if="present.prt16">
                                                    <span class="ti-check"></span>
                                                </td><td v-else></td>   
                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-end">
                                                <li class="page-item" v-bind:class="[{disabled : !pagination.prev_page_url}]" >
                                                    <a class="page-link" href="javascript:void(0)" @click="showpresents(matkulid,pagination.prev_page_url)" >Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">
                                                        {{pagination.current_page}} of {{pagination.last_page}}
                                                    </a></li>
                                                <li class="page-item " v-bind:class="[{disabled : !pagination.next_page_url}]" >
                                                    <a class="page-link" href="javascript:void(0)" @click="showpresents(matkulid,pagination.next_page_url)">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Progress Table end -->
                </div>
            </div>
</template>
<script>
    import QrcodeVue from 'qrcode.vue'
    export default {
        props : ['matkuls','token'],
        name : 'router-view',
    data(){
          return {
              has_error : false,
              display   : "none",
              value     : "",
              matkul    : "",
              prt       : "",
              present   : "",
              presents  : [],
              matkulid  : "",
              pagination: {},
              show      : false
          }
      },
    mounted() {
      this.matkuls = JSON.parse(this.matkuls)
    },
    methods: {
        gqr(){
            this.value = 'http://192.168.43.184:8000/api/present'
            this.value = this.value+'?mtkl_id='+this.matkul+'&prt='+this.prt
            if (this.value && this.matkul&&this.prt != null) {
                this.display    = 'block'
            }
            console.log(this.value);
            
        },
        closeModal(){
            this.display = 'none'
        },
        showpresents(matkulid,page_url){
            let url = page_url || 'http://192.168.43.184:8000/api/present/'+matkulid
            this.$http({
                url     : url,
                method  : 'GET',
                params  : {
                    mtkl_id : matkulid,
                },
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.presents = res.data.data
                this.createPagination(res.data.current_page,res.data.last_page_url,res.data.next_page_url,res.data.prev_page_url,res.data.last_page,res.data.per_page)                
                if (this.presents.length != 0) {
                    this.show = true
                }
                if (this.presents.length == 0) {
                    this.show = false
                }
            }).catch(error => {
                    console.log(error);
                })
        },
        createPagination(current,last,next,prev,last_page,per_page){
            let pagination = {
                current_page    : current,
                last_page_url   : last,
                next_page_url   : next,
                prev_page_url   : prev,
                last_page       : last_page,
                per_page        : per_page
            }
            this.pagination = pagination
        },
    },
    components: {
        QrcodeVue
    }
  }
</script>