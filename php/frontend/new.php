<?php

    include("../connect.php");
    include("../verify.php");

    //news
    $pdo = connectDB();
    $sql = "SELECT TITLE, DATE(EDIT_DATE) as EDIT_DATE, `DESC`
            FROM GOODTIME.f_index_2
            -- 依照EDIT_DATE升冪排列
            order by EDIT_DATE desc ";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data["news"] = $statement->fetchAll();

    echo json_encode($data);
?>