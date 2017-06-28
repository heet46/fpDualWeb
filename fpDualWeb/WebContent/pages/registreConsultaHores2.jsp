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
			System.out.println("alumne: " + alumne);
		}
	    if(request.getParameter("va1") != null && request.getParameter("va1") != ""){
	    	activitat = request.getParameter("va1");
			System.out.println("activitat: " + activitat);
		}
	    if(request.getParameter("va2") != null && request.getParameter("va2") != ""){
	    	data = request.getParameter("va2");
			System.out.println("data: " + data);
		}
	    if(request.getParameter("va3") != null && request.getParameter("va3") != ""){
	    	hores = request.getParameter("va3");
			System.out.println("data: " + hores);
		}
		outt.println("<div class='row col-lg-12 col-md-12'>");
		outt.println("<table id='myTable' class='table table-striped  table-hover' >");
		outt.println("<thead>");
		outt.println("<tr>");
		outt.println("<th ><b>Activitat<b/></th>");
		outt.println("<th ><b>Alumne<b/></th>");
		outt.println("<th ><b>Data<b/></th>");
		outt.println("<th ><b>Hores<b/></th>");
		outt.println("<th ><b><b/></th>");
		outt.println("</tr>");
		outt.println("</thead>");
		int contador = 0;
		String ConsultaSQL = null;
		String nAlumne = "";
		String nActivitat = "";
		if (alumne == null || alumne == "") {
		} else { 
			rs = rdao.codiIdAlumne(alumne);
			while (rs.next()) { 
				nAlumne = rs.getString(1); 
				System.out.println("nAlumne -> " + nAlumne);
     		}
			System.out.println("nAlumne -> " + nAlumne);
			ConsultaSQL = " id_alumne LIKE '%" + nAlumne + "%'";
			contador = 1;
		}
		

		if (activitat == null || activitat == "") {
		} else { 
			rs = rdao.codiIdActivitat(activitat);
			while (rs.next()) { 
				nActivitat = rs.getString(1); 
				System.out.println("nActivitat -> " + nActivitat);
     		}
			
			if (contador == 0) { ConsultaSQL = " id_activitat LIKE '%" + nActivitat + "%'";
			} else { ConsultaSQL += " AND id_activitat LIKE '%" + activitat + "%'"; } contador = 1;
		}
		
		
		
		
		
		
		if (data == null || data == "") {
		} else { 
			
			if (contador == 0) { ConsultaSQL = " data LIKE '%" + data + "%'";
			} else { ConsultaSQL += " AND data LIKE '%" + data + "%'";}			
		contador = 1;
		}
		response.setContentType("text/html");
		System.out.println("consulta -> " + ConsultaSQL);
		if (contador == 0) {
			System.out.println("No hi ha dades per fer la consulta.");
		} else {
			rs = rdao.consultarHores(ConsultaSQL);
			String nid = "";
			while (rs.next()) {
				outt.println("<tr>");
				for (int i = 1; i <= 4; i++) {
					String columnValue = rs.getString(i);
					if(i == 1){
						nid = rs.getString(i);
					}
					outt.println("<td>" + columnValue + "</td>");
				} 
			outt.println("</tr>");
			}
		}	
	%>
	</table>		
<div/>

