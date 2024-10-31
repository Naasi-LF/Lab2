<?php
require_once 'config.php';
session_start();
extract($_SESSION);
echo "Hello $first_name, $last_name with id $id";
?>
