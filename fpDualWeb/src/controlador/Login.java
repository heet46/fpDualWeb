package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Usuari;
import model.UsuariDAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Login() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni = request.getParameter("dni");
		String password = request.getParameter("password");
		System.out.println(dni+password);
		//response.sendRedirect("index.html");

		Usuari usuariTmp = new Usuari();
		usuariTmp.setNIF(dni);
		usuariTmp.setPasswd(password);
		
		UsuariDAO uDAO = new UsuariDAO();
		
		PrintWriter out = response.getWriter();

		List<String> llista = uDAO.validarLogin(usuariTmp);
		
		System.out.println(llista.toString());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
