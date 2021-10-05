package co.edu.unbosque.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import co.edu.unbosque.frontend.TestJSON;
import co.edu.unbosque.frontend.Usuarios;
import co.edu.unbosque.frontend.encrypt;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletUsuario() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String eliminar = request.getParameter("Eliminar");
		String modificar = request.getParameter("Datos");
		
		
		PrintWriter out = response.getWriter();
		if(eliminar != null) {
			/*request.getRequestDispatcher("/View/usuario/usuario.jsp").forward(request, response);*/
			System.out.println("eliminar " +eliminar);
			out.println("Boton eliminar desde post "+eliminar );
		}
		if(modificar != null) {
			System.out.println("modificar " +modificar);
			out.println("Boton modificar desde post "+modificar);
		}
		/*String cedula = request.getParameter("Eliminar");
		System.out.println(cedula);
		PrintWriter out = response.getWriter();
		out.println("Boton eliminar desde get "+cedula);
		/*eliminarUsuario(request, response);
		String modificar = request.getParameter("Modificar");
		String eliminar = request.getParameter("Eliminar");
		String cedula = request.getParameter("cedula");
		PrintWriter out = response.getWriter();
		System.out.println(eliminar);
		System.out.println(modificar);
		System.out.println(cedula);
		out.println("Boton eliminar "+eliminar );
		out.println("Boton modificar "+modificar);
		/*if(eliminar != null) {
			eliminarUsuario(request, response);
		}
		if(modificar != null) {
			actualizarUsuario(request, response);
		}
		out.println("Modificar: "+modificar+" Eliminar: "+eliminar);
		actualizarUsuario(request, response);*/
	}
	public void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuarios usuario = new Usuarios();
		usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
		int respuesta = TestJSON.eliminarUsuario(usuario);
		PrintWriter out = response.getWriter();
		if (respuesta == 200) {
			request.getRequestDispatcher("/View/usuario/usuario.jsp").forward(request, response);
		}else out.println(" Error "+respuesta);
		out.close();
	}
	public void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Usuarios usuario = new Usuarios();
		String parametros = request.getParameter("nombre");
		/*usuario.setCedula_usuario( Long.parseLong(request.getParameter("cedula")));
		usuario.setNombre_usuario(request.getParameter("nombre"));
		usuario.setEmail_usuario(request.getParameter("correo"));
		usuario.setUsuario(request.getParameter("usuario"));
		
		int respuesta = TestJSON.actualizarUsuario(usuario);*/
		PrintWriter out = response.getWriter();
		out.println("Parametros: "+parametros);
		
	}
	public void agregarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		encrypt encryptar = new encrypt();
		Usuarios usuario = new Usuarios();
		usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
		usuario.setNombre_usuario(request.getParameter("nombre"));
		usuario.setEmail_usuario(request.getParameter("correo"));
		usuario.setUsuario(request.getParameter("usuario"));
		try {
			usuario.setPassword(encryptar.passEncrypt(request.getParameter("password")));
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e1) {
			e1.printStackTrace();
		}
		int respuesta = 0;
		try {
			respuesta = TestJSON.postJSON(usuario);
			PrintWriter writer = response.getWriter();
			if (respuesta == 200) {
				request.getRequestDispatcher("/View/usuario/usuario.jsp").forward(request, response);
			}else writer.println("Error: "+respuesta);
			writer.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void listarUsuarios(HttpServletRequest request, HttpServletResponse response) {
		try {
			ArrayList<Usuarios> lista = TestJSON.getJSON();
			request.setAttribute("lista", lista);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eliminar = request.getParameter("Eliminar");
		String modificar = request.getParameter("Datos");
		
		
		PrintWriter out = response.getWriter();
		if(eliminar != null) {
			System.out.println("eliminar " +eliminar);
			out.println("Boton eliminar desde post "+eliminar );
		}
		if(modificar != null) {
			System.out.println("modificar " +modificar);
			out.println("Boton modificar desde post "+modificar);
		}
		
		String agregar = request.getParameter("Agregar");
		if(agregar != null) {
			agregarUsuario(request, response);
		}
	}
}
