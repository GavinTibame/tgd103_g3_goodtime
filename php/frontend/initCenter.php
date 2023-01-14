<?php
    include("../connect.php");

    function initCenter($mid){
        $pdo = connectDB();
        
        function selectSQL($pdo, $sql, $mid){
            // 進出SQL用語法
            $statement = $pdo->prepare($sql);
            $statement->bindValue(":mid", $mid);
            $statement->execute();
            return $statement->fetchAll();
        }

        $sql = "SELECT LOCATION FROM ADDRESS 
        WHERE FK_ADDRESS_MEMBER_ID = :mid";

        $data["address"] = selectSQL($pdo, $sql, $mid);

        $sql = "SELECT PO.ID, PO.FREIGHT, PO.STATUS, PO.CREATE_DATE, POD.ID, POD.UNIT_PRICE, POD.QTY, 
        PRODUCT.PRODUCT_NAME, PRODUCT.MAIN_PHOTO, 
        SPEC.SPEC
        FROM PO, PO_DETAIL POD, 
        PRODUCT, PRODUCT_SPEC SPEC 
        WHERE PO.FK_PO_MEMBER_ID = :mid
        AND PO.ID = POD.FK_PO_DETAIL_PO_ID
        AND POD.FK_PO_DETAIL_PRODUCT_ID = PRODUCT.ID
        AND POD.FK_PO_PRODUCT_SPEC_ID = SPEC.ID";

        $data["po"] = selectSQL($pdo, $sql, $mid);

        echo json_encode($data);
    }
?>

<!-- PO {
ID: 1,
FREIGHT: 60,
STATUS: 0,
CREATE_DATE: "2022-12-26 11:43:21",
}
PO.ID, PO.FREIGHT, PO.STATUS, PO.CREATE_DATE  

POD {
ID: 1,
UNIT_PRICE: 960,
QTY: 3,
}
POD.ID, POD.UNIT_PRICE, POD.QTY

PRODUCT{
PRODUCT_NAME, 
MAIN_PHOTO
}
PRODUCT.PRODUCT_NAME, PRODUCT.MAIN_PHOTO

SPEC{
SPEC: "30x30cm",
}
SPEC.SPEC
-->