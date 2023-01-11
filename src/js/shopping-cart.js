const createApp = Vue.createApp({
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