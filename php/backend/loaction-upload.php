<?php

    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../../dist/img/rental/".$_FILES['file']['name'])) {

        echo "done";

        exit;

    }

    echo "failed";

?>