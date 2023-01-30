const storeApp = Vue.createApp({
    data(){
        return{
            storeFilter:"",
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
        
    },
    created() {
        
        axios.get("../../php/frontend/store.php")
        .then(res => { // 拿今天進行中展演展覽的資料
                this.storeList = [...res.data];
                console.log(storeList);
            })
            .catch(err => console.log("[store list]", err));
            
    }
}).mount("#store");