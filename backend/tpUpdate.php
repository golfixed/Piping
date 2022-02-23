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

    $id_cml = $requestBody['id_cml'];
    $tp_number=$requestBody['tp_number'];
    $tp_description=$requestBody['tp_description'];
    $note=$requestBody['note'];



    $sql = "UPDATE TESTPOINT SET tp_number=$tp_number,tp_description=$tp_description,note='$note' WHERE id=$id;";
    mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    echo 'update TP succcessful';
}
else {
    echo 'info_id not received';
}