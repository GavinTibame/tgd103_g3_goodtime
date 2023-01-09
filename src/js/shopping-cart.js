const createApp = Vue.createApp({
    data() {
        return {
            selectAll: false,
            freight: 60,
            cartList: [],
            productList: [{
                ID: 1,
                MAIN_PHOTO: "../img/store/store02.jpg",
                PRODUCT_NAME: "自訂款迷你保溫瓶",
                spec: `黑色`,
                PRICE: 590,
                QTY: 1,
                MAX_QTY: 10
            }, {
                ID: 2,
                MAIN_PHOTO: "../img/store/store04.jpg",
                PRODUCT_NAME: "蒙娜麗莎貓貓掛畫",
                spec: `30" x 30"`,
                PRICE: 960,
                QTY: 1,
                MAX_QTY: 5
            }, {
                ID: 3,
                MAIN_PHOTO: "../img/store/store05.jpg",
                PRODUCT_NAME: "貓貓洗頭掛畫",
                spec: `40" x 55"`,
                PRICE: 900,
                QTY: 1,
                MAX_QTY: 10
            }], wantList: []
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
            this.wantList.splice(idx, 1);
            this.cartList = this.cartList.filter(product => product.id !== id);
            this.isSelectAll();
        }
    }, created() {
        axios.get("../../php/frontend/cart.php").then(res => {
            this.wantList = res.data;
            console.log(this.wantList);
        })
    }
}).mount("#shoppingCart1");