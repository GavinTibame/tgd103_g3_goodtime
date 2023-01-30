export default {
  props: { podProps: Object },
  computed: {
    totalAmt() {
      // console.log(this.podprops);
      return 1;
    }

  },
  mounted() {
    // console.log(this.podProps);
  },
  template: `
    <div>
    <div class="podetail">
      <div>
        <div class="po-key">購買日期</div>
        <div class="po-value"></div>
      </div>
      <div>
        <div class="po-key">主單編號</div>
        <div class="po-value">MO20221210A00001</div>
      </div>
      <div>
        <div class="po-key">子單編號</div>
        <div class="po-value">MM20221210A00001</div>
      </div>
      <div>
        <div class="po-key">付款方式</div>
        <div class="po-value">線上刷卡</div>
      </div>
      <div>
        <div class="po-key">訂單狀態</div>
        <div class="po-value">訂單已確認</div>
      </div>
    </div>

    <div class="po-item">
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
    </div>
    <div class="posum">
        <div>
          <div class="po-key">小計：</div>
          <div class="po-value">NT$　{{totalAmt}}</div>
        </div>
        <div>
          <div class="po-key">運費：</div>
          <div class="po-value">NT$　　60</div>
        </div>
        <div>
          <div class="po-key">總金額：</div>
          <div class="po-value">NT$ {{ totalAmt }}</div>
        </div>
      </div>
  </div>
  `
}