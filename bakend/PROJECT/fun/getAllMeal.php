<?php
include("../connect.php");
$sql = "SELECT * FROM meal ";
$result = $con->query($sql);
while($row = $result->fetch_assoc()) {
    $data[]=$row;
}
echo '{"meals":'. json_encode($data).'}';
?>