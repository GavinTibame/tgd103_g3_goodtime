const storeApp = Vue.createApp({
    data(){
        return{
            storeFilter:"",
            currentList:[],
            storeList:[
                // {
                //      ID: 1,
                //      MAIN_PHOTO: "../img/product_detail/item17.png",
                //      PRODUCT_NAME: "蒙娜麗莎貓貓掛畫",
                //      PRICE: 960
                // },
                // {
                //      ID: 2,
                //      MAIN_PHOTO: "../img/product_detail/item01.png",
                //      PRODUCT_NAME: "自訂款迷你保溫瓶",
                //      PRICE: 590
                //    
                // },
                // {
                        // ID: 3,
                        // MAIN_PHOTO: "../img/product_detail/item02.png",
                        // PRODUCT_NAME: "貓貓洗頭掛畫",
                        // PRICE: 900
                // },
                // {
                        // ID: 4,
                        // MAIN_PHOTO: "../img/product_detail/item03.png",
                        // PRODUCT_NAME: "惡夢去去捕夢網",
                        // PRICE: 450
                // },
                // {
                        // ID: 5,
                        // MAIN_PHOTO: "../img/product_detail/item04.png",
                        // PRODUCT_NAME: "手繪限定油畫",
                        // PRICE: 2000
                // },
                // {
                        // ID: 6,
                        // MAIN_PHOTO: "../img/product_detail/item05.png",
                        // PRODUCT_NAME: "畫家限定簽名",
                        // PRICE: 5600
                // },
                // {
                        // ID: 7,
                        // MAIN_PHOTO: "../img/product_detail/item06.png",
                        // PRODUCT_NAME: "格魯特時鐘",
                        // PRICE: 560
                // },
                // {
                
                // },
                // {
                        // ID: 8,
                        // MAIN_PHOTO: "../img/product_detail/item07.png",
                        // PRODUCT_NAME: "手繪限量明信片組",
                        // PRICE: 990
                // },
                // {
                        // ID: 9,
                        // MAIN_PHOTO: "../img/product_detail/item08.png",
                        // PRODUCT_NAME: "手繪限量明信片",
                        // PRICE: 560
                // },
                // {
                        // ID: 10,
                        // MAIN_PHOTO: "../img/product_detail/item09.png",
                        // PRODUCT_NAME: "限量手繪絲巾",
                        // PRICE: 1600
                // },
                // {
                        // ID: 11,
                        // MAIN_PHOTO: "../img/product_detail/item10.png",
                        // PRODUCT_NAME: "水彩風手繪小卡組",
                        // PRICE: 560
                // },
                // {
                        // ID: 12,
                        // MAIN_PHOTO: "../img/product_detail/item11.png",
                        // PRODUCT_NAME: "自訂手工餐盤",
                        // PRICE: 700
                // },
                // {
                        // ID: 13,
                        // MAIN_PHOTO: "../img/product_detail/item12.png",
                        // PRODUCT_NAME: "限定手繡毛巾",
                        // PRICE: 560
                // },
                // {
                        // ID: 14,
                        // MAIN_PHOTO: "../img/product_detail/item13.png",
                        // PRODUCT_NAME: "文青手帳本",
                        // PRICE: 400
                // },
                // {
                        // ID: 15,
                        // MAIN_PHOTO: "../img/product_detail/item14.png",
                        // PRODUCT_NAME: "創作者御用顏料",
                        // PRICE: 560
                // },
                // {
                        // ID: 16,
                        // MAIN_PHOTO: "../img/product_detail/item15.png",
                        // PRODUCT_NAME: "DIY毛線聖誕樹",
                        // PRICE: 560
                // },
                // {
                        // ID: 17,
                        // MAIN_PHOTO: "../img/product_detail/item16.png",
                        // PRODUCT_NAME: "山形實木杯墊",
                        // PRICE: 280
                // }
            ]
        };
    },
    mounted(){
        
    },
    updated(){
        console.log(`TTT`);
    },
    methods:{
        // setFilter(filter){
        //     this.storeFilter = filter;
        //     console.log(filter)
        // }
        all(){
                axios.get("../../php/frontend/store.php")
                .then(res => { // 拿今天進行中展演展覽的資料
                        this.storeList = [...res.data];
                        console.log(this.storeList);
                    })
                    .catch(err => console.log("[store list]", err));        
        },
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