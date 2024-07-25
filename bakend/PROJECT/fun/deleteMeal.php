<?php
include("../connect.php");
$id = htmlspecialchars($_POST["idMeal"]);
$sql = "DELETE FROM meal WHERE idMeal = $id";
$result = $con->query($sql);
echo json_encode($result);
?>