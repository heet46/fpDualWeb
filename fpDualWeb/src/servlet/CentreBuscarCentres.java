package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet("/CentreBuscarCentres")
public class CentreBuscarCentres extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ResultSet rs;
	CentreDAO cdao = new CentreDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CentreBuscarCentres() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ResultSet rs;
		CentreDAO cdao = new CentreDAO();
		String idCentre = request.getParameter("val");
		String nomCentre = request.getParameter("pn");
		String codiCentre = request.getParameter("pc");
		String telCentre = request.getParameter("pt");
		String webCentre = request.getParameter("pe");

		int idIntCentre;
		int cCentre = 0;
		int telefonCentre = 0;
		int contador = 0;

		String ConsultaSQL = "SELECT * FROM centre WHERE";

		if (request.getParameter("idcentre") == null || request.getParameter("idcentre") == "") {
			System.out.println("idcentre null: " + request.getParameter("idcentre"));
		} else {
			idCentre = (String) request.getParameter("idcentre");
			idIntCentre = Integer.parseInt(idCentre);
			ConsultaSQL += " Id_centre LIKE " + idIntCentre;
		}

		if (request.getParameter("nom") == null || request.getParameter("nom") == "") {
			System.out.println("nom null");
		} else {
			nomCentre = (String) request.getParameter("nom");

			if (contador == 0) {
				ConsultaSQL += " Nom LIKE " + nomCentre;
			} else {
				ConsultaSQL += " AND Nom LIKE " + nomCentre;
			}
			contador++;
		}

		if (request.getParameter("Codi") == null || request.getParameter("Codi") == "") {
			System.out.println("codi null");
		} else {
			codiCentre = (String) request.getParameter("Codi");
			cCentre = Integer.parseInt(codiCentre);
			if (contador == 0) {
				ConsultaSQL += " Codi LIKE " + cCentre;
			} else {
				ConsultaSQL += " AND Codi LIKE " + cCentre;
			}
			contador++;
		}

		if (request.getParameter("Telefon") == null || request.getParameter("Telefon") == "") {
			System.out.println("telefon null");
		} else {
			telCentre = (String) request.getParameter("Telefon");
			telefonCentre = Integer.parseInt(telCentre);
			if (contador == 0) {
				ConsultaSQL += " Telefon LIKE " + telefonCentre;
			} else {
				ConsultaSQL += " AND Telefon LIKE " + telefonCentre;
			}
			contador++;
		}

		if (request.getParameter("web") == null || request.getParameter("web") == "") {
			System.out.println("web null");
		} else {
			webCentre = (String) request.getParameter("web");
			if (contador == 0) {
				ConsultaSQL += " Web LIKE " + webCentre;
			} else {
				ConsultaSQL += " AND Web LIKE " + webCentre;
			}
			contador++;
		}

		// Asignación a la respuesta html que va a generarse, del tipo MIME
		response.setContentType("text/html");

		// Obtenición del objeto que escribe la respuesta. Pertenece a java.io

		// Generación de la respuesta html
		out.println("<html>");

		System.out.println("consulta -> " + ConsultaSQL);

		if (contador == 0) {
			System.out.println("No hi ha dades per fer la consulta.");
		} else {
			rs = cdao.realitzaConsulta(ConsultaSQL);
			out.println("<div class='row col-lg-12 col-md-12'>");
			out.println("<table id='myTable' class='table table-striped  table-hover' >");
			out.println("<thead>");
			out.println("<tr>");
			out.println("<th ><b>ID<b/></th>");
			out.println("<th ><b>Nom<b/></th>");
			out.println("<th ><b>Codi<b/></th>");
			out.println("<th ><b>Telefon<b/></th>");
			out.println("<th ><b>Web<b/></th>");
			out.println("</tr>");
			out.println("</thead>");

			try {
				while (rs.next()) {
					out.println("<tr>");
					for (int i = 1; i <= 5; i++) {
						if (i > 1)
							out.print(" \t\t");
						String columnValue = rs.getString(i);
						out.println("<td>" + columnValue + "</td>");
					}
					out.println("</tr>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			}
			;
			out.println("</table>");
			out.println("<div/>");
		}

	}

}
