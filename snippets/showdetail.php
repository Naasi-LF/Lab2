<?php
require_once '../connect_db.php';
?>

    <form action="showdetail.php" method="POST">
    <p>Show dishes from restaurant </p>
    <select name="restaurantchooser" id="restaurantchooser">
        <option></option>
        <option name="g1" value="g1">g1</option>
        <option name="g2" value="g2">g2</option>
        <option name="g3" value="g3">g3</option>
        <option name="g4" value="g4">g4</option>
        <option name="g5" value="g5">g5</option>
        <option name="g6" value="g6">g6</option>
        <option name="g7" value="g7">g7</option>
        <option name="g11" value="g11">g11</option>
        <option name="g12" value="g12">g12</option>
        <option name="g13" value="g13">g13</option>
        <option name="g14" value="g14">g14</option>
        <option name="g15" value="g15">g15</option>
        <option name="g16" value="g16">g16</option>
        <option name="g17" value="g17">g17</option>
        <option name="g18" value="g18">g18</option>
        <option name="g19" value="g19">g19</option>
        <option name="g20" value="g20">g20</option>
    </select>
    <input type="submit">
</form>

<?php
if(isset($_POST['restaurantchooser']))
{

    $restaurant = $_POST['restaurantchooser'];
    $sql = "SELECT * from shop where restaurant = '$restaurant'";
    $result = $dbc->query($sql);
    if ($result->num_rows == 0) return;


    foreach($result->fetch_all(MYSQLI_ASSOC) as $row) {
        extract($row);
        echo "<a href='detail.php?id=$item_id'>
        <img src='../$restaurant/$item_img' width='100' height='100'/></a>
        <br/> £ $item_price $item_name<hr/>";
    }
}
