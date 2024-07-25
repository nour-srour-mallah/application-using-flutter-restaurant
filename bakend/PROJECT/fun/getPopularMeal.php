<?php
include("../connect.php");
$sql = "SELECT meal.strMeal,meal.strMealThumb,meal.description FROM populardishes,meal WHERE meal.idMeal=populardishes.idMeal";
$result = $con->query($sql);
$data[0] = "";
$i=0;
while($row = $result->fetch_assoc()) {
    $data[$i]=$row;
    $i++;
}
echo '{"meals":'. json_encode($data).'}';
?>