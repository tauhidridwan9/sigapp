<?php
$db = mysqli_connect('sql12.freesqldatabase.com', 'sql12671580', '1TraNq92BS') or
    die('Unable to connect. Check your connection parameters.');
mysqli_select_db($db, 'sql12671580') or die(mysqli_error($db));
?>
