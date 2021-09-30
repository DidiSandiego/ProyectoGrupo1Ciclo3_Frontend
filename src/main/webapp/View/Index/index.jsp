<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title>Tienda generica</title>
	<link rel="preload" href="normalize.css" as="style">
	<link rel="stylesheet" href="normalize.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Krub:wght@400;700&display=swap" rel="stylesheet">
	<style type="text/css">
	<%@ include file="style.css" %>
	</style>
</head>
<body>
	<header>
		<a class="header--logo" href="index.jsp">
			<img src="https://i.imgur.com/ilRYrbQ.png" alt="logo tienda generica">
		</a>
		<h1 class="header--title">Tienda generica</h1>
		<nav class="header--menu">
			<ul>
				<li><a class="header--menu-inicio" href="../Login/login.jsp">Iniciar sesi&oacuten</a></li>
			</ul>
		</nav>
	</header>
	<footer>
		<p>Todos los derechos reservados Grupo 1.1 Universidad El Bosque</p>
	</footer>
</body>
</html>