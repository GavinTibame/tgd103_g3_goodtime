<?php
    include("../verify.php");
    include("initCenter.php");

    $mid = isMemberLogin();
    $mid = "5";
    if ($mid == ""){
        echo "未登入會員";
    }else{
        // $action = $_POST["action"];
        $action = null;
        switch($action){
            case "address":

                echo initCenter($mid);
                break;
            case "password":

                echo initCenter($mid);
                break;
            case "orderDetail":
                
                echo initCenter($mid);
                break;
            default:
                echo initCenter($mid);
        }
    }

?>