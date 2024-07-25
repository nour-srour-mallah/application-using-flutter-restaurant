<?php
include("../connect.php");
$email = htmlspecialchars($_POST["email"]);
$pass = htmlspecialchars($_POST["pass"]);

// Prepared statement to prevent SQL injection
$stmt = $con->prepare("SELECT firstname, lastname, photo FROM `users` WHERE `email`=? AND `id`=?");
$stmt->bind_param("ss", $email, $pass);  // Bind parameters to placeholders
$stmt->execute();  // Execute the prepared statement

$result = $stmt->get_result();
$data[0] = null;
while ($row = $result->fetch_assoc()) {
   $data[0] = $row;
   //$data[0]['photo']='data:image/jpeg;base64,'.base64_encode($row['photo']);
   $data[0]['photo']=base64_encode($row['photo']);
}

echo json_encode($data[0]);

$stmt->close();  // Close the prepared statement
?>