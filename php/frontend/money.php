<?php
$array = $_POST;

$first_key = key($array);
// print_r($first_key);
if(!isset($_SESSION)){
    session_start();
}
$_SESSION["amt"] = $first_key;
?>