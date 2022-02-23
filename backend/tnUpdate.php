<?php

include("connect.php");
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");

$requestBody = file_get_contents('php://input');
$requestBody = json_decode($requestBody, true);
if ($requestBody === null) {
    header('HTTP/1.1 400 Bad Request');
    echo json_encode([
        'errorMessage' => 'Please provide valid JSON',
    ]);
    die;
}
$requestBody['newKey'] = true;

if($requestBody['id'] ){
    $id=$requestBody['id'];

    $actual_thickness=$requestBody['actual_thickness'];
    $inspection_date=$requestBody['inspection_date'];

    $sql = "UPDATE THICKNESS SET inspection_date='$inspection_date',actual_thickness=$actual_thickness WHERE id=$id;";
    mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    echo 'update TN succcessful';
}
else {
    echo 'info_id not received';
}