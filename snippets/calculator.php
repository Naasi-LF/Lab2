<!DOCTYPE html>
<html>
<body>

<h2>Calculator</h2>
<form action="calculator.php" method="post">
    <p>First Number: <input type="text" name="x"></p>
    <p>Second Number: <input type="text" name="y"></p>
    <p>Operation:
        <select name="operation">
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select>
    </p>
    <input type="submit" value="Calculate">
</form>

<?php
if (isset($_POST['x']) && isset($_POST['y']) && isset($_POST['operation'])) {
    $x = $_POST['x'];
    $y = $_POST['y'];
    $operation = $_POST['operation'];
    $result = null;

    if (is_numeric($x) && is_numeric($y)) {
        switch ($operation) {
            case "add":
                $result = $x + $y;
                echo "<h1>$x + $y = $result</h1>";
                break;
            case "subtract":
                $result = $x - $y;
                echo "<h1>$x - $y = $result</h1>";
                break;
            case "multiply":
                $result = $x * $y;
                echo "<h1>$x * $y = $result</h1>";
                break;
            case "divide":
                if ($y != 0) {
                    $result = $x / $y;
                    echo "<h1>$x / $y = $result</h1>";
                } else {
                    echo "<h1>Cannot divide by zero</h1>";
                }
                break;
            default:
                echo "<h1>Invalid operation selected</h1>";
        }
    } else {
        echo "<h1>Please enter valid numbers</h1>";
    }
}
?>

</body>
</html>
