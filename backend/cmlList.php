<?php

include("connect.php");
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");

if(isset($_GET['id'])){
    $id = $_GET['id'];
    
    $sql = "SELECT * FROM CML WHERE id_info=$id";
    $result = mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    $data = array();

    while($row = mysqli_fetch_array($result)){
    $data[] = $row;
    }
    echo json_encode($data);
    mysqli_close($con);
}
else {
    echo 'data not received';
}