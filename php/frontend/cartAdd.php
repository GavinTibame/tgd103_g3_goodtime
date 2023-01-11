<?php
include("../connect.php");
include("../verify.php");

$pid = $_POST["pid"]; 
$buyQty = $_POST["buyQty"];
$spec = $_POST["spec"];
$mid = "5"; // 會員編號先寫死去測

function getCart($pdo, $mid, $pid, $spec){

    $sql = "SELECT * 
    FROM cart, product_spec spec 
    WHERE fk_cart_member_id = :mid 
    AND fk_cart_product_id = :pid
    AND spec = :spec
    AND cart.fk_cart_product_id = spec.fk_product_spec_product_id";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":spec", $spec);
    $statement->execute();
    $data = $statement->fetchAll();

    return $data;
}

function updateCart($pdo, $newQty, $cartPid, $mid, $spec){
    $sql = "UPDATE cart SET qty = :newQty, cart_date = now() WHERE fk_cart_product_id = :cartPid AND fk_cart_member_id = :mid AND fk_cart_product_spec_id = :spec";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":newQty", $newQty);
    $statement->bindValue(":cartPid", $cartPid);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":spec", $spec);
    $statement->execute();
}

function insertCart($pdo, $qty, $mid, $pid, $spec){
    $sql = "INSERT INTO cart(qty, cart_date, fk_cart_member_id, fk_cart_product_id, fk_cart_product_spec_id)
    values(:qty, now(), :mid, :pid, :spec)";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":qty", $qty);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":spec", $spec);
    $statement->execute();
}

// for dev
// if (!isset(getMemberID())){
//     exit(false);
// }

$data = getCart(connectDB(), $mid, $pid, $spec);
// $data = getCart(connectDB(), getMemberID(), $pid, $spec);

if (count($data) > 0){
// print_r($data);
    foreach($data as $index => $row){
        $cartPid = $row["ID"];
        $previousQty = $row["QTY"];
    }

    $newQty = $buyQty + $previousQty;
    
    updateCart(connectDB(), $newQty, $cartPid, $mid, $spec);
    // updateCart(connectDB(), $newQty, $cartPid, getMemberID());

}else{
    insertCart(connectDB(), $buyQty, $mid, $pid, $spec);
    // insertCart(connectDB(), $buyQty, getMemberID(), $pid);
}


?>