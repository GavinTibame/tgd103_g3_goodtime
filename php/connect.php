<?php

define("DB_HOST", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "password"); 
define("DB_NAME", "GOODTIME");
define("DB_LINK", "mysql:host=".DB_HOST.";dbname=".DB_NAME.";charset=utf8");

function connectDB(){

    $pdo = new PDO(DB_LINK, DB_USERNAME, DB_PASSWORD);

    return $pdo;

}
// $pdo = connectDB();
// $sql = "select * from MEMBER";
// $statement = $pdo->prepare($sql);
// $statement->execute();
// $data = $statement->fetchAll();

// echo json_encode($data);
?>