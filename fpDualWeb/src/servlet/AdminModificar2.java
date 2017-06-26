package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Administrador;
import model.AdministradorDAO;
import model.CentreDAO;

/**
 * Servlet implementation class modificarTutors2
 */
@WebServlet("/AdminModificar2")
public class AdminModificar2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminModificar2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AdministradorDAO uDAO = null;
		try {
			uDAO = new AdministradorDAO();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		CentreDAO cDAO = new CentreDAO();
		String idVella = (String) request.getParameter("IdVella");
		Administrador u = new Administrador();
		u.setNIF(request.getParameter("NIF"));
		u.setPasswd(request.getParameter("pass"));
		u.setNom(request.getParameter("nom"));
		u.setCognom1(request.getParameter("Pcognom"));
		u.setCognom2(request.getParameter("Scognom"));
		u.setMail(request.getParameter("mail"));
		try {
			uDAO.modificarAdmin(idVella, u);
		} catch (SQLException e) {
			// TODO Auto-generated catch blocks
			e.printStackTrace();
		}

		doGet(request, response);
		response.sendRedirect("pages/administradorConsultar.jsp");
	}

}
