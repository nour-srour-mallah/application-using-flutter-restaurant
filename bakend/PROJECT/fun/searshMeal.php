<?php
include("../connect.php");
$s = htmlspecialchars($_GET["s"]);
$sql = "SELECT * FROM meal WHERE strMeal LIKE '$s%'";
$result = $con->query($sql);
$data[0] = "";
$i=0;
while($row = $result->fetch_assoc()) {
    $data[$i]=$row;
    $i++;
}
echo '{"meals":'. json_encode($data).'}';
$result->close(); 
?>