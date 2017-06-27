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
@WebServlet("/CentreFormulariModificarRespon2")
public class CentreFormulariModificarRespon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CentreDAO cDAO = new CentreDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CentreFormulariModificarRespon2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Captura de parametros
		response.sendRedirect("pages/centreConsultaResponsable.jsp");

		String idCentre = (String) request.getParameter("idcentreinvi");
		String nomCentre = (String) request.getParameter("nomCentre");
		String codiCentre = (String) request.getParameter("codiCentre");
		String telCentre = (String) request.getParameter("Telefon");
		String webCentre = (String) request.getParameter("pagWeb");

		int cCentre = Integer.parseInt(codiCentre);
		int telefonCentre = Integer.parseInt(telCentre);

		// Asignación a la respuesta html que va a generarse, del tipo MIME
		response.setContentType("text/html");

		// Obtenición del objeto que escribe la respuesta. Pertenece a java.io
		PrintWriter out = response.getWriter();
		int idIntCentre = Integer.parseInt(idCentre);
		try {
			cDAO.modificarCentrePerID(idIntCentre, nomCentre, cCentre, telefonCentre, webCentre);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Generación de la respuesta html
		out.println("<html>");
		out.println("<head><title>Dades introduides a la BDD</title></head>");
		out.println("<body>");
		out.println("<h1>Dades Afegides a la base de dades:</h1>");

		out.println("<b>Nom:</b></td><td><i>" + nomCentre + "</i><br/>");
		out.println("<b>Codi Centre:</b></td><td><i>" + cCentre + "</i><br/>");
		out.println("<b>Telefon:</b></td><td><i>" + telCentre + "</i><br/>");
		out.println("<b>Web:</b></td><td><i>" + webCentre + "</i><br/>");
		out.println("alert('canvis fets')");
		out.println("</body>");
		out.println("</html>");

		System.out.println(idCentre + " - " + nomCentre + " - " + codiCentre + " - " + telCentre + " - " + webCentre);
	}

}
