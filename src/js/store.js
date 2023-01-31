const storeApp = Vue.createApp({
    data(){
        return{
            storeFilter:"",
            currentFilter: 'ALL',
            currentList:[],
            storeList:[]
        };
    },
    mounted(){
       
    },
    updated(){
      
    },
    computed:{
       
    },
    methods:{
        all(){
                axios.get("../../php/frontend/store.php")
                .then(res => { // 拿今天進行中展演展覽的資料
                        this.storeList = [...res.data];
                        console.log(this.storeList);
                    })
                    .catch(err => console.log("[store list]", err));        
        },
        // ==== 篩選 ====
        filter(status){
                this.status_filter = status;
                console.log(status);
                console.log(this.storeList);
                axios.get("../../php/frontend/store.php")
                .then(res => { // 拿今天進行中展演展覽的資料
                        this.storeList = [...res.data];
                        console.log(this.storeList);

                        let value = Object.values(this.storeList);
                        console.log(value);
              
                        this.storeList = value.filter((store) => {
                                return store.TAG1 == this.status_filter;
                        });

                })
        }
    },
    created() {
        
        axios.get("../../php/frontend/store.php")
        .then(res => { // 拿今天進行中展演展覽的資料
                this.storeList = [...res.data];
                console.log(this.storeList);
            })
            .catch(err => console.log("[store list]", err));
            
    }
}).mount("#store");
