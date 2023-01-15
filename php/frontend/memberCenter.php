<?php
    include("../verify.php");
    include("initCenter.php");
    include("newAddress.php");

    $mid = isMemberLogin();
    $mid = "5";
    
    
    
    if ($mid == ""){
        echo "未登入會員";
    }else{
        // $action = $_POST["action"];
        $action = "";
        switch($action){
            case "newAddress":
                $newAddress = $_POST["address"]; 
                // $newAddress = "台北市松山區敦化北路100號2樓"; 
                newAddress($mid, $newAddress);
                echo initCenter($mid);
                break;
            case "editAddress":

                echo initCenter($mid);
                break;
            case "delAddress":

                echo initCenter($mid);
                break;
            case "password":
                
                echo initCenter($mid);
                break;
            default:
                echo initCenter($mid);
        }
    }

?>