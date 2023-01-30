const checkoutApp = Vue.createApp({
    data() {
        return {
            itm: [],
            tkt: [],
            checkoutList: []
        }
    }, methods: {
        ticketType(expoObj) {
            if (expoObj.EXPO_PRICE === expoObj.ADULT_PRICE) {
                return "一般票";
            } else if (expoObj.EXPO_PRICE === expoObj.CONC_PRICE) {
                return "優待票";
            } else { return "團體票"; }
        }, checkout() {
            const itmList = {}, tktList = {};
            this.itm.forEach(itm => {
                const pid = itm.FK_CART_PRODUCT_ID,
                    sid = itm.FK_CART_PRODUCT_SPEC_ID;
                itmList[pid] = { sid };
            });
            this.tkt.forEach(tkt => {
                const eid = tkt.EXPO_ID,
                    price = tkt.EXPO_PRICE;
                tktList[eid] = { price };
            });
            const cart = JSON.stringify(itmList),
                passport = JSON.stringify(tktList);
            console.log(cart);
            axios.post("../../php/frontend/checkoutCart.php", cart)
                .then(res => {

                }).catch(err => console.log("[checkout cart]", err));
            // axios.post("../../php/frontend/checkoutTkt.php", passport)
            //     .then(res => {

            //     }).catch(err => console.log("[checkout ticket]", err));
        }
    }, created() {
        let itmList = localStorage.getItem("checkoutItm"),
            tktList = localStorage.getItem("checkoutTkt");
        if (itmList) {
            itmList = JSON.parse(itmList);
            this.itm = [...itmList];
            if (tktList) {
                tktList = JSON.parse(tktList);
                this.tkt = [...tktList];
            }
        } else if (tktList) {
            tktList = JSON.parse(tktList);
            this.tkt = [...tktList];
        }
    }
}).mount("#checkout");