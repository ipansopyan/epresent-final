<template>
 <div class="main-content-inner">
     <div class="row">
         <!-- seo fact area start -->
         <div class="col-lg-8">
             <div class="row">
                 <div class="col-md-6 mt-5 mb-3">
                     <div class="card">
                         <div class="seo-fact sbg1">
                             <div class="p-4 d-flex justify-content-between align-items-center">
                                 <div class="seofct-icon"><i class="ti-user"></i>Mahasiswa</div>
                                 <h2>{{mhs}}</h2>
                             </div>
                             <canvas id="seolinechart1" height="50"></canvas>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-6 mt-md-5 mb-3">
                     <div class="card">
                         <div class="seo-fact sbg2">
                             <div class="p-4 d-flex justify-content-between align-items-center">
                                 <div class="seofct-icon"><i class="ti-user"></i> Dosen</div>
                                 <h2>{{dsn}}</h2>
                             </div>
                             <canvas id="seolinechart2" height="50"></canvas>
                         </div>
                     </div>
                 </div>
                <div class="col-md-6 mt-md-5 mb-3">
                     <div class="card">
                         <div class="seo-fact sbg2">
                             <div class="p-4 d-flex justify-content-between align-items-center">
                                 <div class="seofct-icon"><i class="ti-book"></i> Mata Kuliah</div>
                                 <h2>{{matkul}}</h2>
                             </div>
                             <canvas id="seolinechart2" height="50"></canvas>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <!-- seo fact area end -->
     </div>
 </div>
</template>
<script>
export default {
 props : ['token'],
 data(){
  return {
    mhs : null,
    dsn : null,
    matkul : null,
  }
 },
  mounted() {
    this.getmhs()
    this.getdsn()
    this.getMatkuls()
  },
  methods: {
   getmhs(){
    let url = 'http://192.168.43.184:8000/api/mhs'
       this.$http({
           url     : url,
           method  : 'GET',
           headers : {
               'Content-Type'  : 'application/json',
               'Accept'        : 'application/json',
               Authorization   : 'Bearer '+this.token
           }
       }).then((res) =>{
           this.mhs = res.data.total
       }), ()  =>{
           this.has_error = true
       }
     },
     getdsn(){
        let url = 'http://192.168.43.184:8000/api/dsn'
        this.$http({
           url     : url,
           method  : 'GET',
           headers : {
               'Content-Type'  : 'application/json',
               'Accept'        : 'application/json',
               Authorization   : 'Bearer '+this.token
           }
       }).then((res) =>{
           this.dsn = res.data.total
       }), ()  =>{
           this.has_error = true
       }
     },
    getMatkuls(){
            let url = 'http://192.168.43.184:8000/api/matkuls'
            this.$http({
                url     : url,
                method  : 'GET',
                headers : {
                    'Content-Type'  : 'application/json',
                    'Accept'        : 'application/json',
                    Authorization   : 'Bearer '+this.token
                }
            }).then((res) =>{
                this.matkul = res.data.total
            }), ()  =>{
                this.has_error = true
        }
    },
  },
}
</script>