<?php
include("../connect.php");

$pid = isset($_GET["pid"]) ? $_GET["pid"] : "";

function getProductInfo($pid, $pdo){
$sql = "SELECT * 
    FROM PRODUCT
    WHERE PRODUCT.ID = $pid 
    AND product.status = 0 
    AND product.hide = 0";


$statement = $pdo->prepare($sql); 
$statement->execute();
$data = $statement->fetchAll();
echo json_encode($data);
}

getProductInfo($pid, connectDB()); 
?>