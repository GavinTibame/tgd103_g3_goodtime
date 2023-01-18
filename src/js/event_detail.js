const eventDetailApp = Vue.createApp({
    data() {
        return {
            eventDetail: {},
            orderQty: 1,
            price: 0,
            selected_price: "300",
        }
    }, 
    methods: {
        selectValue(e){ // 印出票價
            this.price = e.target.value;
            console.log(this.price);
        },
       
        passToCart() { // 加入購物車
            if (this.price != 0) { 
                axios.post("../../php/frontend/cartAdd.php",
                    `pid=${this.eventDetail.ID}&buyQty=${this.orderQty}&spec=${this.price}`)
                    .then(res => {
                        if (res.status === 200) {
                            // console.log(res);
                            window.open("../html/shopping_cart01.html");
                        }
                    })
                    .catch(err => console.log("[cart add]", err));
            }
        }
    }, 
    created() {
        axios.get("../../php/frontend/expo.php")
            .then(res => { // 拿商品頁的資料
                this.eventDetail = res.data[0];

            }).catch(err => console.log("[product info]", err));
    }
}).mount("#eventDetail");









// $(function() {
//     // This button will increment the value
//     $('.qtyplus').click(function(e) {
//         // Stop acting like a button
//         e.preventDefault();
//         // Get the field name
//         fieldName = $(this).attr('field');
//         // Get its current value
//         var currentVal = parseInt($('input[name=' + fieldName + ']').val());
//         // If is not undefined
//         if (!isNaN(currentVal)) {
//         // Increment
//         $('input[name=' + fieldName + ']').val(currentVal + 1);
//         } else {
//         // Otherwise put a 0 there
//         $('input[name=' + fieldName + ']').val(0);
//         }
//     });
//     // This button will decrement the value till 0
//     $(".qtyminus").click(function(e) {
//         // Stop acting like a button
//         e.preventDefault();
//         // Get the field name
//         fieldName = $(this).attr('field');
//         // Get its current value
//         var currentVal = parseInt($('input[name=' + fieldName + ']').val());
//         // If it isn't undefined or its greater than 0
//         if (!isNaN(currentVal) && currentVal > 0) {
//         // Decrement one
//         $('input[name=' + fieldName + ']').val(currentVal - 1);
//         } else {
//         // Otherwise put a 0 there
//         $('input[name=' + fieldName + ']').val(0);
//         }
//     });
// });

