<?php
include("../connect.php");

$mainphoto = $_POST["mainphoto"];
$productname = $_POST["productname"];
$startdate = $_POST["startdate"];
$enddate = $_POST["enddate"];
$productpage = $_POST["productpage"];
$productprice = $_POST["productprice"];
$hide = $_POST["hide"];
$event = $_POST["event"];
$eventnum = $_POST["eventnum"];
$productstyle = $_POST["productstyle"];
$producttag = $_POST["producttag"];
$transport = $_POST["transport"];
$productnum = $_POST["productnum"];
$productdetail = $_POST["productdetail"];
// $res = ($productname,$productpage,$hide,$productprice,$productdetail,$mainphoto,$productnum,now(),now(),$producttag,$eventnum);
$pdo = connectDB();
$sql = "INSERT INTO PRODUCT(`PRODUCT_NAME`, `STATUS`, HIDE, PRICE, `DESC`, MAIN_PHOTO, STOCK_QTY, CREATE_DATE, EDIT_DATE, FK_PRODUCT_PAGE_ID,FK_PRODUCT_EXPO_ID) VALUES (?,?,?,?,?,?,?,NOW(),NOW(),?,?)";
// $sql = "INSERT INTO PRODUCT(`PRODUCT_NAME`, `STATUS`, HIDE, PRICE, `DESC`, MAIN_PHOTO, STOCK_QTY, CREATE_DATE, EDIT_DATE, FK_PRODUCT_PAGE_ID,FK_PRODUCT_EXPO_ID) VALUES ?";
$statement = $pdo->prepare($sql);
// $statement->bindValue(1 , $res); 
$statement->bindValue(1 , $productname); 
$statement->bindValue(2 , $productpage);
$statement->bindValue(3 , $hide); 
$statement->bindValue(4 , $productprice);
$statement->bindValue(5 , $productdetail); 
$statement->bindValue(6 , $mainphoto);
$statement->bindValue(7 , $productnum);
$statement->bindValue(8 , $producttag);
$statement->bindValue(9 , $eventnum);
$statement->execute();
// $data = $statement->fetchAll();


//導頁    
echo "新增分類成功!";
// echo $mainphoto;
// echo $res
?>