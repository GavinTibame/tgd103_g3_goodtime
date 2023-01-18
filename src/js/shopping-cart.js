const createApp_shopping_cart = Vue.createApp({
    data() {
        return {
            selectAll: false,
            freight: 60,
            cartList: [],
            wantList: []
        }
    }, computed: {
        totalAmount() {
            let amt = 0;
            this.cartList.forEach(product => {
                amt += product.QTY * product.PRICE;
            })
            return amt;
        }
    }, methods: {
        atSelectAll() {
            if (this.selectAll) {
                this.cartList = this.wantList;
            } else { this.cartList = []; }
        }, isSelectAll() {
            if (this.cartList.length === this.wantList.length) {
                this.selectAll = true;
            } else { this.selectAll = false; }
        }, atDelete(idx, id) {
            // 開始loading畫面
            const deleteItem = JSON.parse( // 把Proxy轉成Object
                JSON.stringify(
                    this.wantList.splice(idx, 1)))[0];
            axios.post("../../php/frontend/cartRemove.php",
                `mid=${deleteItem.FK_CART_MEMBER_ID}&pid=${deleteItem.FK_CART_PRODUCT_ID}&sid=${deleteItem.FK_CART_PRODUCT_SPEC_ID}`)
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
            console.log(this.wantList);
        }, renderCart() {
            axios.get("../../php/frontend/cart.php")
                .then(res => {
                    this.wantList = res.data;
                }).catch(err => console.log("[cart render]", err));
        }
    }, created() {
        this.renderCart()
    }
}).mount("#shoppingCart1");