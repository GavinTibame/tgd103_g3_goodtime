<?php

    include("../connect.php");

    //news
    $pdo = connectDB();
    $sql = "SELECT TITLE, DATE(EDIT_DATE) as EDIT_DATE, `DESC`, ID
            FROM f_index_2
            where `STATUS` = 1
            order by EDIT_DATE desc ";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data = $statement->fetchAll();

    echo json_encode($data);
?>