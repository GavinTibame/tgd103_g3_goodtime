const createApp = Vue.createApp({
    data() {
        return {
            selectAll: false,
            freight: 60,
            cartList: [],
            productList: [{
                id: 1,
                main_photo: "../img/store/store02.jpg",
                name: "自訂款迷你保溫瓶",
                spec: `黑色`,
                price: 590,
                qty: 1,
                max_qty: 10
            }, {
                id: 2,
                main_photo: "../img/store/store04.jpg",
                name: "蒙娜麗莎貓貓掛畫",
                spec: `30" x 30"`,
                price: 960,
                qty: 1,
                max_qty: 5
            }, {
                id: 3,
                main_photo: "../img/store/store05.jpg",
                name: "貓貓洗頭掛畫",
                spec: `40" x 55"`,
                price: 900,
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