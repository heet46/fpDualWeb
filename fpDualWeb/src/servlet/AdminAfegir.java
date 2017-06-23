package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class AdminAfegir
 */
@WebServlet("/AdminAfegir")
public class AdminAfegir extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAfegir() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsuariDAO uDAO = new UsuariDAO();
		Usuari u = new Usuari();
		int existeix = 0;
		String NIF = (String) request.getParameter("NIF");
		String pass = (String) request.getParameter("pass");
		String nom = (String) request.getParameter("nom");
		String pCog = (String) request.getParameter("Pcognom");
		String sCog = (String) request.getParameter("Scognom");
		String mail = (String) request.getParameter("mail");

		try {
			uDAO.altaUsuari(new Usuari(NIF, pass, nom, pCog, sCog, mail, 2));
		} catch (SQLException e) {
			existeix = 1;
			request.getSession().setAttribute("NIF2", NIF);
			request.getSession().setAttribute("pass2", pass);
			request.getSession().setAttribute("nom2", nom);
			request.getSession().setAttribute("Pcognom2", pCog);
			request.getSession().setAttribute("Scognom2", sCog);
			request.getSession().setAttribute("mail2", mail);
		}

		if (existeix == 1) {
			request.getSession().setAttribute("existeix", existeix);
			response.sendRedirect("/fpDualWeb/pages/administradorAlta.jsp");
		} else {
			request.getSession().setAttribute("existeix", existeix);
			response.sendRedirect("/fpDualWeb/pages/administradorConsulta.jsp");
		}
	}

}
