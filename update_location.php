<?php
include('koneksi.php');
error_log("AJAX request received.");

// Ambil data dari AJAX
$locationId = $_POST['locationId'];
$locationName = $_POST['locationName'];
$locationStatus = $_POST['locationStatus'];

// Debugging: Lihat nilai parameter yang dikirimkan
// echo "Location ID: $locationId, Name: $locationName, Status: $locationStatus";

// Update data di database
$query = "UPDATE kordinat_gis SET nama_tempat = '$locationName', status = '$locationStatus' WHERE nomor = '$locationId'";
$result = mysqli_query($db, $query);

// Periksa apakah query berhasil dijalankan
if ($result) {
    // Berhasil mengubah data
    $response = array("status" => "success", "message" => "Berhasil mengubah data");
} else {
    // Gagal mengubah data
    $response = array("status" => "error", "message" => "Gagal mengubah data");
}

// Mengirimkan respons dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);
