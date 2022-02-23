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
    $id_info = $requestBody['id_info'];

    $cml_number = $requestBody['cml_number'];
    $cml_description = $requestBody['cml_description'];
    $actual_outside_diameter = $requestBody['actual_outside_diameter'];
    $design_thickness = $requestBody['design_thickness'];
    $structural_thickness = $requestBody['structural_thickness'];
    $required_thickness = $requestBody['required_thickness'];

    $sql = "UPDATE CML SET cml_number=$cml_number, cml_description='$cml_description', actual_outside_diameter=$actual_outside_diameter,design_thickness=$design_thickness, structural_thickness=$structural_thickness, required_thickness=$required_thickness  WHERE id=$id;";
    mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    echo 'update CML succcessful';
}
else {
    echo 'info_id not received';
}