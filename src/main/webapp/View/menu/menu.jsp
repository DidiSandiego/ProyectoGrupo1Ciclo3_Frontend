<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tienda generica</title>
	<style type="text/css">
	<%@ include file="style.css" %>
	</style>
</head>
<body>
	<header>
		<section class="header--section-principal">
			<a class="header--logo" href="">
				<img src="https://i.imgur.com/ilRYrbQ.png" alt="logo tienda generica">
			</a>
			<h1 class="header--title">Tienda generica</h1>
			<nav class="header--menu">
					<a class="header--menu-inicio" href="../../View/Login/login.jsp">Cerrar sesi&oacuten</a>
			</nav>
		</section>
		<section class="header--section-opciones">
			<nav class="header--opciones-nav">
				<!--<a class="header--opcion-item" href="../usuario/usuario.jsp">Usuarios</a>-->
				<a href="../usuario/usuario.jsp">Usuarios</a>
				<a ref="">Clientes</a>
				<a href="">Proveedores</a>
				<a href="">Productos</a>
				<a href="">Ventas</a>
				<a href="">Reportes</a>
			</nav>
		</section>
	</header>	
</body>
</html>