
<template>
            <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <!-- Progress Table start -->
                    <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Data Mata Kuliah</h4>
                                <div class="d-flex justify-content-end">
                                    <button class="btn btn-xs btn-primary" @click.prevent="showModal">add</button>
                                </div>
                                    <div class="modal fade bd-example-modal-sm show" v-bind:style="{display : display}" >
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Data Mata Kuliah</h5>
                                                    <button @click.prevent="closeModal" type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                                </div>
                                                <form class="was-validated" @submit.prevent="create" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <input required v-model="mata_kuliah" class="form-control form-control" type="text" placeholder="nama matakuliah">
                                                        <p v-if="errors.name != null" class="alert-danger">{{errors.name}}</p>
                                                    </div>
                                                    <div class="form-group">
                                                    <label class="col-form-label">Select</label>
                                                    <select required v-model="dosen_id" class="form-control">
                                                        <option>--select dosen--</option>
                                                        <option v-for="dosen in dosens" v-bind:key="dosen.id" :value="dosen.id" >{{dosen.name}}</option>
                                                    </select>
                                                    <p v-if="errors.dosen != null " class="alert-danger">field harus di isi</p>
                                            </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" @click.prevent="closeModal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                <div  class="single-table">
                                    <div class="table-responsive">
                                        <table class="table tsble-striped text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">No</th>
                                                    <th scope="col">Nama</th>
                                                    <th scope="col">Pengajar</th>
                                                    <th>Opsi</th>
                                                </tr>
                                            </thead>
                                            <tr v-for="(matkul,index) in matkuls" v-bind:key="matkul.id">
                                                <td>{{(pagination.current_page*pagination.per_page)-pagination.per_page + index+1}}</td>
                                                <td scope="row" >{{matkul.name_matkul}}</td>
                                                <td scope="row" >{{matkul.name}}</td>
                                                <td>
                                                    <ul class="d-flex justify-content-center">
                                                        <li class="mr-3"><a href="javascript:void(0)" @click.prevent="editMatkul(matkul)" class="text-secondary"><i class="fa fa-edit"></i></a></li>
                                                        <li><a href="javascript:void(0)" @click.prevent="deleteMatkul(matkul)" class="text-danger"><i class="ti-trash"></i></a></li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-end">
                                                <li class="page-item" v-bind:class="[{disabled : !pagination.prev_page_url}]" >
                                                    <a class="page-link" href="javascript:void(0)" @click="getMatkuls(pagination.prev_page_url)" >Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">
                                                        {{pagination.current_page}} of {{pagination.last_page}}
                                                    </a></li>
                                                <li class="page-item " v-bind:class="[{disabled : !pagination.next_page_url}]" >
                                                    <a class="page-link" href="javascript:void(0)" @click="getMatkuls(pagination.next_page_url)">Next</a>
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
    export default {
    props : ['token'],
    data(){
          return {
            //   has_error : false,
              display       : "none",
              mata_kuliah   : null,
              dosen_id      : null,
              pagination    : {},
              matkuls       : {
                  id        : "",
                  index     : "",
                  name      : "",
                  user_id   : ""
              },
              dosens        : {},
              edit          : false,
              errors        : {
                  name  : null,
                  dosen : null
              }
          } 
      },
    mounted() {
      this.getMatkuls()
      this.getdosens()
    },
    methods: {
        getMatkuls(page_url){
            let token = this.token
            
            let url = page_url || 'http://192.168.43.184:8000/api/matkuls'
            this.$http({
                url     : url,
                method  : 'GET',
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.matkuls = res.data.data
                this.createPagination(res.data.current_page,res.data.last_page_url,res.data.next_page_url,res.data.prev_page_url,res.data.last_page,res.data.per_page)
            }), ()  =>{
                this.has_error = true
            }
        },
        getdosens() {
            this.$http({
                url     : 'http://192.168.43.184:8000/api/dosens',
                method  : 'GET',
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.dosens = res.data.data
            }), ()  =>{
                this.has_error = true
            }
        },
        create(){
            if (this.edit == true) {                                
                this.$http({
                url     : 'http://192.168.43.184:8000/api/matkul/'+this.matkuls.id,
                method  : 'PUT',
                params  : {
                    name_matkul : this.mata_kuliah,
                    user_id     : this.dosen_id
                },
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.getMatkuls();
                this.closeModal();
                this.resetForm()
            }).catch(error => {
                    this.errors.name = error.response.data.errors.name_matkul[0]
                    this.errors.dosen = error.response.data.errors.user_id
                })
            } else {
            this.$http({
                url     : 'http://192.168.43.184:8000/api/matkul/create',
                method  : 'POST',
                params  : {
                    name_matkul : this.mata_kuliah,
                    user_id     : this.dosen_id
                    },
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
                }).then((res) =>{
                    this.getMatkuls();
                    this.closeModal();
                    this.resetForm()      
                }).catch(error => {
                    this.errors.name = error.response.data.errors.name_matkul[0]
                    this.errors.dosen = error.response.data.errors.user_id
                    
                })
            }
        },
        resetForm(){
            this.edit        = false
            this.matkuls.id  = ""
            this.mata_kuliah = ""
            this.dosen_id    = ""
            this.dosen_name  = ""
            this.errors.name  = null
            this.errors.dosen = null
            

        },
        editMatkul(matkul){    
            this.matkuls.id  = matkul.id 
            this.mata_kuliah = matkul.name_matkul
            this.dosen_id    = matkul.user_id
            this.dosen_name  = matkul.name
            this.showModal();

            this.edit = true
        },
        deleteMatkul(matkul){    
            let decision = confirm('Are you sure?');
            if (decision == true) {
                this.$http({
                    url     : 'http://192.168.43.184:8000/api/matkul/'+matkul.id,
                    method  : 'delete',
                    headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
                }).then((res) => {
                    this.getMatkuls()
                })
            }
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
        showModal(){
            this.display = 'block'
        },
        closeModal(){
            this.display = 'none'
            this.resetForm()
        }
    },
    components: {
        
    }
  }
</script>