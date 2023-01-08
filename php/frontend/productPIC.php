<?php
include("../connect.php");

$pid = isset($_GET["pid"]) ? $_GET["pid"] : "";

function getProductPIC($pid, $pdo){
$sql = "SELECT group_concat(PATH) FROM PRODUCT_PIC WHERE FK_PRODUCT_PIC_PRODUCT_ID = $pid;";


$statement = $pdo->prepare($sql); 
$statement->execute();
$data = $statement->fetchAll();
echo json_encode($data);
}

getProductPIC($pid, connectDB()); 
?>