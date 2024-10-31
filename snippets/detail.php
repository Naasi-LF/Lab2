<?php
require_once '../connect_db.php';
if (isset($_GET['id']))
{
    $id = $_GET['id'];
    $sql = "SELECT * from shop WHERE item_id=$id";
    echo get_results_string($sql);
}
?>
