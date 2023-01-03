function change_img(li_img){
    let pic = li_img.src; //取得當下被點擊的圖片的src
    console.log(pic); //測試
    const slider_img = document.querySelector("#slider"); //取得slider中img物件
    slider_img.style.backgroundImage = `url('${pic}')`; //將slider中img物件的src改為點擊圖片的src
}
function choose(){
    console.log('aaa')
    $(".button-unfocus").addClass(".button-focus");
}

// 重寫
$(function() {
    // This button will increment the value
    $('.qtyplus').click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
        // Increment
        $('input[name=' + fieldName + ']').val(currentVal + 1);
        } else {
        // Otherwise put a 0 there
        $('input[name=' + fieldName + ']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
        // Decrement one
        $('input[name=' + fieldName + ']').val(currentVal - 1);
        } else {
        // Otherwise put a 0 there
        $('input[name=' + fieldName + ']').val(0);
        }
    });
});