export default {
    // props:["memberCenter"],
    template: `
    <dl class="po-single">
                  <div>
                    <dt class="po-key">購買日期</dt>
                    <dd class="po-value">2022-12-10 10:00</dd>
                  </div>
                  <div>
                    <dt class="po-key">主單編號</dt>
                    <dd class="po-value">{{memberCenter[0].ID}}</dd>
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
  }