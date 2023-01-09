<?php

function getMemberID(){
    if(!isset($_SESSION)){
        session_start();
    }

    return isset($_SESSION["memberID"]) ? $_SESSION["memberID"] : "";
}

?>