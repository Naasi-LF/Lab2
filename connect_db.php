<?php
if (strpos($_SERVER['SERVER_NAME'], "pedro") !== false)
{
    $dbc = mysqli_connect("pedro.cs.herts.ac.uk", "UrPedroId", "UrPedroPassWord", "dbUrUHid")
    or die(mysqli_connect_error());
}
else
{
    $dbc = mysqli_connect("localhost", "root", "", "site_db") 
    or die(mysqli_connect_error());
}

// Set encoding to match PHP script encoding.
mysqli_set_charset($dbc, 'utf8');

function get_results_string($sql)
{
    global $dbc;
    $result = $dbc->query($sql);
    echo($sql);

    if ($result->num_rows == 0) return;

    echo "returned " . $result->num_rows . " rows ";

    echo '<table border="1">';
    foreach($result->fetch_all(MYSQLI_ASSOC) as $row) {
        foreach($row as $key => $value) {
            echo '<tr><td>' . $key . '</td><td>' . $value . '</td></tr>';
        }
        echo "<tr><td colspan='2'><center>***********************</center></td></tr>";
    }
    echo '</table><br/><hr/>';
}
?>
