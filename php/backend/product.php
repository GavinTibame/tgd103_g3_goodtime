<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM b_product where `STATUS` = 1 order by ID";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>