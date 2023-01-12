const createApp = Vue.createApp({
      data(){
        return{
            current: 1,
            paginate: 5,
            paginate_total: 0,
            status_filter: '',
            currentList:[],
            tabpanels: [
                { time: '2011-11-29',
                  universe: '園區公告',
                  message:'B展覽園區維修至12:00', 
                  url:'http://localhost:5500/src/html/news_detail.html'
                },
                { time: '2011-11-29',
                universe: '園區公告',
                message:'B展覽園區維修至12:00', 
                url:'http://localhost:5500/src/html/news_detail.html'
              },
              { time: '2011-11-29',
              universe: '園區公告',
              message:'B展覽園區維修至12:00', 
              url:'http://localhost:5500/src/html/news_detail.html'
            },
            { time: '2011-11-29',
            universe: '展演資訊',
            message:'B展覽園區維修至12:00', 
            url:'http://localhost:5500/src/html/news_detail.html'
          },
          { time: '2011-11-29',
          universe: '其他消息',
          message:'B展覽園區維修至12:00', 
          url:'http://localhost:5500/src/html/news_detail.html'
        },
        { time: '2011-11-29',
        universe: '其他消息',
        message:'B展覽園區維修至12:00', 
        url:'http://localhost:5500/src/html/news_detail.html'
      },
      { time: '2011-11-29',
      universe: '展演資訊',
      message:'B展覽園區維修至12:00', 
      url:'http://localhost:5500/src/html/news_detail.html'
    },
    { time: '2011-11-29',
    universe: '展演資訊',
    message:'B展覽園區維修至12:00', 
    url:'http://localhost:5500/src/html/news_detail.html'
    },
    { time: '2011-11-29',
    universe: '其他消息',
    message:'B展覽園區維修至12:00', 
    url:'http://localhost:5500/src/html/news_detail.html'
    },
    { time: '2011-11-29',
    universe: '其他消息',
    message:'B展覽園區維修至12:00', 
    url:'http://localhost:5500/src/html/news_detail.html'
    },
    { time: '2011-11-29',
    universe: '其他消息',
    message:'B展覽園區維修至12:00', 
    url:'http://localhost:5500/src/html/news_detail.html'
    }
        ]
        }
},methods: {
    setPaginate(i) {
      if (this.current == 1) {
        return i < this.paginate;
      }
      else {
        return (i >= (this.paginate * (this.current - 1)) && i < (this.current * this.paginate));
      }
    },
    setStatus(status) {
      this.status_filter = status;
      this.currentList = this.tabpanels.filter((news)=> {
        if(this.status_filter == ""){
            this.currentList = this.tabpanels;
        }else{
            return news.universe == this.status_filter;
        }
      });
      console.log(this.currentList);
    },
    updateCurrent(i) {
      this.current = i;
    },
    updatePaginate() {
      this.current = 1;
      this.paginate_total = Math.ceil(document.querySelectorAll('tbody tr').length/this.paginate);
    }
  }
}).mount("#news");
