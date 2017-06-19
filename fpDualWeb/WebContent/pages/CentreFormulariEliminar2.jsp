<%@page import="java.sql.SQLException"%>
<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%	ResultSet rs;
 	CentreDAO cdao = new CentreDAO();
 	String n= request.getParameter("val");
 	rs = cdao.consultaTotId(n);
	out.println("Dades Actuals Del centre");
   	out.println("<table class='table table-striped  table-hover' >");
   	out.println("<tr>");
   	out.println("<td ><b>ID<b/></td>");
   	out.println("<td ><b>Nom<b/></td>");
   	out.println("<td ><b>Codi<b/></td>");
   	out.println("<td ><b>Telefon<b/></td>");
   	out.println("<td ><b>Web<b/></td>");
   	out.println("</tr>");
   	
   	String idCentreActual = "";

   	
try { 
   		while (rs.next()) { 
   			out.println("<tr>");
   			for (int i = 1; i <= 5; i++) { 
   				if (i > 1) out.print(" \t\t"); 
   				String columnValue = rs.getString(i); 
   				if(i==1){
   					idCentreActual = rs.getString(i);
   				}
   				out.println("<td>" + columnValue + "</td>");
   			} 
   			out.println("</tr>");
   		}	
   	} catch (SQLException e) { 
   		  e.printStackTrace(); 
   	}finally{};
   	out.println("</table>");
   	out.println("<div/>");
   	//out.println("ID = "+idCentreActual+" . Centre = "+nomCentreActual);
%>

<form action="../CentreFormulariEliminar" method="post">

  <p>
		<input type="hidden" name="idcentreinvi" value="<%=idCentreActual %>"/>
		
       <span><b>Segur que vols eliminar el centre seleccionat?</b></span>
       <br>
		
   </p>
   
   <input type="submit" value="Eliminar" class="btn btn-danger"/>
   
</form>
</html>