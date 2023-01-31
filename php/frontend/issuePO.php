<?php

    include("../connect.php");

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
?>