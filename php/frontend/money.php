<?php
include("../verify.php");
// $array = $_POST;
$first_key = json_decode(file_get_contents("php://input"), true);
// $first_key = key($array);
if(!isset($_SESSION)){
    session_start();
}

$_SESSION["memberID"] = isMemberLogin();
$_SESSION["amt"] = $first_key["amt"];
$_SESSION["itm"] = $first_key["cart"];
$_SESSION["tkt"] = $first_key["passport"];
print_r($_SESSION);
?>