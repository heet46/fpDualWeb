<%@page import="model.RegistreDAO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.CentreDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%
		response.setContentType("text/html");
		ResultSet rs;
		PrintWriter outt = response.getWriter();
		RegistreDAO rdao = new RegistreDAO();
		String alumne = "";
		String activitat = "";
		String data = "";
		String hores = "";
	    if(request.getParameter("val") != null && request.getParameter("val") != ""){
	    	alumne = request.getParameter("val");
		}
	    if(request.getParameter("va1") != null && request.getParameter("va1") != ""){
	    	activitat = request.getParameter("va1");
		}
	    if(request.getParameter("va2") != null && request.getParameter("va2") != ""){
	    	data = request.getParameter("va2");
		}
	    if(request.getParameter("va3") != null && request.getParameter("va3") != ""){
	    	hores = request.getParameter("va3");
		}
	    
	    
	    
		outt.println("<div id='divtable' class='row col-lg-12 col-md-12'>");
		outt.println("<table id='myTable' class='table table-striped  table-hover' >");
		outt.println("<thead>");
		outt.println("<tr>");
		outt.println("<th ><b>Activitat<b/></th>");
		outt.println("<th ><b>Alumne<b/></th>");
		outt.println("<th ><b>Data<b/></th>");
		outt.println("<th ><b>Hores<b/></th>");
		outt.println("</tr>");
		outt.println("</thead>");
		int contador = 0;
		String ConsultaSQL = null;
		String Consulta2SQL = null;
		String nAlumne = "";
		String nActivitat = "";
		if (alumne == null || alumne == "") {
		} else { 
			rs = rdao.codiIdAlumne(alumne);
			while (rs.next()) { 
				nAlumne = rs.getString(1); 
     		}
			ConsultaSQL = " id_alumne LIKE '%" + nAlumne + "%'";
			contador = 1;
		}
		if (activitat == null || activitat == "") {
		} else { 
			rs = rdao.codiIdActivitat(activitat);
			while (rs.next()) { 
				nActivitat = rs.getString(1); 
     		}
			
			if (contador == 0) { ConsultaSQL = " id_activitat LIKE '" + nActivitat + "'" ;
			} else { ConsultaSQL += " AND id_activitat LIKE '%" + nActivitat + "%'" ; } contador = 1;
		}

		if (data == null || data == "") {
		} else { 
			
			if (contador == 0) { ConsultaSQL = " data LIKE '%" + data + "%'";
			} else { ConsultaSQL += " AND data LIKE '%" + data + "%'";}			
		contador = 1;
		}
		response.setContentType("text/html");
		if (contador == 0) {
			System.out.println("No hi ha dades per fer la consulta.");
		} else {
			rs = rdao.consultarHores(ConsultaSQL);
			String nid = "";
			ResultSet r2s = null;
			String colr1 = "";
			String colr2 = "";
			while (rs.next()) { 
				outt.println("<tr>");

					//String columnValue = rs.getString(i);
					String col1 = rs.getString(1);
					String col2 = rs.getString(2);
					String col3 = rs.getString(3);
					
					r2s = rdao.nomIdActivitat(col1);
					
					while (r2s.next()) { 
						colr1 = r2s.getString(1);
					}
					
					r2s = rdao.nomIdAlumne(col2);
					
					while (r2s.next()) { 
						colr2 = r2s.getString(1);
					}
					
					String col4 = rs.getString(4);
					outt.println("<td>" + colr1 + "</td>");
					outt.println("<td>" + colr2 + "</td>");
					outt.println("<td>" + col3 + "</td>");
					outt.println("<td>" + col4 + "</td>");
					
				 outt.println("</tr>");
			}
		}
		outt.println("</table>");	
		outt.println("<div/>");
	%>


