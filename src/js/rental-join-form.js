/*------------------------檔案上傳-----------------------*/
function file() {
  var that = this;
  $(".file-box").on("change", "#upload", function (e) {
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
      `;
          $(".img-box").append(text);
        };
        reader.readAsDataURL(files[i]);
        that.filesList.push(files[i]);
      }
    }
  });
}

/*-----------------------資料串接-----------------------*/

const createApp = Vue.createApp({
  data() {
    return {
      activity__name: "",
      applicant__unit: "",
      principal__name: "",
      nature__activity: [],
      unit__spacing:"",

    };
  },
  methods: {
    rentalTosend() {
      if (this.activity__name == "") {
        alert("請輸入您的活動名稱");
        return false;
      }

      if (this.applicant__unit == "") {
        alert("請輸入申請單位");
        return false;
      }

      if (this.principal__name == "") {
        alert("請負責人姓名");
        return false;
      }
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
        .catch((err) => console.log("[login error]", err));
    },
    handleSubmit() {
      console.log("活動名稱:", this.applicant__unit);
      console.log("申請單位:", this.activity__name);
      console.log("負責人姓名:", this.applicant__unit);
      console.log("單位類別:", this.unit__spacing);
    },
  },
}).mount("#rental_join_form");
