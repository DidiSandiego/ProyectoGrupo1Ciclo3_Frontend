<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='co.edu.unbosque.frontend.Usuarios'%>
<%@ page import='java.util.ArrayList'%>
<%@ page import='co.edu.unbosque.frontend.TestJSON'%>
<%@ page import='co.edu.unbosque.servlet.ServletUsuario' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tienda generica</title>
<style type="text/css">
<%@ include file="style.css"%>
</style>
</head>
<body>
	<header id="header">
		<jsp:include page="../menu/menu.jsp" />
	</header>
	<main>
		<section class="main--formulario-registro">
			<h2>Registrar usuario</h2>
			<form action="${pageContext.request.contextPath}/ServletUsuario"
				method="post" class="formulario--registro-form">
				<label for="cedula" class="formulario--registro-label"> <span>Cedula</span>
					<input type="text" name="cedula" id="cedula"
					class="formulario--registro-campo" placeholder="Ingresa tu cedula" />
				</label> <label for="nombre" class="formulario--registro-label"> <span>Nombre</span>
					<input type="text" name="nombre" id="nombre"
					class="formulario--registro-campo"
					placeholder="Ingresa tu nombre completo" />
				</label> <label for="correo" class="formulario--registro-label"> <span>Correo</span>
					<input type="text" name="correo" id="correo"
					class="formulario--registro-campo"
					placeholder="Ingresa tu correo electrónico" />
				</label> <label for="usuario" class="formulario--registro-label"> <span>Usuario
				</span> <input class="formulario--registro-campo" name="usuario"
					id="usuario" type="text" placeholder="Ingresa tu usuario" />
				</label> <label for="password" class="formulario--registro-label"> <span>Password
				</span> <input class="formulario--registro-campo" name="password"
					id="password" type="password" placeholder="Ingresa tu contraseña" />
				</label> <input class="formulario--registro-submit" name="Agregar"
					id="button" type="submit" value="Registrar" />
			</form>
		</section>

		<section class="main--view--usuarios">

			<section class="main--view-consultas">
				<select name="tipo_consulta" class="main--tipo-consulta">
					<option selected value="0">Seleccione su consulta</option>
					<option value="1">Consultar por cedula</option>
					<option value="2">Consultar por nombre</option>
					<option value="3">Consultar por correo</option>
					<option value="4">Consultar por usuario</option>
				</select> <input type="text" class="main--consulta-campo" name="consulta"
					id="consulta" placeholder="Ingrese el dato a buscar" /> <input
					type="submit" class="main--consulta-submit" name="buscar"
					id="buscar" value="Buscar" />
			</section>
			<section class="main--lista-usuarios">
				<p>Listado de usuarios</p>
				<div class="main--container-lista">
					<table class="main--lista-table">
						<thead>
							<tr class="main--table-tr">
								<th><label class="main--table-cedula">Cedula</label></th>
								<th><label>Nombre</label></th>
								<th><label class="main--table-correo">Correo</label></th>
								<th><label>Usuario</label></th>
								<th></th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="main--container-listaBody">
					<table class="main--table-body">
						<tbody>
						<%
						ArrayList<Usuarios> lista = TestJSON.getJSON();
						for (Usuarios usuario : lista) {
							
						%>
							<tr class="main--table-tr">
								<td id="cedula" name="cedula"><%=usuario.getCedula_usuario()%></td>
								<td contenteditable='true'><%=usuario.getNombre_usuario()%></td>
								<td contenteditable='true'><%=usuario.getEmail_usuario()%></td>
								<td contenteditable='true'><%=usuario.getUsuario()%></td>
								<td class="main--lista-botones">
								<form action="${pageContext.request.contextPath}/ServletUsuario" method="get">
									<input class="main--lista-boton1" type="submit" onclick="id='<%=usuario.getCedula_usuario() %>'" name="Eliminar" value="Eliminar"/>
									<input class="main--lista-boton2" type="submit" onclick="value='<%=usuario.getNombre_usuario()%>'" name="Datos" value="Modificar"/>
								</form>
								</td>
							</tr>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
			</section>
		</section>
	</main>
	<footer>
		<p>Todos los derechos reservados Grupo 1.1 Universidad El Bosque</p>
	</footer>
</body>
</html>