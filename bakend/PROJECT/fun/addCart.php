<?php
include("../connect.php");
$userid = htmlspecialchars($_POST["userid"]);
$dishid = htmlspecialchars($_POST["dishid"]);
$num = htmlspecialchars($_POST["num"]);
$stmt = $con->prepare("INSERT INTO `cart`(`user`, `meal`, `number`) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $userid, $dishid,$num);  // Bind values to placeholders
$result = $stmt->execute();  // Execute the prepared statement
echo json_encode($result);
$stmt->close();  // Close the prepared statement to free resources
?>