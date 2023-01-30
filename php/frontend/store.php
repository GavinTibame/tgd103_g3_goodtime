<?php
include("../connect.php");

function getStoreList($pdo){
    $sql = "SELECT ID , MAIN_PHOTO , PRODUCT_NAME , PRICE FROM PRODUCT";


    $statement = $pdo->prepare($sql); 
    $statement->execute();
    $data = $statement->fetchAll();
    // echo json_encode($data);
    print_r(json_encode($data));
}

getStoreList(connectDB()); 
?>