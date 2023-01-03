<?php
//加入購物車 ---------------------------------------------------------------------------------
    function addToCar(pid) {        
        var qty = document.getElementById('qty_' + pid).value;

        if (qty=='0') {
            alert("請選擇數量!");
            return false;
        }

        $.ajax({            
            method: "POST",
            url: "API/AddToCart.php",
            data:{ 
                PID: pid,
                QTY: qty
            },            
            dataType: "text",
            success: function (response) {
                //加入購物車成功
                alert(response);             
            },
            error: function(exception) {
                alert("加入購物車失敗: " + exception.status);
            }
        });
    }
?>