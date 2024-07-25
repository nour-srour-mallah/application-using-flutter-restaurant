<?php
include("../connect.php");
$userid = htmlspecialchars($_POST["userid"]);
$stmt = $con->prepare("SELECT * FROM `cart`,`meal` WHERE cart.meal=idMeal AND`user`= ?");
$stmt->bind_param("s", $userid);  // Bind values to placeholders

$stmt->execute();  // Execute the prepared statement

$result = $stmt->get_result();
try {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
     }
     echo json_encode($data);
} catch (\Throwable $th) {
    $data="nodata";
    echo json_encode($data);
}
$stmt->close();  // Close the prepared statement

?>

