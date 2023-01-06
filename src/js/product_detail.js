const createApp = Vue.createApp({
    data() {
        return {
            productDetail: {
                id: 1,
                main_photo: "../img/product_detail/item01.png",
                product_photo: ["../img/product_detail/item01_01.png",
                    "../img/product_detail/item01_02.png",
                    "../img/product_detail/item01_03.png"],
                name: "自訂款迷你保溫瓶",
                featured: `📌採用SUS304不鏽鋼材質，讓你安心飲用<br />
                📌小巧便攜，重量僅200克<br />
                📌長效保溫保冷`,
                remark: ["顏色", "黑色", "藍色", "粉色"],
                price: 590,
                qty: 1,
                max_qty: 10,
                desc: `輕巧便攜：<br />
                迷你保溫瓶容量為350ml，重量僅190g，無論去到哪，都可以輕鬆攜帶。<br />
                <br>
                長效保溫鎖冷：<br />
                無論冬天還是夏天，冷水還是熱水，都可以保持長效保溫和保冷。<br />
                <br>
                SUS 304不鏽鋼安全材質：<br />
                採用SUS
                304食品級不鏽鋼材質，抗氧化、耐腐蝕、易清潔，讓您輕鬆健康飲水。<br />
                <br>
                真空技術：<br />
                採用不鏽鋼真空技術，有效阻隔溫度傳導，打造保溫鎖冷效果。<br />
                <br>
                保溫測試：<br />
                在20°C±5°C的室內溫度下，將100°C的水倒入至密封蓋下端。<br />
                當水溫降至95°C±1°C時，立即拴緊杯蓋。6小時後杯內水溫不低於58℃。<br />
                <br>
                保冷測試：<br />
                在20°C±5℃的室內溫度下，將冰水倒入至密封蓋的下端。<br />
                當水溫升至4℃±1℃時，拴緊蓋子。6小時後杯內水溫不高於12°C。`,
                spec: `產品名稱：自訂款迷你保溫杯<br />
                保溫效率：高於58°C（6小時）<br />
                冷藏效率：低於12°C（6小時）<br />
                產品材質：SUS304不鏽鋼<br />
                產品容量：350ml<br />
                產品重量：190g<br />
                產品尺寸：60 x 60 x 180mm`},
            orderQty: 1
        }
    }, methods: {

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
