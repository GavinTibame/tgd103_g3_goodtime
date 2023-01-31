<?php

include("../connect.php");
include("../verify.php");

$mid = isMemberLogin();

$array = $_POST;

$first_key = key($array);

$key = json_decode($first_key, true);
// print_r($key);

function checkout($dbn, $mid, $eid, $price){

    $sql = "DELETE FROM TICKET 
            WHERE MEMBER_ID = :mid 
            AND EXPO_ID = :eid 
            AND EXPO_PRICE = :price";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute();
}

function calcAmt($dbn, $mid, $eid, $price){
    $amt = 0;

    $sql = "SELECT EXPO_PRICE, QTY 
            FROM TICKET
            WHERE MEMBER_ID = :mid 
            AND EXPO_ID = :eid 
            AND EXPO_PRICE = :price";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute();
    $charge = $statement->fetchAll();
    // print_r($charge);
    $amt = $charge[0]["EXPO_PRICE"] * $charge[0]["QTY"];
    return $amt;
}

$dbn = connectDB(); 
$dbn->beginTransaction();
$amt = 0;
foreach($key as $eid => $priceArray){
    // print_r($eid);
    foreach($priceArray as $price){
        // print_r($price);
        // $amt += calcAmt($dbn, $mid, $eid, $price);
        $amt += calcAmt($dbn, 5, $eid, $price);
        // checkout($dbn, $mid, $eid, $price);
        // checkout($dbn, 5, $eid, $price);
    }
    
};

$dbn->commit();

print_r($amt);



?>
