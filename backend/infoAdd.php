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
 
header('Content-Type: application/json');
if($requestBody['line_number']){
    $line_number = $requestBody['line_number'];
    $location = $requestBody['location'];
    $from = $requestBody['_from'];
    $to = $requestBody['_to'];
    $drawing_number = $requestBody['drawing_number'];
    $service = $requestBody['service'];
    $material = $requestBody['material'];
    $inservice_date = $requestBody['inservice_date'];
    $pipe_size = $requestBody['pipe_size'];
    $original_thickness = $requestBody['original_thickness'];
    $stress = $requestBody['stress'];
    $joint_efficiency = $requestBody['joint_efficiency'];
    $ca = $requestBody['ca'];
    $design_life = $requestBody['design_life'];
    $design_pressure = $requestBody['design_pressure'];
    $operating_pressure = $requestBody['operating_pressure'];
    $design_temperature = $requestBody['design_temperature'];
    $operating_temperature = $requestBody['operating_temperature'];
    
    $sql = "INSERT INTO INFO(line_number, location, _from, _to, drawing_number, service, material, inservice_date, pipe_size, original_thickness,stress, joint_efficiency,
    ca, design_life, design_pressure, operating_pressure,design_temperature,operating_temperature)
    VALUES ('$line_number','$location','$from','$to','$drawing_number','$service','$material','$inservice_date', $pipe_size,$original_thickness,$stress,$joint_efficiency,$ca,$design_life,$design_pressure,$operating_pressure,$design_temperature,$operating_temperature);";
    mysqli_query($con, $sql) or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($con), E_USER_ERROR);
    echo 'add succcessful';
}
else {
    echo 'line number not received';
}