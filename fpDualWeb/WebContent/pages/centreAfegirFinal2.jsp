<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<%	
 	CentreDAO cdao = new CentreDAO();
 	String n= request.getParameter("val");
 	
 	int resultat = cdao.consultarRegID(n);

 	
 	if(resultat == 1){
 		out.println(resultat);
 		//out.println("AQUESTA ID - NOO ESTA DISPONIBLE");
 		
 		
 	}
 	if(resultat == 0){
 		
 		out.println(resultat);
 		//out.println("AQUESTA ID - SII ESTA DISPONIBLE");

		
 	}
 	
   	
%>
