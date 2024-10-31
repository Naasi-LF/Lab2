<?php
require_once '../connect_db.php';
?>

    <form action="showpricebelow.php" method="POST">
    <p>Show dishes below £</p>
    <input type="text" name="maxprice" id="maxprice">
    <input type="submit">
</form>

<?php
global $dbc;
if(isset($_POST['maxprice']))
{

    $maxprice = $_POST['maxprice'];
    #unsafe!!!!
    $sql = "SELECT * FROM shop where item_price < $maxprice";
    $result = $dbc->query($sql);
    if ($result->num_rows == 0) return;
    echo "<h1>Dishes less than $maxprice</h1>";
    foreach($result->fetch_all(MYSQLI_ASSOC) as $row) {
        extract($row);
        //the ../ below is only necessary because we are running this script from the snippets subdirectory
        echo "<img src='../$restaurant/$item_img' width='100' height='100'/><br/> $item_name @ $item_price <hr/>";
    }
}
