<?php
include("../connect.php");

$pid = isset($_GET["pid"]) ? $_GET["pid"] : "";

function getProductInfo($pid, $pdo){
    $sql = "SELECT PRODUCT.*, 
                group_concat(PIC.PATH) as path, 
                group_concat(SPEC.SPEC) as SELECTED, 
                group_concat(SPEC.ID) as SID
            FROM PRODUCT, PRODUCT_PIC PIC, PRODUCT_SPEC SPEC
            WHERE PRODUCT.ID = :pid
                AND PIC.FK_PRODUCT_PIC_PRODUCT_ID = PRODUCT.ID
                AND PRODUCT.ID = SPEC.FK_PRODUCT_SPEC_PRODUCT_ID
                AND product.status = 0 
                AND product.hide = 0;";


    $statement = $pdo->prepare($sql); 
    $statement->bindValue(":pid", $pid);
    $statement->execute();
    $data = $statement->fetchAll();
    echo json_encode($data);
}

getProductInfo($pid, connectDB()); 
?>