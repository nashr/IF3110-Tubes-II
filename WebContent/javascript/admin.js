function updateBarang()
{
	var w = document.forms["barang"]["id"].value;
	var x = document.forms["barang"]["gambar"].value;
	var y = document.forms["barang"]["nama"].value;
	var z = document.forms["barang"]["harga"].value;
	
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	}
	else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			if (xmlhttp.responseText == 0) { // failed
				alert("Sayang sekali, barang tidak berhasil di-update.");
			} else { // success
				alert("Selamat! Barang berhasil di-update.");
			}
		}
	};
	
	xmlhttp.open("GET", "server/update_database.jsp?id="+w+"&img="+x+"&name="+y+"&prc="+z, true);
	xmlhttp.send();
}

function deleteBarang()
{
	var w = document.forms["barang"]["id"].value;
	
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	}
	else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			if (xmlhttp.responseText == 0) { // failed
				alert("Proses mengalami hambatan.");
			} else { // success
				alert("Barang berhasil dihapus.");
			}
		}
	};
	
	xmlhttp.open("GET", "server/delete_barang.jsp?id="+w, true);
	xmlhttp.send();
}