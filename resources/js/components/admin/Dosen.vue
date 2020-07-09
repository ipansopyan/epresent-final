
<template>
<!-- page title area end -->
<div class="main-content-inner">
 <div class="row">
     <!-- Progress Table start -->
  <div class="col-12 mt-5">
   <div class="card">
    <div class="card-body">
     <h4 class="header-title">Data Mahasiswa</h4>
     <div class="d-flex justify-content-end">
         <button class="btn btn-xs btn-primary" @click.prevent="showModal">add</button>
     </div>
     <div class="modal fade bd-example-modal-sm show" v-bind:style="{display : display}" >
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">Data Mahasiswa</h5>
                     <button @click.prevent="closeModal" type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                 </div>
                 <form class="was-validated" @submit.prevent="register" method="post">
                 <div class="modal-body">
                     <div class="form-group">
                         <input required v-model="name" class="form-control form-control" type="text" placeholder="name">
                         <!-- <p v-if="errors.name != null" class="alert-danger">field harus di isi</p> -->
                     </div>
                     <div class="form-group">
                         <input required v-model="email" class="form-control form-control" type="email" placeholder="email">
                         <p v-if="errors.email != null" class="alert-danger">{{errors.email}}</p>
                     </div>
                     <div class="form-group">
                         <input required v-model="password" class="form-control form-control" type="password" placeholder="password">
                         <p v-if="errors.password != null" class="alert-danger">{{errors.password}}</p>
                     </div>
                     <div class="form-group">
                         <input required v-model="password_confirmation" class="form-control form-control" type="password" placeholder="password confirmation">
                         <p v-if="errors.password_confirmation != null" class="alert-danger">{{errors.password_confirmation}}</p>
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
     <div class="single-table">
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
                <tr v-for="(mahasiswa,index) in mahasiswas" v-bind:key="mahasiswa.id">
                    <td>{{(pagination.current_page*pagination.per_page)-pagination.per_page + index+1}}</td>
                    <td scope="row" >{{mahasiswa.name}}</td>
                    <td scope="row" >{{mahasiswa.email}}</td>
                    <td>
                        <ul class="d-flex justify-content-center">
                            <!-- <li class="mr-3"><a href="javascript:void(0)" @click.prevent="editMatkul(matkul)" class="text-secondary"><i class="fa fa-edit"></i></a></li> -->
                            <li><a href="javascript:void(0)" @click.prevent="deletemhs(mahasiswa)" class="text-danger"><i class="ti-trash"></i></a></li>
                        </ul>
                    </td>
                </tr>
       </table>
       <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <li class="page-item" v-bind:class="[{disabled : !pagination.prev_page_url}]" >
                    <a class="page-link" href="javascript:void(0)" @click="getdsn(pagination.prev_page_url)" >Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">
                        {{pagination.current_page}} of {{pagination.last_page}}
                    </a></li>
                <li class="page-item " v-bind:class="[{disabled : !pagination.next_page_url}]" >
                    <a class="page-link" href="javascript:void(0)" @click="getdsn(pagination.next_page_url)">Next</a>
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
              mahasiswas    : {},
              pagination    : {},
              name          : "",
              email         : "",
              password      : "",
              password_confirmation: "",
              errors : {
                  name  : null,
                  email : null,
                  password  : null,
                  password_confirmation : null,
              }
          } 
      },
    mounted() {
        this.getdsn()
        
    },
    methods: {
     getdsn(page_url){
         let url = page_url || 'http://192.168.43.184:8000/api/dsn'
            this.$http({
                url     : url,
                method  : 'GET',
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.mahasiswas = res.data.data
                this.createPagination(res.data.current_page,res.data.last_page_url,res.data.next_page_url,res.data.prev_page_url,res.data.last_page,res.data.per_page)
            }), ()  =>{
                this.has_error = true
            }
     },
     register(){
        this.$http({
            url     : 'http://192.168.43.184:8000/api/auth/register',
            method  : 'POST',
            params  : {
                name                    : this.name,
                email                   : this.email,
                password                : this.password,
                password_confirmation   : this.password_confirmation,
                role                    : 2
                },
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.getdsn();
                this.closeModal();
                this.resetForm()
            }).catch(error => {
                this.errors.email = error.response.data.errors.email[0]
                this.errors.password = error.response.data.errors.password[0]
                this.errors.password_confirmation = error.response.data.errors.password_confirmation
        })
     },
     deletemhs(mahasiswa){
        let decision = confirm('Are you sure?');
            if (decision == true) {
                this.$http({
                    url     : 'http://192.168.43.184:8000/api/user/'+mahasiswa.id,
                    method  : 'delete',
                    headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
                }).then((res) => {
                    this.getdsn()
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
        resetForm(){
            this.name = null
            this.email = null
            this.password = null
            this.password_confirmation = null
            this.errors.email = null
            this.errors.password = null
            this.errors.password_confirmation = null
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