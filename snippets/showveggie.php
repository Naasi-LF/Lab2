<?php
require_once '../connect_db.php';
global $dbc;
$result = $dbc->query("SELECT * from shop where vegetarian=1");

if ($result->num_rows == 0) return;


foreach($result->fetch_all(MYSQLI_ASSOC) as $row) {
    extract($row);
    echo "<img src='../$restaurant/$item_img' width='100' height='100'/><br/> $item_name<hr/>";
}
?>