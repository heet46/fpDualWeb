<%@page import="java.util.StringTokenizer"%>
<%@page import="model.CentreDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<span id="resEliminar"></span>
	
	<%
		response.setContentType("text/html");
		ResultSet rs;
		PrintWriter outt = response.getWriter();
		CentreDAO cdao = new CentreDAO();
		String idCentre = "";
		String nomCentre = "";
		String codiCentre = "";
		String telCentre = "";
		String webCentre = "";

	    if(request.getParameter("val") != null && request.getParameter("val") != ""){
	    	idCentre = request.getParameter("val");
			 System.out.println("cent: " + idCentre);
		}
	    if(request.getParameter("va1") != null && request.getParameter("va1") != ""){
	    	nomCentre = request.getParameter("va1");
			 System.out.println("nomcent: " + nomCentre);
		}
	    if(request.getParameter("va2") != null && request.getParameter("va2") != ""){
	    	codiCentre = request.getParameter("va2");
			 System.out.println("CCent: " + codiCentre);
		}
	    if(request.getParameter("va3") != null && request.getParameter("va3") != ""){
	    	telCentre = request.getParameter("va3");
			 System.out.println("telcent: " + telCentre);
		}
	    if(request.getParameter("va4") != null && request.getParameter("va4") != ""){
	    	webCentre = request.getParameter("va4");
			 System.out.println("webcent: " + webCentre  );
		}
		outt.println("<div class='row col-lg-12 col-md-12'>");
		outt.println("<table id='myTable' class='table table-striped  table-hover' >");
		outt.println("<thead>");
		outt.println("<tr>");
		outt.println("<th ><b>ID<b/></th>");
		outt.println("<th ><b>Nom<b/></th>");
		outt.println("<th ><b>Codi<b/></th>");
		outt.println("<th ><b>Telefon<b/></th>");
		outt.println("<th ><b>Web<b/></th>");
		outt.println("</tr>");
		outt.println("</thead>");

		int idIntCentre;
		int cCentre = 0;
		int telefonCentre = 0;
		int contador = 0;

		String ConsultaSQL = "SELECT * FROM centre WHERE";

		if (idCentre == null || idCentre == "") {
		} else {
			idIntCentre = Integer.parseInt(idCentre);
			ConsultaSQL += " Id_centre LIKE " + idIntCentre;
			contador = 1;
		}

		if (nomCentre == null || nomCentre == "") {
		} else {
			
			if (contador == 0) {
				ConsultaSQL += " Nom LIKE '%" + nomCentre + "%'";
			} else {
				ConsultaSQL += " AND Nom LIKE '%" + nomCentre + "%'";
			}
			contador = 1;
		}

		if (codiCentre == null || codiCentre == "") {
		} else {
			cCentre = Integer.parseInt(codiCentre);
			if (contador == 0) {
				ConsultaSQL += " Codi LIKE '%" + cCentre + "%'";
			} else {
				ConsultaSQL += " AND Codi LIKE '%" + cCentre + "%'";
			}
			contador = 1;
		}

		if (telCentre == null || telCentre == "") {
		} else {
			telefonCentre = Integer.parseInt(telCentre);
			if (contador == 0) {
				ConsultaSQL += " Telefon LIKE '%" + telefonCentre + "%'";
			} else {
				ConsultaSQL += " AND Telefon LIKE '%" + telefonCentre + "%'";
			}
			contador = 1;
		}

		if (webCentre == null || webCentre == "") {
			
		} else {
			if (contador == 0) {
				ConsultaSQL += " Web LIKE '%" + webCentre + "%'";
			} else {
				ConsultaSQL += " AND Web LIKE '%" + webCentre + "%'";
			}
			contador = 1;
		}
		
		ConsultaSQL += ";";

		// Asignación a la respuesta html que va a generarse, del tipo MIME
		response.setContentType("text/html");

		// Obtenición del objeto que escribe la respuesta. Pertenece a java.io

		// Generación de la respuesta html

		System.out.println("consulta -> " + ConsultaSQL);

		if (contador == 0) {
			System.out.println("No hi ha dades per fer la consulta.");
		} else {
			rs = cdao.realitzaConsulta(ConsultaSQL);
			

			try {
				while (rs.next()) {
					outt.println("<tr>");
					for (int i = 1; i <= 5; i++) {
						if (i > 1)
							out.print(" \t\t");
						String columnValue = rs.getString(i);
						
						outt.println("<td>" + columnValue + "</td>");
					}
					outt.println("</tr>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			}
			;
		}
	%>
	</table>
<div/>

