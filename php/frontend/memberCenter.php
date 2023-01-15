<?php
    include("../verify.php");
    include("initCenter.php");
    include("newAddress.php");
    include("editAddress.php");

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
                $selectAddress = $_POST["selectAddress"];
                $selectAddress = "1";
                $newAddress = $_POST["address"];
                // $newAddress = "台北市松山區敦化北路100號2樓"; 
                
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