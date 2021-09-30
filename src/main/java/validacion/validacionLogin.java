package validacion;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuario = String.valueOf(request.getParameter("usuario")).trim();
		String password = String.valueOf(request.getParameter("password")).trim();

		String url = null;

		
		if (usuario.equals("admin") && password.equals("admin123")) {
			url = "/View/usuario/usuario.jsp";
		} else {
			url = "/View/Login/login.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
