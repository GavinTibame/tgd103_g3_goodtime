<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM MEMBER where VERIFY = 1 order by ID";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>