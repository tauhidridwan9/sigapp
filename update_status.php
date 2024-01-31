<?php
include('koneksi.php');

if (isset($_POST['nomor']) && isset($_POST['newStatus'])) {
    $nomor = mysqli_real_escape_string($db, $_POST['nomor']);
    $newStatus = mysqli_real_escape_string($db, $_POST['newStatus']);

    if (is_numeric($nomor) && ($newStatus === '0' || $newStatus === '1')) {
        $query = "UPDATE kordinat_gis SET status = '$newStatus' WHERE nomor = '$nomor'";
        mysqli_query($db, $query) or die(mysqli_error($db));

        echo json_encode(['status' => 'success']);
        exit;
    }
}

echo json_encode(['status' => 'error', 'message' => 'Invalid data']);
exit;
