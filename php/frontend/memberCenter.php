<?php
    include("../verify.php");
    include("initCenter.php");
    include("newAddress.php");
    include("editAddress.php");
    include("delAddress.php");
    include("newPassword.php");

    $mid = isMemberLogin();
    // $mid = "5";
    
    $_POST = json_decode(file_get_contents("php://input"), true);
    
    if ($mid == ""){
        echo "未登入會員";
    }else{
        if(isset($_POST["action"])){
            $action = $_POST["action"];
            // print_r($action);
        }else{
            $action = "";
        }
        switch($action){
            case "newAddress":
                $newAddress = $_POST["address"]; 
                // $newAddress = "台北市松山區敦化北路100號2樓"; 
                newAddress($mid, $newAddress);
                echo initCenter($mid);
                break;
            case "editAddress":
                $selectID = $_POST["id"];
                // $selectID = "2";
                $newAddress = $_POST["address"];
                // $newAddress = "台北市松山區敦化北路100號2樓"; 
                editAddress($newAddress, $mid, $selectID);
                echo initCenter($mid);
                break;
            case "delAddress":
                $selectID = $_POST["id"];
                // $selectID = "2"; 
                delAddress($mid, $selectID);
                echo initCenter($mid);
                break;
            case "newPassword":
                $pwd = $_POST["pwd"];
                // $pwd = "member1";
                $newPwd = $_POST["newPwd"];
                // $newPwd = "pwd1";
                newPassword($mid, $pwd, $newPwd);
                echo initCenter($mid);
                break;
            default:
                echo initCenter($mid);
        }
    }

?>