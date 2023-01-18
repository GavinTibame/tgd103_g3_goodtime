const newApp = Vue.createApp({
  data() {
    return {
      current: 1,    //設定要顯示的頁數:1頁
      paginate: 4,  //每頁要顯示4筆資料
      paginate_total: 0, //總筆數
      status_filter: "",
      currentList: [], //接不同三個universe的空陣列
      tabpanels: [
        {
          time: "2011-11-29",
          universe: "園區公告",
          message: "B展覽園區維修至12:00",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "園區公告",
          message: "C展覽園區廁所施工",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "園區公告",
          message: "A展覽園區廠商施工",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2022-11-11",
          universe: "展演資訊",
          message: "漫畫展延期至12/06",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2022-11-12",
          universe: "展演資訊",
          message: "《Lindsayooo》新興插畫家展",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-13",
          universe: "展演資訊",
          message: "《崖下的波妞》十周年特展",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-14",
          universe: "展演資訊",
          message: "《ヒグチユウコ》台灣限定特展",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-27",
          universe: "其他消息",
          message: "C展覽園館招租中",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-28",
          universe: "其他消息",
          message: "培可先生營業時間延長至24:00",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "B展覽園區維修至12:00",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
        {
          time: "2011-11-29",
          universe: "其他消息",
          message: "線上訂購享9折",
          url: "http://localhost:5500/src/html/news_detail.html",
        },
      ],
    };
  },
  mounted(){
    this.setStatus("");
  },
  updated(){
    this.updatePaginate();
  },
  methods: {
    setPaginate(i) {
      // console.log(i);
      if (this.current == 1) {
        return i < this.paginate;  // i小於4筆資料(ture)則回傳
      } else {

        return (
          i >= this.paginate * (this.current - 1) &&  //i大於當於4筆*當前頁數-1
          i < this.current * this.paginate   // i小於1頁
        );
      }  
      
    },
    setStatus(status) {
      this.status_filter = status;
      if (this.status_filter == "") {
        this.currentList = this.tabpanels;
      }else{
        this.currentList = this.tabpanels.filter((news) => {
            return news.universe == this.status_filter;
        });
      }
      //  console.log(this.status_filter);
      // console.log(this.currentList);
    },
    updateCurrent(i) {
      this.current = i;  
      // console.log(this.current = i);
    },
    updatePaginate() {
      this.paginate_total = Math.ceil(
      document.querySelectorAll(".tab-panel li").length / this.paginate
      );
      // console.log(Math.ceil(document.querySelectorAll(".tab-panel li").length / this.paginate));
      // console.log(this.currentList);
    },

  },

}).mount("#news");
