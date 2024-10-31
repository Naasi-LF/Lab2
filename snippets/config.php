<?php
$dbname = "site_db";
$info_tbl = "info";
// Create connection
// change to "root" "" for xampp
// or "root" "root" for mamp
$db = new mysqli("localhost", "root", "", $dbname);
$db-> set_charset("utf8");
$siteRoot = "http://localhost/php/TakeOutKing/";
$host = "localhost";
$scheme = "http";
mysqli_report(MYSQLI_REPORT_STRICT);

// Check connection
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}

?>
