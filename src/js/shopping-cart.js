const shoppingCartApp = Vue.createApp({
    data() {
        return {
            selectAll: false,
            freight: 60,
            cartList: [],
            wantList: [], // 總商品表
            ticketList: [],
            loveList: [], // 總門票表
            totalList: [],
            allList: [] // 總未購表
        }
    }, computed: {
        totalAmount() {
            let amt = 0;
            this.cartList.forEach(product => {
                amt += product.QTY * product.PRICE;
            })
            this.ticketList.forEach(expo => {
                amt += expo.QTY * expo.EXPO_PRICE
            })
            return amt;
        }
    }, methods: {
        atSelectAll() {
            if (this.selectAll) {
                this.cartList = this.wantList;
                this.ticketList = this.loveList;
            } else { this.cartList = []; this.ticketList = []; }
        }, isSelectAll() {
            if (this.cartList.length === this.wantList.length &&
                this.ticketList.length === this.loveList.length) {
                this.selectAll = true;
            } else { this.selectAll = false; }
        }, atDelete(idx, id) {
            // 開始loading畫面
            const deleteItem = JSON.parse( // 把Proxy轉成Object
                JSON.stringify(
                    this.wantList.splice(idx, 1)))[0];
            axios.post("../../php/frontend/cartRemove.php",
                `pid=${deleteItem.FK_CART_PRODUCT_ID}&sid=${deleteItem.FK_CART_PRODUCT_SPEC_ID}`)
                .then(res => {
                    if (res.data === 1) {
                        // 結束loading畫面
                        // console.log("已從購物車移除商品");
                    }
                }).catch(err => {
                    // 結束loading畫面
                    console.log("[cart remove]", err);
                });
            this.wantList = this.wantList.filter(product => product.id !== id);
            this.isSelectAll();
        }, onDelete(idx, id) {
            // 開始loading畫面
            const deleteItem = JSON.parse( // 把Proxy轉成Object
                JSON.stringify(
                    this.loveList.splice(idx, 1)))[0];
            axios.post("../../php/frontend/ticketRemove.php",
                `eid=${deleteItem.EXPO_ID}&price=${deleteItem.EXPO_PRICE}`)
                .then(res => {
                    if (res.data === 1) {
                        // 結束loading畫面
                        // console.log("已從購物車移除商品");
                    }
                }).catch(err => {
                    // 結束loading畫面
                    console.log("[ticket remove]", err);
                });
            this.loveList = this.loveList.filter(expo => expo.id !== id);
            this.isSelectAll();
        }, renderCart() {
            axios.get("../../php/frontend/cart.php")
                .then(res => {
                    this.wantList = res.data;
                }).catch(err => console.log("[cart render]", err));
        }, renderTicket() {
            axios.get("../../php/frontend/ticket.php")
                .then(res => {
                    this.loveList = res.data;
                    this.allList = [...this.loveList, ...this.wantList];
                    console.log(this.allList);
                }).catch(err => console.log("[ticket render]", err));
        }, ticketType(expoObj) {
            if (expoObj.EXPO_PRICE === expoObj.ADULT_PRICE) {
                return "一般票";
            } else if (expoObj.EXPO_PRICE === expoObj.CONC_PRICE) {
                return "優待票";
            } else { return "團體票"; }
        }
    }, created() {
        this.renderCart();
        this.renderTicket();
    }
}).mount("#shoppingCart1");