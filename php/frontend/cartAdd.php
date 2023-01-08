<?php
include("../connect.php");
include("../verify.php");

$pid = $_POST["pid"]; 
$buyQty = $_POST["buyQty"];
$mid = "5"; // 會員編號先寫死去測

function getCart($pdo, $mid, $pid){

    $sql = "SELECT * FROM cart WHERE fk_cart_member_id = :mid AND fk_cart_product_id = :pid";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->execute();
    $data = $statement->fetchAll();

    return $data;
}

function updateCart($pdo, $newQty, $cartPid, $mid){
    $sql = "UPDATE cart SET qty = :newQty, cart_date = now() WHERE fk_cart_product_id = :cartPid AND fk_cart_member_id = :mid";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":newQty", $newQty);
    $statement->bindValue(":cartPid", $cartPid);
    $statement->bindValue(":mid", $mid);
    $statement->execute();
}

function insertCart($pdo, $qty, $mid, $pid){
    $sql = "INSERT INTO cart(qty, cart_date, fk_cart_member_id, fk_cart_product_id)
    values(:qty, now(), :mid, :pid)";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":qty", $qty);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->execute();
}

// for dev
// if (!isset(getMemberID())){
//     exit(false);
// }

$data = getCart(connectDB(), $mid, $pid);
// $data = getCart(connectDB(), getMemberID(), $pid);

if (count($data) > 0){
// print_r($data);
    foreach($data as $index => $row){
        $cartPid = $row["ID"];
        $previousQty = $row["QTY"];
    }

    $newQty = $buyQty + $previousQty;
    
    updateCart(connectDB(), $newQty, $cartPid, $mid);
    // updateCart(connectDB(), $newQty, $cartPid, getMemberID());

}else{
    insertCart(connectDB(), $buyQty, $mid, $pid);
    // insertCart(connectDB(), $buyQty, getMemberID(), $pid);
}


?>