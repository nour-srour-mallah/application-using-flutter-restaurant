<?php
include("../connect.php");
// $email = htmlspecialchars($_POST["email"]);
// $id = htmlspecialchars($_POST["id"]);
$id="202010234";
$stmt2 = $con->prepare("SELECT photo FROM `users` WHERE `email`=? OR `id`= ?");
$stmt2->bind_param("ss", $email,$id);  // Bind parameters to placeholders
$stmt2->execute();  
$result2 = $stmt2->get_result();
$row2 = $result2->fetch_array();
$return='"data:image/jpeg;base64,'.base64_encode($row2['photo']).'"';
echo '"photo:"'.$return;
?>