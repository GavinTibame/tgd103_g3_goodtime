<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$productname = $_POST["productname"];
$productprice = $_POST["productprice"];
$stock = $_POST["stock"];
$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE PRODUCT SET 
PRODUCT_NAME = ?,
PRICE = ?,
-- TITLE = ?,
-- PRODUCT_TYPE_NAME = ?,
STOCK_QTY = ?,
`START` = ?,
`END` = ?,
`STATUS` = ?,
`HIDE` = ?,
FK_PRODUCT_TYPE_ID = ?,
FEATURED = ?
-- PRODUCT_DETAIL_DESC = ?
where ID = ?";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $productname);
$statement->bindValue(2 , $productprice);
// $statement->bindValue(3 , $title);
// $statement->bindValue(3 , $producttype);
$statement->bindValue(3 , $stock);
$statement->bindValue(4 , $start);
$statement->bindValue(5 , $end);
$statement->bindValue(6 , $status);
$statement->bindValue(7 , $hided);
$statement->bindValue(8 , $kind);
$statement->bindValue(9 , $featured);
// $statement->bindValue(4 , $desc);
$statement->bindValue(10 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>