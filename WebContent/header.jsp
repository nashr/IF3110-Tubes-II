<link rel="stylesheet" href="css/header.css" type="text/css"/>
<header id="banner" class="body">
	<%@ page import="java.sql.*" %>
	<%
	String db_url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(db_url, "root", "");
	assert(connection != null);
	Statement statement = connection.createStatement();
	ResultSet categories = statement.executeQuery("SELECT DISTINCT kategori FROM barang");
	%>
	<div id="headerlogo">
		<a href="index.jsp"><img src="images/logo.png" alt="Logo"/></a>
	</div>
	<nav>
		<ul id="menubar">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#">Kategori Barang</a>
				<ul class="sub-menu">	
					<% while (categories.next()) { %>
					<li><a href="halamanbarang.jsp?kategori='<%= categories.getObject("kategori") %>'">
					<%= categories.getObject("kategori") %></a></li>
					<% } connection.close();%>
				</ul>
			</li>
			<!--div id="log"></div-->
			<li><a href="#login_form">Log In</a></li>
			<li><a href="registerform.jsp">Daftar</a></li>
			<li><a href="cart.jsp">Shopping Bag</a></li>
			<li id="searchbar"><button type="button" class="button" id="searchbutton">Search</button></li>
			<li id="searchbar"><input type="text" name="search" id="cari" placeholder="Cari Barang"></li>
		</ul>
	</nav>
	<%@include file="loginform.jsp" %>
</header>