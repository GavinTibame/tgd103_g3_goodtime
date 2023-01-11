/* 頁首頁尾載入 */
$(() => {
  $("#header").load("topbar.html");
  $("#footer").load("footer.html");
});

/* 區塊滑動 */

$(function () {
  // 偵聽a click
  $(".nav-ctn li").bind("click", function () {
    var id = $(this).attr("data-nav");

    // 取得目標區塊的y座標
    var target_top = $("#item_" + id).offset().top - 100;

    // 取得body物件 這種寫法在各瀏覽器上最保險
    var $body = window.opera
      ? document.compatMode == "CSS1Compat"
        ? $("html")
        : $("body")
      : $("html,body");

    // 移動捲軸有動畫效果
    $body.animate(
      {
        scrollTop: target_top,
      },
      800
    );
  });
});

/* 標籤-active切換 */

$(".nav-block").on("click", function () {
  $(this).closest(".nav-ctn").find(".title").removeClass("-active");
  console.log($(this).find(".title"));
  $(this).find(".title").addClass("-active");
});

/* ----------------修改地址、修改密碼 -----------------*/

var app = Vue.createApp({
  data() {
    return {
      currentTab: "tab1",
      tabs: [
        {
          id: "tab1",
          name: "修改地址",
        },
        {
          id: "tab2",
          name: "修改密碼",
        },
      ],
      addr: [
        {
          addrText: "台北市松山區敦化北路100號2樓",
          clickId: "edit",
        },
        {
          addrText: "台北市中山區南京東路三段219號5樓",
          clickId: "edit",
        },
      ],
    };
  },
  //頁籤tab切換
  computed: {
    current_tab_component() {
      return this.currentTab + "_content";
    },
  },
  methods: {
    //修改資料按鈕
    changehtml(e) {
      // console.log(e)，這裡的e = index
      if (this.addr[e].clickId === "edit") {
        this.addr[e].clickId = "noEdit";
      } else {
        this.addr[e].clickId = "edit";
      }
    },

    //新增地址按鈕
    addAddr() {
      this.addr.push({
        addrText: "",
        clickId: "noEdit",
      });
    },
    //刪除鈕
    deletehtml(e) {
      this.addr.splice(e, 1);
    },
  },
});

/*
app.component("tab1_content", {
  template: `
      <div class="addr-tab">
        <div class="addr-col">
          <label for="addr1"><input type="radio" name="addr" id="addr1" value="addr1">
            <div id="memberAddr1">目前地址1</div>
          </label>
          <input type="text" name="" id="" placeholder="目前地址1">
          <button class="edit-addr">
            <span class="material-symbols-outlined"> edit_note </span>
          </button>
          <button class="edit-addr">
            <span class="material-symbols-outlined"> delete </span>
          </button></div>
          <div class="addr-col">
            <label for="addr2">
              <input type="radio" name="addr" id="addr2" value="addr2">
              <div id="memberAddr2" style="display: block;"> 104台北市中山區南京東路三段219號5樓 </div>
            </label><input type="text" name="" id="" placeholder="104台北市中山區南京東路三段219號5樓" style="display: none;">
            <button class="edit-addr">
              <span class="material-symbols-outlined"> select_check_box </span>
            </button><button class="edit-addr">
              <span class="material-symbols-outlined"> delete </span>
            </button></div><div class="btn__ctn">
              <textarea name="" id="new-addr" cols="30" rows="10" placeholder="請輸入新增的地址"></textarea>
            </div>
            <div class="btn__ctn">
              <button id="add-addr" class="button" >
                <span>新增地址</span>
                </button>
            </div>
            </div>
`,
});
*/

app.component("tab2_content", {
  template: `
  <div class="pwd-tab">
            <div>
              <label for="prevPwd">目前密碼</label
              ><input type="password" name="prevPwd" id="prevPwd" />
            </div>
            <div>
              <label for="newPwd">新密碼</label
              ><input type="password" name="newPwd" id="newPwd" />
            </div>
            <div>
              <label for="cfmPwd">確認新密碼</label
              ><input type="password" name="cfmPwd" id="cfmPwd" />
            </div>
            <div class="btn__ctn">
              <button id="add-addr" class="button" type="submit">
                <span>確認修改</span>
              </button>
            </div>
          </div>
`,
});

app.mount("#item_acc-block");

// 訂單查詢、訂單明細區塊

var app = Vue.createApp({
  data() {
    return {
      currentTab: "tab1",
      tabs: [
        {
          id: "tab1",
          name: "訂單查詢",
        },
        {
          id: "tab2",
          name: "訂單明細",
        },
      ],
    };
  },
  computed: {
    current_tab_component() {
      return this.currentTab + "_content";
    },
  },
});

app.component("tab1_content", {
  template: `
  <dl class="po-single">
                <div>
                  <dt class="po-key">購買日期</dt>
                  <dd class="po-value">2022-12-10 10:00</dd>
                </div>
                <div>
                  <dt class="po-key">主單編號</dt>
                  <dd class="po-value">MO20221210A00001</dd>
                </div>
                <div>
                  <dt class="po-key">子單編號</dt>
                  <dd class="po-value">MM20221210A00001</dd>
                </div>
                <div>
                  <dt class="po-key">購買金額</dt>
                  <dd class="po-value">TWD$ 1,000元</dd>
                </div>
                <div>
                  <dt class="po-key">付款方式</dt>
                  <dd class="po-value">線上刷卡</dd>
                </div>
                <div>
                  <dt class="po-key">訂單狀態</dt>
                  <dd class="po-value">訂單已確認</dd>
                </div>
              </dl>
              <dl class="po-single">
                <div class="po-col">
                  <dt class="po-key">購買日期</dt>
                  <dd class="po-value">2022-12-10 10:00</dd>
                </div>
                <div class="po-col">
                  <dt class="po-key">主單編號</dt>
                  <dd class="po-value">MO20221210A00001</dd>
                </div>
                <div class="po-col">
                  <dt class="po-key">子單編號</dt>
                  <dd class="po-value">MM20221210A00001</dd>
                </div>
                <div class="po-col">
                  <dt class="po-key">購買金額</dt>
                  <dd class="po-value">TWD$ 1,000元</dd>
                </div>
                <div class="po-col">
                  <dt class="po-key">付款方式</dt>
                  <dd class="po-value">線上刷卡</dd>
                </div>
                <div class="po-col">
                  <dt class="po-key">訂單狀態</dt>
                  <dd class="po-value">訂單已確認</dd>
                </div>
              </dl>
`,
});

app.component("tab2_content", {
  template: `
  <dl class="podetail">
                <div>
                  <dt class="po-key">購買日期</dt>
                  <dd class="po-value">2022-12-10 10:00</dd>
                </div>
                <div>
                  <dt class="po-key">主單編號</dt>
                  <dd class="po-value">MO20221210A00001</dd>
                </div>
                <div>
                  <dt class="po-key">子單編號</dt>
                  <dd class="po-value">MM20221210A00001</dd>
                </div>
                <div>
                  <dt class="po-key">付款方式</dt>
                  <dd class="po-value">線上刷卡</dd>
                </div>
                <div>
                  <dt class="po-key">訂單狀態</dt>
                  <dd class="po-value">訂單已確認</dd>
                </div>
              </dl>
              <dl class="po-item">
                <div class="item-single">
                  <img src="../img/store/store05.jpg" alt="" />
                  <div class="item-detail">
                    <div>
                      <p>蒙娜麗莎貓掛畫</p>
                      <small>30” x 30”</small>
                    </div>
                    <div>
                      <small>數量：1</small>
                    </div>
                    <div>
                      <small>售價：NT$990</small>
                    </div>
                  </div>
                </div>
                <div class="item-single">
                  <img src="../img/store/store06.jpg" alt="" />
                  <div class="item-detail">
                    <div>
                      <p>蒙娜麗莎貓掛畫</p>
                      <small>30” x 30”</small>
                    </div>
                    <div>
                      <small>數量：1</small>
                    </div>
                    <div>
                      <small>售價：NT$990</small>
                    </div>
                  </div>
                </div>
                <div class="item-single">
                  <img src="../img/store/store11.jpg" alt="" />
                  <div class="item-detail">
                    <div>
                      <p>蒙娜麗莎貓掛畫</p>
                      <small>30” x 30”</small>
                    </div>
                    <div>
                      <small>數量：1</small>
                    </div>
                    <div>
                      <small>售價：NT$990</small>
                    </div>
                  </div>
                </div>
                <div class="item-single">
                  <img src="../img/store/store13.jpg" alt="" />
                  <div class="item-detail">
                    <div>
                      <p>蒙娜麗莎貓掛畫</p>
                      <small>30” x 30”</small>
                    </div>
                    <div>
                      <small>數量：1</small>
                    </div>
                    <div>
                      <small>售價：NT$990</small>
                    </div>
                  </div>
                </div>
                <div class="item-single">
                  <img src="../img/store/store15.jpg" alt="" />
                  <div class="item-detail">
                    <div>
                      <p>蒙娜麗莎貓掛畫</p>
                      <small>30” x 30”</small>
                    </div>
                    <div>
                      <small>數量：1</small>
                    </div>
                    <div>
                      <small>售價：NT$990</small>
                    </div>
                  </div>
                </div>
              </dl>
              <dl class="posum">
                <div>
                  <dt class="po-key">小計：</dt>
                  <dd class="po-value">NT$　4950</dd>
                </div>
                <div>
                  <dt class="po-key">運費：</dt>
                  <dd class="po-value">NT$　　60</dd>
                </div>
                <div>
                  <dt class="po-key">總金額：</dt>
                  <dd class="po-value">NT$　5010</dd>
                </div>
              </dl>
`,
});

app.mount("#item_po-block");