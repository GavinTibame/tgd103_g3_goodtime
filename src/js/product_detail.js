const createApp = Vue.createApp({
    data() {
        return {
            productDetail: {},
            productPIC: [],
            spec: "",
            orderQty: 1
        }
    }, methods: {
        passToCart() { // 加入購物車
            axios.post("../../php/frontend/cartAdd.php", `pid=${this.productDetail.ID}&buyQty=${this.orderQty}`).then(res => {
                if (res.status === 200) {
                    window.open("../html/shopping_cart01.html", "shoppingCart01");
                }
            }).catch(err => { console.log("[php error]", err) });
        }
    }, created() {
        axios.get("../../php/frontend/product.php?pid=" + 2).then(res => { // 拿商品頁的資料
            this.productDetail = res.data[0];
            this.productDetail.FEATURED = this.productDetail.FEATURED.split(",");
            this.productDetail.NOTE = this.productDetail.NOTE.split(",");
            this.spec = this.productDetail.NOTE[0];
        }).catch(err => {
            console.log("[product info]", err);
        });
        axios.get("../../php/frontend/productPIC.php?pid=" + 2).then(res => { // 拿商品圖的資料
            this.productPIC = Object.values(res.data[0]);
            this.productPIC = this.productPIC[0].split(",");
        }).catch(err => {
            console.log("[product photo]", err);
        });
    }
}).mount("#productDetail");

function change_img(li_img) {
    let pic = li_img.src; //取得當下被點擊的圖片的src
    // console.log(pic); //測試
    const slider_img = document.querySelector("#slider"); //取得slider中img物件
    slider_img.style.backgroundImage = `url('${pic}')`; //將slider中img物件的src改為點擊圖片的src
}
function choose() {
    // console.log("aaa");
    $(".button-unfocus").addClass(".button-focus");
}

// 重寫
// $(function () {
//   // This button will increment the value
//   $(".qtyplus").click(function (e) {
//     // Stop acting like a button
//     e.preventDefault();
//     // Get the field name
//     fieldName = $(this).attr("field");
//     // Get its current value
//     var currentVal = parseInt($("input[name=" + fieldName + "]").val());
//     // If is not undefined
//     if (!isNaN(currentVal)) {
//       // Increment
//       $("input[name=" + fieldName + "]").val(currentVal + 1);
//     } else {
//       // Otherwise put a 0 there
//       $("input[name=" + fieldName + "]").val(0);
//     }
//   });
//   // This button will decrement the value till 0
//   $(".qtyminus").click(function (e) {
//     // Stop acting like a button
//     e.preventDefault();
//     // Get the field name
//     fieldName = $(this).attr("field");
//     // Get its current value
//     var currentVal = parseInt($("input[name=" + fieldName + "]").val());
//     // If it isn't undefined or its greater than 0
//     if (!isNaN(currentVal) && currentVal > 0) {
//       // Decrement one
//       $("input[name=" + fieldName + "]").val(currentVal - 1);
//     } else {
//       // Otherwise put a 0 there
//       $("input[name=" + fieldName + "]").val(0);
//     }
//   });
// });

//點擊商品介紹滑動到對應位置

$(function () {
    // 偵聽a click
    $(".switch-btnbox div").bind("click", function () {

        const sid = this.dataset.sid;
        // console.log(sid);
        // 取得目標區塊的y座標
        const header = document.querySelector("div.top-area");
        const top = document.getElementById("item-" + sid).offsetTop - header.offsetHeight;

        window.scrollTo({ top: top, behavior: "smooth" });
        // // 取得body物件 這種寫法在各瀏覽器上最保險
        // var $body = window.opera
        //     ? document.compatMode == "CSS1Compat"
        //         ? $("html")
        //         : $("body")
        //     : $("html,body");
        // // 移動捲軸有動畫效果
        // $body.animate(
        //     {
        //         scrollTop: target_top
        //     },
        //     800
        // );
    });
});
