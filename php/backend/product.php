<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM b_product";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>