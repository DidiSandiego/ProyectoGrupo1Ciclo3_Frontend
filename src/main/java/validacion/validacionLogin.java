package validacion;


import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.unbosque.frontend.TestJSON;
import co.edu.unbosque.frontend.Usuarios;
import co.edu.unbosque.frontend.encrypt;


@WebServlet("/validacionLogin")
public class validacionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public validacionLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void validacionUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		encrypt encryptar = new encrypt();
		String user = String.valueOf(request.getParameter("usuario"));
		String password = String.valueOf(request.getParameter("password"));
		String url = null;
		try {
			String passwordEncrypt = encryptar.passEncrypt(password);
			ArrayList<Usuarios> lista = TestJSON.getJSON();
			for (Usuarios  usuario : lista) {
				
				if(usuario.getUsuario().equals(user) && usuario.getPassword().equals(passwordEncrypt)) {
					url = "/View/usuario/usuario.jsp";
					break;
				}else {
					url = "/View/Login/login.jsp";
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		validacionUser(request, response);
	}

}
