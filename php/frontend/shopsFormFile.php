<?php

if (move_uploaded_file($_FILES["file"]["tmp_name"], "../../src/file/shopsFile/".$_FILES['file']['name'])) {

    echo "上傳成功";
    
    exit;
    
    }
    
    echo "上傳失敗";

?>