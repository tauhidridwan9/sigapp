# Sigap

Dokumentasi pemasangan SIGAP pada 000.webhost

## Penyiapan alat

1. Git clone https://github.com/tauhidridwan9/sigapp
2. Upload code ke 000.webhost
3. Buat databases di 000.webhost
4. import sig(1).sql ke database teman-teman
5. Setting koneksi.php sesuai dengan username database dan nama database. contoh $db = mysqli_connect('localhost', 'username_anda', 'password_anda') or die('Unable to connect. Check your connection parameters.'); mysqli_select_db($db, 'nama_database') or die(mysqli_error($db));?>
    Jika terdapat error pada session tambahkan "php_flag output_buffering on" pada .htaccess
