<?php
session_start();
include('koneksi.php');

$output = '';

// Check if the user is logged in
if (isset($_SESSION['login']) && $_SESSION['login'] === true) {
	// User is logged in, suggest all locations regardless of status
	$query = "SELECT * FROM kordinat_gis WHERE nama_tempat LIKE '%" . mysqli_real_escape_string($db, $_POST['queryString']) . "%'";
} else {
	// User is not logged in, suggest only locations with status 1
	$query = "SELECT * FROM kordinat_gis WHERE status = 1 AND nama_tempat LIKE '%" . mysqli_real_escape_string($db, $_POST['queryString']) . "%'";
}

$result = mysqli_query($db, $query);

if ($result) {
	while ($row = mysqli_fetch_assoc($result)) {
		$latitude = $row['x'];
		$longitude = $row['y'];
		$locationName = $row['nama_tempat'];

		// Tampilkan nama_tempat sebagai opsi autosuggest
		$output .= "<li class='content list-group-item list-group-item-action d-flex' data-locationname='$locationName' data-latitude='$latitude' data-longitude='$longitude'>$locationName</li>";
	}
	echo $output;
} else {
	echo 'Query execution error';
}
