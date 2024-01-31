<?php session_start() ?>
<script type="text/javascript">
	$(document).ready(function() {
		var intervalId = setInterval(loadDataLokasiTersimpan, 3000);

		$(".delbutton").click(function(event) {
			var element = $(this);
			var del_id = element.attr("id");
			var info = 'nomor=' + del_id;

			if (confirm("Anda yakin akan menghapus?")) {
				$.ajax({
					type: "POST",
					url: "hapus_lokasi.php",
					data: info,
					success: function() {
						element.parents(".content").animate({
							opacity: "hide"
						}, "slow");
						// Hentikan interval sebelum memulai yang baru
						clearInterval(intervalId);
						// Mulai interval kembali setelah penghapusan
						intervalId = setInterval(loadDataLokasiTersimpan, 3000);
					}
				});
			}

			return false;
		});

	});
</script>
<?php
include('koneksi.php');

// Tentukan klausa WHERE berdasarkan status sesi login
$whereClause = (isset($_SESSION['login']) && $_SESSION['login'] === true) ? '' : 'WHERE status = 1';

// Tampilkan semua lokasi tersimpan
$query = "SELECT * FROM kordinat_gis $whereClause ORDER BY nomor DESC ";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($koor = mysqli_fetch_assoc($result)) {
	$statusClass = ($koor['status'] == 1) ? 'bg-danger' : '';
	$statusText = ($koor['status'] == 1) ? 'Aktif' : 'Tidak Aktif';
?>
	<ul>
		<li class="content list-group-item list-group-item-action d-flex <?php echo $statusClass; ?>">
			<div class="container">
				<a class="text-body-secondary" style="text-decoration: none;" href="javascript:carikordinat(new google.maps.LatLng(<?php echo $koor['x']; ?>,<?php echo $koor['y']; ?>))"><?php echo $koor['nama_tempat']; ?></a>
			</div>
			<div class="container d-flex justify-content-end p-8">
				<span style="margin-right: 2em;">Status: <?php echo $statusText; ?></span>
				<?php
				// Cek apakah sesi login aktif
				if (isset($_SESSION['login']) && $_SESSION['login'] === true) {
				?>
					<a href="#" class="delbutton" id="<?php echo $koor['nomor']; ?>"><img width="20px" style="margin-right: 2em;" src="./trash-solid.svg" alt="trash" /></a>
					<!-- Example single danger button -->
				<?php
				}
				?>
			</div>
		</li>
	</ul>
<?php
}
?>