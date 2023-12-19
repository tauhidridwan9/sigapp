<script type="text/javascript">
	$(document).ready(function() {
		var intervalId = setInterval(loadDataLokasiTersimpan, 30000);

		$(".delbutton").click(function(event) {
			var element = $(this);
			var del_id = element.attr("id");
			var info = 'nomor=' + del_id;

			if (confirm("Anda yakin akan menghapus?")) {
				$.ajax({
					type: "POST",
					// url: "hapus_lokasi.php",
					data: info,
					success: function() {
						element.parents(".content").animate({
							opacity: "hide"
						}, "slow");
						// Hentikan interval sebelum memulai yang baru
						clearInterval(intervalId);
						// Mulai interval kembali setelah penghapusan
						intervalId = setInterval(loadDataLokasiTersimpan, 30000);
					}
				});
			}

			return false;
		});
	});
</script>
<?php
include('koneksi.php');
$query = 'select * from kordinat_gis WHERE status = 1 ORDER BY nomor DESC LIMIT 10';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($koor = mysqli_fetch_assoc($result)) {
?>
	<ul>

		<li class="content"><a href="javascript:carikordinat(new google.maps.LatLng(<?php echo $koor['x']; ?>,<?php echo $koor['y']; ?>))"><?php echo $koor['nama_tempat']; ?></a> </li>
	</ul>
<?php
}
?>

<!-- <a href="#" class="
	delbutton" id="<?php echo $koor['nomor']; ?>">(Hapus)</a> -->