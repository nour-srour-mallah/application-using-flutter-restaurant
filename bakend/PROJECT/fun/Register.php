<?php
include("../connect.php");
$email = htmlspecialchars($_POST["email"]);
$pass = htmlspecialchars($_POST["pass"]);
$firstname='firstname';
$lastname='lastname';

// Prepared statement for security and clarity
$stmt = $con->prepare("INSERT INTO `users`(`id`, `firstname`, `lastname`, `email`) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $pass, $firstname, $lastname, $email);  // Bind values to placeholders
$result = $stmt->execute();  // Execute the prepared statement

echo json_encode($result);

$stmt->close();  // Close the prepared statement to free resources
?>