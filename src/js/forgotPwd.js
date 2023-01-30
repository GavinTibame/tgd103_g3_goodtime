const forgotPwdApp = Vue.createApp({
  data() {
    return {
      user_email: "",
      user_verify: "",
      sentEmail: "無此信箱",
      user_pwd: "",
      message1: "",
      user_repwd: "",
      message2: "",
      isDisabl: false,
      Vcode: "",
      Num: "",
    };
  },
  mounted() {
    const that = this;
    for (var i = 0; i < 6; i++) {
      that.Num += Math.floor(Math.random() * 10).toString();
    }
  },
  methods: {
    emailConfirm() {
      // alert("驗證信已送出");
      axios
        .post("../../php/frontend/forgotPwd.php", {
          user_email: this.user_email,
          user_pwd: "",
        })
        .then((list) => {
          console.log(list.data);
        //   this.sentEmail = list[0];
          // console.log(list[0].EMAIL);
          for (var i = 0; i < 6; i++) {
            this.Num += Math.floor(Math.random() * 10).toString();
          }
          this.emailGo();
        });
    },
    correct() {
      if (this.Vcode == this.Num) {
        if (this.message2 == "" && this.message1 == "") {
          axios
            .post("../../php/frontend/forgotPwd.php", {
              user_email: this.user_email,
              user_pwd: this.user_pwd,
            })
            .then(alert("修改成功"), (location = "../html/log_in.html"));
        } else {
          alert("請輸入有效密碼");
        }
      } else {
        alert("驗證碼錯誤");
      }
      // that.message2 =='' && that.message1 ==''
    },
    emailGo() {
      let that = this;
    //   console.log(1234);
      emailjs.init("DCwlXSLOdGqGTForu");
      const serviceID = "service_95kv0br";
      const templateID = "template_kb00bdg";
      const templateParams = {
        email: this.sentEmail,
        message: this.Num,
      };
      emailjs.send(serviceID, templateID, templateParams).then(
        function (response) {
          that.isDisabl = true;
          console.log(this.isDisabl);
          alert("驗證信已送出");
          // console.log("SUCCESS!", response.status, response.text);
        },
        function (error) {
          // console.log("FAILED...", error);
        }
      );
    },
    check_password1() {
      let reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
      if (reg.test(this.newpassword)) {
        this.message1 = "";
      } else {
        this.message1 = "請輸入正確的密碼格式";
      }
    },
    // 確認密碼
    check_password2() {
      if (this.newpassword !== this.reNewpassword) {
        // console.log(1234);
        this.message2 = "密碼不相同";
      } else {
        this.message2 = "";
      }
    },
  },
}).mount("#forgot-pwd");
