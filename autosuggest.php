<?php
   $db = new mysqli('sql12.freesqldatabase.com', 'sql12671580' , '1TraNq92BS', 'sql12671580');

if (!$db) {
	echo 'Could not connect to the database.';
} else {
	if (isset($_POST['queryString'])) {
		$queryString = $db->real_escape_string($_POST['queryString']);

		if (strlen($queryString) > 0) {
			$query = $db->query("SELECT id, country_name, latitude, longitude FROM apps_countries WHERE country_name LIKE '$queryString%' LIMIT 10");
			if ($query) {
				echo '<ul>';
				while ($result = $query->fetch_object()) {
					echo '<li data-country-id="' . $result->id . '" data-latitude="' . $result->latitude . '" data-longitude="' . $result->longitude . '" onClick="fill(\''
						. addslashes($result->country_name) . '\', {lat: ' . $result->latitude . ', lng: ' . $result->longitude . '});">'
						. $result->country_name . '</li>';
				}
				echo '</ul>';
			} else {
				echo 'OOPS we had a problem :(';
			}
		} else {
			// do nothing
		}
	} else {
		echo 'There should be no direct access to this script!';
	}
}

mysqli_close($db);
?>