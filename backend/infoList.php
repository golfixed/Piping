<?php

include("connect.php");
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");

$result = mysqli_query($con, "SELECT * FROM INFO");
$data = array();

while($row = mysqli_fetch_array($result)){
    $data[] = $row;
}

echo json_encode($data);
mysqli_close($con);

?>