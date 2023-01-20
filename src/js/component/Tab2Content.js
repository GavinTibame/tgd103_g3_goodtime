export default {
  props: { podprops: Object },
  computed: {
    totalAmt() {
      console.log(this.podprops);
      return this.podprops.length;
    }

  },
  template: `
    <dl class="podetail">
      <div>
        <dt class="po-key">購買日期</dt>
        <dd class="po-value">{{podprops}}</dd>
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
          <dd class="po-value">NT$　{{totalAmt}}</dd>
        </div>
        <div>
          <dt class="po-key">運費：</dt>
          <dd class="po-value">NT$　　60</dd>
        </div>
        <div>
          <dt class="po-key">總金額：</dt>
          <dd class="po-value">NT$ {{ totalAmt }}</dd>
        </div>
      </dl>
  `
}