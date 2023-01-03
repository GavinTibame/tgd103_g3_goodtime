const createApp = Vue.createApp({
    data() {
        return {
            selectAll: false,
            freight: 60,
            cartList: [],
            productList: [{
                id: 1,
                main_photo: "../img/shopping_cart/01.jpg",
                name: "自訂款迷你保溫瓶",
                spec: "黑色",
                price: 590,
                qty: 1,
                max_qty: 10
            }, {
                id: 2,
                main_photo: "../img/shopping_cart/01.jpg",
                name: "自訂款迷你保溫瓶",
                spec: "黑色",
                price: 590,
                qty: 1,
                max_qty: 10
            }, {
                id: 3,
                main_photo: "../img/shopping_cart/01.jpg",
                name: "自訂款迷你保溫瓶",
                spec: "黑色",
                price: 590,
                qty: 1,
                max_qty: 10
            }
            ]
        }
    }, computed: {
        totalAmount() {
            let amt = 0;
            this.cartList.forEach(product => {
                amt += product.qty * product.price;
            })
            return amt;
        }
    }, methods: {
        atSelectAll() {
            if (this.selectAll) {
                this.cartList = this.productList;
            } else { this.cartList = []; }
        }, isSelectAll() {
            if (this.cartList.length === this.productList.length) {
                this.selectAll = true;
            } else { this.selectAll = false; }
        }, atDelete(idx, id) {
            this.productList.splice(idx, 1);
            this.cartList = this.cartList.filter(product => product.id !== id);
            this.isSelectAll();
        }
    }
}).mount("#shoppingCart1");