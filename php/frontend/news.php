<?php

    include("../connect.php");
    include("../verify.php");
    
    //輪播
    $pdo = connectDB();
   
    
    //news 渲染
    $pdo = connectDB();
    $sql = "SELECT TITLE, DATE(EDIT_DATE) as EDIT_DATE, `DESC`, ID
            FROM f_index_2
            -- 依照EDIT_DATE升冪排列
            where `STATUS` = 1
            order by EDIT_DATE desc 
            ";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data["news"] = $statement->fetchAll();

    
    
    echo json_encode($data);
?>