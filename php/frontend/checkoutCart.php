<?php

include("../connect.php");
include("../verify.php");

$mid = isMemberLogin();

$array = $_POST;

$first_key = key($array);

$key = json_decode($first_key, true);
// print_r($key);

function checkout($dbn, $mid, $pid, $sid){

    $sql = "DELETE FROM CART 
            WHERE FK_CART_MEMBER_ID = :mid 
            AND FK_CART_PRODUCT_ID = :pid 
            AND FK_CART_PRODUCT_SPEC_ID = :sid";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":sid", $sid);
    $statement->execute();
}

function calcAmt($dbn, $mid, $pid, $sid){
    $amt = 0;

    $sql = "SELECT PRICE, QTY 
            FROM PRODUCT, CART 
            WHERE PRODUCT.ID = CART.FK_CART_PRODUCT_ID
            AND CART.FK_CART_MEMBER_ID = :mid 
            AND CART.FK_CART_PRODUCT_ID = :pid 
            AND CART.FK_CART_PRODUCT_SPEC_ID = :sid";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":sid", $sid);
    $statement->execute();
    $charge = $statement->fetchAll();
    // print_r($charge);
    $amt = $charge[0]["PRICE"] * $charge[0]["QTY"];
    return $amt;
}

$dbn = connectDB(); 
$dbn->beginTransaction();
$amt = 0;
foreach($key as $pid => $sidArray){
    // print_r($pid);
    foreach($sidArray as $sid){
        // print_r($sid);
        // $amt += calcAmt($dbn, $mid, $pid, $sid);
        $amt += calcAmt($dbn, 5, $pid, $sid);
        // checkout($dbn, $mid, $pid, $sid);
        // checkout($dbn, 5, $pid, $sid);
    }
    
};

$dbn->commit();

print_r($amt);

?>