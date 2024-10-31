<?php
require_once '../connect_db.php';
?>

    <p>Show dishes from restaurant </p>
        <a href="showdishesfromrestaurantget.php?place=g1">g1</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g2">g2</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g3">g3</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g4">g4</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g5">g5</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g6">g6</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g7">g7</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g11">g11</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g12">g12</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g13">g13</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g14">g14</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g15">g15</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g16">g16</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g17">g17</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g18">g18</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g19">g19</a><br/>
        <a href="showdishesfromrestaurantget.php?place=g20">g20</a><br/>


<?php
if(isset($_GET['place']))
{
    global $dbc;
    $restaurant = $_GET['place'];

    echo "<h1>Dishes from Restaurant $restaurant</h1>";
    #unsafe!!!!
    $sql = "SELECT * FROM shop where restaurant='$restaurant'";
    $result = $dbc->query($sql);
    if ($result->num_rows == 0) return;
    echo "<h1>Dishes from Restaurant $restaurant</h1>";
    foreach($result->fetch_all(MYSQLI_ASSOC) as $row) {
        extract($row);
        //the ../ below is only necessary because we are running this script from the snippets subdirectory
        echo "<img src='../$restaurant/$item_img' width='100' height='100'/><br/> $item_name <hr/>";
    }



}
