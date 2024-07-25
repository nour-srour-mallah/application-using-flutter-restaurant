<?php
include("../connect.php");
$strMeal = htmlspecialchars($_POST["strMeal"]);
$strMealThumb = htmlspecialchars($_POST["strMealThumb"]);
$idMeal = htmlspecialchars($_POST["idMeal"]);
$description = htmlspecialchars($_POST["description"]);
$price = htmlspecialchars($_POST["price"]);
$sql = "INSERT INTO `meal`(`strMeal`, `strMealThumb`, `idMeal`, `description`, `price`) VALUES ('$strMeal','$strMealThumb','$idMeal','$description','$price')";
$result = $con->query($sql);
echo json_encode($result);
?>