<?php
include("../connect.php");
include("../verify.php");

$mid = "5"; // 會員編號先寫死去測

$sql = "SELECT * FROM CART, PRODUCT WHERE CART.FK_CART_PRODUCT_ID = PRODUCT.ID AND FK_CART_MEMBER_ID = :mid";

$statement = connectDB()->prepare($sql); 
$statement->bindValue(":mid", $mid);
// $statement->bindValue(":mid", getMemberID());
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>