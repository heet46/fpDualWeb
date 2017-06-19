package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CentreDAO;

/**
 * Servlet implementation class CentreFormulariAfegir
 */
@WebServlet("/CentreFormulariEliminar")
public class CentreFormulariEliminar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CentreDAO cDAO = new CentreDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CentreFormulariEliminar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Captura de parametros
		response.sendRedirect("pages/centreEliminar.jsp");

		String idCentre = (String) request.getParameter("idcentreinvi");

		// Asignación a la respuesta html que va a generarse, del tipo MIME
		response.setContentType("text/html");

		// Obtenición del objeto que escribe la respuesta. Pertenece a java.io
		PrintWriter out = response.getWriter();

		try {
			cDAO.donarBaixa(idCentre);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		out.println("</body>");
		out.println("</html>");
	}

}
