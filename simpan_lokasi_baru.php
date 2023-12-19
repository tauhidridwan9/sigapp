<?php
include('koneksi.php');

$koordinat_x = $_GET['koordinat_x'];
$koordinat_y = $_GET['koordinat_y'];
$nama_tempat = $_GET['nama_tempat'];
$query = "insert into kordinat_gis (x,y,nama_tempat) values($koordinat_x,$koordinat_y,'$nama_tempat')";
mysqli_query($db, $query) or die(mysqli_error($db));
?>
