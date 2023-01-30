const storeApp = Vue.createApp({
    data(){
        return{
            // storeFilter:"",
            // currenList:[],
            storeList:[
                {
                    TAG1: "《Lindsayooo》新興插畫家展",
                    PRODUCT_NAME: "手繪限定油畫",
                    PRICE: "$2,000",
                    MAIN_PHOTO: "../img/store/store01.jpg",
                    type: "展覽限定",
		            countdown: "倒數3天",
		            events_only: "Y"
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "自訂款迷你保溫瓶",
                    PRICE: "$590",
                    MAIN_PHOTO: "../img/store/store02.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "畫家限定簽名",
                    PRICE: "$5,600",
                    MAIN_PHOTO: "../img/store/store03.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "蒙娜麗莎貓貓掛畫",
                    PRICE: "$960",
                    MAIN_PHOTO: "../img/store/store04.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "貓貓洗頭掛畫",
                    PRICE: "$900",
                    MAIN_PHOTO: "../img/store/store05.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "格魯特時鐘",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store06.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "惡夢去去捕夢網",
                    PRICE: "$450",
                    MAIN_PHOTO: "../img/store/store07.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "手繪限量明信片組",
                    PRICE: "$990",
                    MAIN_PHOTO: "../img/store/store08.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "《Lindsayooo》新興插畫家展",
                    PRODUCT_NAME: "手繪限量明信片",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store09.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "《ヒグチユウコ》台灣限定特展",
                    PRODUCT_NAME: "限量手繪絲巾",
                    PRICE: "$1,600",
                    MAIN_PHOTO: "../img/store/store10.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "水彩風手繪小卡組",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store11.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "自訂手工餐盤",
                    PRICE: "$700",
                    MAIN_PHOTO: "../img/store/store12.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "限定手繡毛巾",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store13.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "文青手帳本",
                    PRICE: "$400",
                    MAIN_PHOTO: "../img/store/store14.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "創作者御用顏料",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store15.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "韶光限定",
                    PRODUCT_NAME: "DIY毛線聖誕樹",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store16.jpg",
                    type: "韶光限定",
                    countdown: "",
                    events_only: ""
                },
                {
                    TAG1: "日本畫展",
                    PRODUCT_NAME: "山形實木杯墊",
                    PRICE: "$560",
                    MAIN_PHOTO: "../img/store/store17.jpg",
                    type: "展覽限定",
                    countdown: "倒數3天",
                    events_only: "Y"
                }
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
    },
    created() {
        
        // axios.get("../../php/frontend/store.php")
        //     .then(res => { // 拿今天進行中展演展覽的資料
        //         storeList = [...res.data];
                console.log(storeList);
        //     })
        //     .catch(err => console.log("[store list]", err));
    }
}).mount("#store");