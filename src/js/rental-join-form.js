
/*------------------------檔案上傳-----------------------*/
function file () {
    var that = this;
    $('.file-box').on('change', '#upload', function(e) {
     var files = e.target.files;
     console.log(files);
     if (files.length > 0) {
     for (var i = 0; i < files.length; i++) {
      var reader = new FileReader();
      reader.onload = function () {
      var text = `
       <div class="img-list">
       <img src="${this.result}" alt="">
       <div class="del-img">删除</div>
       </div>
      `
      $('.img-box').append(text);
      };
      reader.readAsDataURL(files[i]);
      that.filesList.push(files[i]);
     };
     };
    })
    }

/*-----------------------資料串接-----------------------*/

const createApp = Vue.createApp({
    data() {
      return {
        activity__name: "",
        applicant__unit: "",
        principal__name: "",
      };
    },
    methods: {
      textTosend() {
        console.log("tttt")
        if (this.activity__name == "") {
          alert("請輸入您的活動名稱");
          return false;
        }
/*
        // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
        axios
          .post("../../php/frontend/login.php", {
            user_email: this.user_email,
            user_password: this.user_password,
          })
  
          // then :處理 Promise返回的結果
          .then((res) => {
            if (res.data === "登入成功") {
              alert(res.data);
              // console.log(res);
              window.location.href = "../html/memberCenter.html";
            } else {
              alert(res.data);
            }
          })
          //catch:抓取Promise 上異常
          .catch((err) => console.log("[login error]", err));*/
      },
    },
  }).mount("#rental_join_form");