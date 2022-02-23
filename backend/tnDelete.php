<?php

include("connect.php");
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");

if(isset($_GET['id'])){
    $id = $_GET['id'];
    
    $sql = "DELETE FROM THICKNESS WHERE id=$id";
    mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    
    echo 'TN delete successful';
}
else {
    echo 'data not received';
}

