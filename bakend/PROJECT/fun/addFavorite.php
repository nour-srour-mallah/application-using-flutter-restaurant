<?php
include("../connect.php");
$email = htmlspecialchars($_POST["email"]);
$dishid = htmlspecialchars($_POST["dishid"]);
$stmt = $con->prepare("SELECT id FROM `users` WHERE `email`=?");
$stmt->bind_param("s", $email);  // Bind parameters to placeholders
$stmt->execute();  
$result = $stmt->get_result();
$row = $result->fetch_array();
$userid = $row['id'];
$stmt2 = $con->prepare("INSERT INTO `favoritedishes`(`userid`, `mealid`) VALUES (?, ?)");
$stmt2->bind_param("ss", $userid, $dishid);  // Bind values to placeholders
$result2 = $stmt2->execute();  // Execute the prepared statement
echo json_encode($result2);
$stmt->close();  // Close the prepared statement to free resources
?>