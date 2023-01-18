console.log("aaaa");

const shopsJoinFormApp = Vue.createApp({
  data() {
    return {
      shop__name: "",
      principal_name:"",
      principal_phone:"",
      principal_email:"",
      shopstay__time:"",
      Opinion:""
    };
  },
  methods: {
    ShopJoinTosend() {
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
      console.log("品牌名稱:", this.shop__name);
      console.log("負責人姓名:", this.principal_name);
      console.log("負責人電話:", this.principal_phone);
      console.log("負責人信箱:", this.principal_email);
      console.log("預計駐園時長:", this.shopstay__time);
      console.log("意見回饋:", this.Opinion);
    },
  },
}).mount("#Join__form");
