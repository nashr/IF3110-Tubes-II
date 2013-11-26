<!DOCTYPE html>
<html>
<head>
	<title>List Barang</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/halamanbarang.css" type="text/css"/>
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		<%
		connection = DriverManager.getConnection(db_url, "root", "");
		statement = connection.createStatement();
		String query = new String();
		String kategori = request.getParameter("kategori");
		String paramNama = request.getParameter("sortnama");
		String paramHarga = request.getParameter("sortharga");
		if(paramNama != null) {
			if(paramNama.equals("asc")) {
				query = "SELECT * FROM barang WHERE kategori = \"" + kategori + "\" ORDER BY nama ASC";
			} else {
				query = "SELECT * FROM barang WHERE kategori = \"" + kategori + "\" ORDER BY nama DESC";
			}
		} else if(paramHarga != null) {
			if(paramHarga.equals("asc")) {
				query = "SELECT * FROM barang WHERE kategori = \"" + kategori + "\" ORDER BY harga ASC";
			} else {
				query = "SELECT * FROM barang WHERE kategori = \"" + kategori + "\" ORDER BY harga DESC";
			}
		} else {
			query = "SELECT * FROM barang WHERE kategori = \"" + kategori + "\"";	
		}
		ResultSet goodies = statement.executeQuery(query);
		%>
		
		<div id="contentcontainer">
		<article id="content" class="body">
			<div class="sort">
				<p id="sort-text">Sort by:<br />
					<a href="halamanbarang.jsp?kategori=<%= kategori %>&sortnama=asc">Nama (A-Z)</a> | 
					<a href="halamanbarang.jsp?kategori=<%= kategori %>&sortnama=desc">Nama (Z-A)</a> | 
					<a href="halamanbarang.jsp?kategori=<%= kategori %>&sortharga=asc">Harga (Kecil-Besar)</a> | 
					<a href="halamanbarang.jsp?kategori=<%= kategori %>&sortharga=desc">Harga (Besar-Kecil)</a>
				</p>
			</div>
			<% while(goodies.next()) { %>
			<div class="view">
				<img src="<%= goodies.getObject("gambar") %>"/>
				<div class="mask">
					<h2><a href="detailbarang.jsp?barang='<%= goodies.getObject("nama") %>'" class="info">
					<%= goodies.getObject("nama") %></a></h2>
					<p>Harga: <%= goodies.getObject("harga") %>
					<br />Masukkan jumlah yang akan dibeli:
					<br /><input type="number" id="qty" name="quantity" min="0">
					<input type="button" id="buybutton" value="Beli!">
					</p>
				</div>
			</div>
			<% } connection.close(); %>
		</article>
		
		<%@include file="sidebar.jsp" %>
		</div>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>