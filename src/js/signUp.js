const createApp = Vue.createApp({
  data() {
    return {
      user_email: "",
      user_password: "",
      user_confirm_password: "",
      user_name: "",
      user_phone: "",
      user_addr: ""
    };
  },
  methods: {
    selectSpec() {
      console.log(
        this.user_email,
        this.user_password,
        this.user_confirm_password
      );
      console.log(this.user_name, this.user_phone, this.user_addr);
    },
    textTosend() {
      if (this.user_password === this.user_confirm_password) {
        // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
        axios
          .post(
            "../../php/frontend/signUp.php",
            `user_email=${this.user_email}&user_password=${this.user_password}&user_name=${this.user_confirm_password}&user_phone=${this.user_name}&user_addr=${this.user_phone}`
          )

          // then :處理 Promise返回的結果
          .then((res) => {
            if (res.status === 200) {
              // console.log(res);
              window.open("../html/log_in.html", "log_in");
            }
          })
          //catch:抓取Promise 上異常
          .catch((err) => console.log("[signup error]", err));
      }
    },
  },
}).mount("#sign_up-login");
