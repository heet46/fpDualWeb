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
		UsuariDAO uDAO = new UsuariDAO();
		String idVella = request.getParameter("IdVella");
		System.out.println(idVella);
		try {
			uDAO.modificarUsuari(idVella,
					new Usuari(request.getParameter("NIF"), request.getParameter("pass"), request.getParameter("nom"),
							request.getParameter("Pcognom"), request.getParameter("Scognom"),
							request.getParameter("mail"), 4));
			// tDAO.modificarTutor(new
			// Tutor(uDAO.consultaID(request.getParameter("NIF")),
			// request.getParameter("tecno")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
		response.sendRedirect("pages/administradorConsultar.jsp");
	}

}
