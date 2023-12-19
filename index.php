<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Contoh Aplikasi Peta GIS Sederhana Dengan Google Map API</title>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyDTXGEsxXrF_C3YwcY-5N6vEoW1sEI31Sg&libraries=places"></script>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript">
        var peta;
        var koorAwal = new google.maps.LatLng(-7.329579339811421, 108.2196256616021);

        function peta_awal() {
            loadDataLokasiTersimpan();
            var settingpeta = {
                zoom: 15,
                center: koorAwal,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            peta = new google.maps.Map(document.getElementById("kanvaspeta"), settingpeta);
            google.maps.event.addListener(peta, 'click', function(event) {
                tandai(event.latLng);
            });
        }

        function geocodeCountry(countryName) {
            var geocoder = new google.maps.Geocoder();

            geocoder.geocode({
                address: countryName
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                    var location = results[0].geometry.location;

                    // Set koorAwal to the new coordinates
                    koorAwal = new google.maps.LatLng(location.lat(), location.lng());

                    // Setel peta ke lokasi geokode
                    peta.panTo(koorAwal);

                    // Tandai lokasi pada peta
                    tandai(koorAwal);

                    // Isi input koordinat X dan Y
                    $("#koorX").val(location.lat());
                    $("#koorY").val(location.lng());
                } else {
                    console.error('Geokoding gagal: ' + status);
                }
            });
        }


        $(document).ready(function() {
            $("#simpanpeta").click(function() {
                var koordinat_x = $("#koorX").val();
                var koordinat_y = $("#koorY").val();
                var nama_tempat = $("#namaTempat").val();
                $.ajax({
                    url: "simpan_lokasi_baru.php",
                    data: "koordinat_x=" + koordinat_x + "&koordinat_y=" + koordinat_y + "&nama_tempat=" + nama_tempat,
                    success: function(msg) {
                        $("#namaTempat").val(null);
                    }
                });
            });

            // Menambahkan fungsi click untuk setiap elemen li pada sublist autosuggest
            $('#suggestionsList').on('click', 'li', function() {
                var description = $(this).text();
                var location = $(this).data('location');
                fill(description, location);
            });
        });

        function initMap() {
            loadDataLokasiTersimpan();
            var settingpeta = {
                zoom: 15,
                center: koorAwal,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            peta = new google.maps.Map(document.getElementById("kanvaspeta"), settingpeta);
            google.maps.event.addListener(peta, 'click', function(event) {
                tandai(event.latLng);
            });

            var input = document.getElementById('country');
            var autocomplete = new google.maps.places.Autocomplete(input);

            autocomplete.addListener('place_changed', function() {
                var place = autocomplete.getPlace();
                if (place.geometry) {
                    // Setel peta ke lokasi yang dipilih
                    peta.setCenter(place.geometry.location);
                    peta.setZoom(15);

                    // Tandai lokasi pada peta
                    tandai(place.geometry.location);

                    // Isi input koordinat X dan Y
                    $("#koorX").val(place.geometry.location.lat());
                    $("#koorY").val(place.geometry.location.lng());
                }
            });
        }


        function tandai(lokasi) {
            $("#koorX").val(lokasi.lat());
            $("#koorY").val(lokasi.lng());

            // Hapus marker yang ada jika sudah ada
            if (tanda) {
                tanda.setMap(null);
            }

            // Tambahkan marker baru
            tanda = new google.maps.Marker({
                position: lokasi,
                map: peta
            });

            // Pan peta ke lokasi yang ditandai
            peta.panTo(lokasi);
        }

        function loadDataLokasiTersimpan() {
            $('#kordinattersimpan').load('tampilkan_lokasi_tersimpan.php');
        }
        setInterval(loadDataLokasiTersimpan, 30000);

        function carikordinat(lokasi) {
            var settingpeta = {
                zoom: 15,
                center: lokasi,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            peta = new google.maps.Map(document.getElementById("kanvaspeta"), settingpeta);
            tanda = new google.maps.Marker({
                position: lokasi,
                map: peta
            });
            google.maps.event.addListener(tanda, 'click', function() {
                infowindow.open(peta, tanda);
            });
            google.maps.event.addListener(peta, 'click', function(event) {
                tandai(event.latLng);
            });
        }

        function gantipeta() {
            loadDataLokasiTersimpan();
            var isi = document.getElementById('cmb').value;
            if (isi == '1') {
                var settingpeta = {
                    zoom: 15,
                    center: koorAwal,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                };
            } else if (isi == '2') {
                var settingpeta = {
                    zoom: 15,
                    center: koorAwal,
                    mapTypeId: google.maps.MapTypeId.TERRAIN
                };
            } else if (isi == '3') {
                var settingpeta = {
                    zoom: 15,
                    center: koorAwal,
                    mapTypeId: google.maps.MapTypeId.SATELLITE
                };
            } else if (isi == '4') {
                var settingpeta = {
                    zoom: 15,
                    center: koorAwal,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                };
            }
            peta = new google.maps.Map(document.getElementById("kanvaspeta"), settingpeta);
            google.maps.event.addListener(peta, 'click', function(event) {
                tandai(event.latLng);
            });
        }

        function suggest(inputString) {
            if (inputString.length == 0) {
                $('#suggestions').fadeOut();
            } else {
                $('#country').addClass('load');
                $.post("autosuggest.php", {
                    queryString: "" + inputString + ""
                }, function(data) {
                    if (data.length > 0) {
                        $('#suggestions').fadeIn();
                        $('#suggestionsList').html(data);
                        $('#country').removeClass('load');

                        // Tambahkan informasi lokasi ke setiap elemen li
                        $('#suggestionsList li').each(function() {
                            var latitude = $(this).data('latitude');
                            var longitude = $(this).data('longitude');
                            $(this).data('location', {
                                lat: latitude,
                                lng: longitude
                            });
                        });
                    }
                });
            }
        }

        function fill(thisValue, coordinates) {
            $('#country').val(thisValue);

            // Isi input koordinat X dan Y jika koordinat disertakan
            if (coordinates) {
                $("#koorX").val(coordinates.lat);
                $("#koorY").val(coordinates.lng);

                // Tandai lokasi pada peta
                tandai(new google.maps.LatLng(coordinates.lat, coordinates.lng));
            } else {
                // Jika koordinat tidak disertakan, set koorAwal ke koordinat negara yang dipilih
                geocodeCountry(thisValue);
            }

            setTimeout(function() {
                $('#suggestions').fadeOut();
            }, 600);
        }
    </script>
</head>

<style>
    #result {
        height: 20px;
        font-size: 16px;
        font-family: Arial, Helvetica, sans-serif;
        color: #333;
        padding: 5px;
        margin-bottom: 10px;
        background-color: #FFFF99;
    }

    #country {
        padding: 3px;
        border: 1px #CCC solid;
        font-size: 17px;
    }

    .suggestionsBox {
        position: absolute;
        left: 0px;
        top: 40px;
        margin: 26px 0px 0px 0px;
        width: 200px;
        padding: 0px;
        background-color: #000;
        border-top: 3px solid #000;
        color: #fff;
    }

    .suggestionList {
        margin: 0px;
        padding: 0px;
    }

    .suggestionList ul li {
        list-style: none;
        margin: 0px;
        padding: 6px;
        border-bottom: 1px dotted #666;
        cursor: pointer;
    }

    .suggestionList ul li:hover {
        background-color: #FC3;
        color: #000;
    }

    ul {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #FFF;
        padding: 0;
        margin: 0;
    }

    .load {
        background-image: url(loader.gif);
        background-position: right;
        background-repeat: no-repeat;
    }

    #suggest {
        position: relative;
    }

    body {
        font-size: 12px;
        font-family: Tahoma;
        margin: 0px auto;
        padding: 0px;
        color: #FFFFFF;
        background-color: #333333;
    }

    a {
        text-decoration: none;
        color: #FF0000;
        font-weight: bold;
    }

    a:hover {
        color: #FF9900;
    }

    ul {
        margin: 0px auto;
        padding: 0px 15px 0px 15px;
        list-style: square;
    }

    li {
        padding-left: 15px;
        padding: 0px 15px 0px 5px;
    }

    input,
    select {
        padding: 5px;
        border: 1px solid #FFFFFF;
        background-color: #FF9900;
    }

    input,
    button {
        padding: 5px;
        border: 1px solid #FFFFFF;
        background-color: #FF9900;
    }

    button:hover {
        padding: 5px;
        border: 1px solid #FFFFFF;
        background-color: #FF3300;
        cursor: pointer;
    }
</style>

<body onLoad="peta_awal()">
    <p>Silahkan klik kordinat awal terlebih dahulu sebelum memilih autosuggest</p>
    <form id="form" method="POST" name="country">
        <div id="suggest">Pilih Negara: <br />
            <input type="text" size="25" value="" id="country" onblur="fill();" class="" onkeyup="suggest(this.value);" />


            <div class="suggestionsBox" id="suggestions" style="display: none;"> <img src="arrow.png" style="position: relative; top: -12px; left: 30px;" alt="upArrow" />
                <div class="suggestionList" id="suggestionsList"> &nbsp; </div>
            </div>
        </div>
    </form>
    <div id="kanvaspeta" style=" margin:0px auto; width:72%; height:630px; float:right; padding:10px;"></div>
    <div id="form_lokasi" style="background-color:#333333;width:23%; height:600px;text-align:left;padding:10px; float:left;">
        <table>
            <tr>
                <td>Ganti Jenis Peta</td>
                <td>:
                    <select id="cmb" onchange="gantipeta()">
                        <option value="1">Peta Roadmap</option>
                        <option value="2">Peta Terrain</option>
                        <option value="3">Peta Satelite</option>
                        <option value="4">Peta Hybrid</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Koordinat X</td>
                <td>: <input type="text" name="koordinatx" id="koorX" readonly="readonly"></td>
            </tr>
            <tr>
                <td>Koordinat Y</td>
                <td>: <input type="text" name="koordinaty" id="koorY" readonly="readonly"></td>
            </tr>
            <tr>
                <td>Nama Lokasi</td>
                <td>: <input type="text" name="namatempat" id="namaTempat"></td>
            </tr>
            <tr>
                <td></td>
                <td><button id="simpanpeta">Simpan</button><button onclick="javascript:carikordinat(koorAwal);">Koordinat Awal</button></td>
            </tr>
        </table>
        <div id=kordinattersimpan></div>
    </div>
    </div>

    <script type="module">
        // Import the functions you need from the SDKs you need
        import {
            initializeApp
        } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
        import {
            getAnalytics
        } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-analytics.js";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        const firebaseConfig = {
            apiKey: "AIzaSyDOtlLPbfzI1_cMO_4zqo2dkXH0drZEXlU",
            authDomain: "sigapp-408617.firebaseapp.com",
            projectId: "sigapp-408617",
            storageBucket: "sigapp-408617.appspot.com",
            messagingSenderId: "240415901196",
            appId: "1:240415901196:web:c73feeb178b9e806505029",
            measurementId: "G-EVER8ZHS9P"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);
    </script>
</body>

</html>