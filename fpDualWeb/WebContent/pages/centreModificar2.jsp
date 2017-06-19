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
    
    <!-- Variables Globals -->
<%!
	int idCentreOk = 1,
	idNomOk = 0,
	idCodiCentreOk = 0,
	idTelefonOk = 0,
	idPagWebOk = 0,
	cosultaOK = 0,
	resultatBuscar = 0,
	resulte = 0,
	intbuscar = 666;
%>

<!-- Scripts de Control d'entrada de dades -->
    <script>

		function valida(e){ // Funcion que delimita los caracteres que entremos a unicamente Enteros.
		    tecla = (document.all) ? e.keyCode : e.which;
		    //Tecla de retroceso para borrar, siempre la permite
		    if (tecla==8){
		        return true;
		    }
		    // Patron de entrada, en este caso solo acepta numeros
		    patron =/[0-9]/;
		    tecla_final = String.fromCharCode(tecla);
		    return patron.test(tecla_final);
		}
		
		

	</script>
	
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
   	String nomCentreActual= "";
   	
   	try { 
   		while (rs.next()) { 
   			out.println("<tr>");
   			for (int i = 1; i <= 5; i++) { 
   				if (i > 1) out.print(" \t\t"); 
   				String columnValue = rs.getString(i); 
   				if(i==1){
   					idCentreActual = rs.getString(i);
   					nomCentreActual = rs.getString(i+1);
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

<form action="../CentreFormulariModificar" method="post">

  <p>
  <table border="0" class="tablaAgregar">

      <tr>
        <td><br>
          Nom del Centre:
        </td>
        <td><br>
            <input type="text" name="nomCentre" id="idNomCentre" maxlength="30" value="" onblur="validarNom()"/><span><font color="silver"> *</font></span><span id="comprovaNom"> </span>
	<script>      
       function validarNom() {
    	   //boolean correcte = 0;
    	   //int cosultaOK = 0;
			if ($('#idNomCentre').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaNom").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaNom").style.color="red";
				document.getElementById("idNomCentre").style.borderColor="red";
				document.getElementById("idNomCentre").focus();
				idNomOk = 0;
    	     	return false;
    	   	}
			if (($('#idNomCentre').val().length >= 1) && ($('#idNomCentre').val().length <= 3)) {
    	    	document.getElementById("comprovaNom").innerHTML = "<b>El nom a de tenir 4 o mes caracters.</b>";
				document.getElementById("comprovaNom").style.color="red";
				document.getElementById("idNomCentre").style.borderColor="red";
				document.getElementById("idNomCentre").focus();
				idNomOk = 0;
			}
			if ($('#idNomCentre').val().length >= 4) {
    	    	document.getElementById("comprovaNom").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaNom").style.color="green";
				document.getElementById("idNomCentre").style.borderColor="green";
				idNomOk = 1;
			}
    	 }
       </script>
	<td>
          <input type="hidden" name="idcentreinvi" value="<%=idCentreActual %>"/>
          </td>
	
        </td>
      </tr>
      <tr>
        <td>
          Codi del Centre:
          </td>
          <td>
            <input type="text" name="codiCentre" id="idCodiDelCentre" value=""  maxlength="5" onkeypress="return valida(event)" onblur="validarCodiCentre()"/><span><font color="silver"> *</font></span><span id="comprovaCodiCentre"> </span>
            
            <script>      
       function validarCodiCentre() {
    	   //boolean correcte = 0;
    	   //int cosultaOK = 0;
			if ($('#idCodiDelCentre').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaCodiCentre").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaCodiCentre").style.color="red";
				document.getElementById("idCodiDelCentre").style.borderColor="red";
				document.getElementById("idCodiDelCentre").focus();
				idCodiCentreOk = 0;
    	     	return false;
    	   	}
			if ($('#idCodiDelCentre').val().length >= 1) {
    	    	document.getElementById("comprovaCodiCentre").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaCodiCentre").style.color="green";
				document.getElementById("idCodiDelCentre").style.borderColor="green";
				idCodiCentreOk = 1;
			}
    	 }
       </script>
       
        </td>
      </tr>
      <tr>
        <td>
          Telefon:
          </td>
          
          <td>
            <input type="text" name="Telefon" id="idTelefon" value=""  maxlength="9" onkeypress="return valida(event)" onblur="validarTelefon()"/><span><font color="silver"> *</font></span><span id="comprovaTelefon"> </span>
             <script>      
       function validarTelefon() {
    	   //boolean correcte = 0;
    	   //int cosultaOK = 0;
			if ($('#idTelefon').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaTelefon").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaTelefon").style.color="red";
				document.getElementById("idTelefon").style.borderColor="red";
				document.getElementById("idTelefon").focus();
				idTelefonOk = 0;
    	     	return false;
    	   	}
			if ($('#idTelefon').val().length >= 1 && $('#idTelefon').val().length <= 8) {
				document.getElementById("comprovaTelefon").innerHTML = "<b>El numero de telefon es de 9 xifres.</b>";
				document.getElementById("comprovaTelefon").style.color="red";
				document.getElementById("idTelefon").style.borderColor="red";
				document.getElementById("idTelefon").focus();
				idTelefonOk = 0;
			}
			if ($('#idTelefon').val().length == 9) {
    	    	document.getElementById("comprovaTelefon").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaTelefon").style.color="green";
				document.getElementById("idTelefon").style.borderColor="green";
				idTelefonOk = 1;
			}
    	 }
       </script>
        </td>
      </tr>
      <tr>
        <td>
        
          Pagina Web:
          <br/>
          </td>
          <td>

            <input type="text" name="pagWeb" id="idPagWeb" maxlength="30" value="" onblur="validarURL(this.idPagWeb)"/><span><font color="silver"> *</font></span><span id="comprovaUrl"> </span>
             
  	<script>   
	    function validarURL() {
	    	var Url = document.getElementById("idPagWeb").value;
	    	if ($('#idPagWeb').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaUrl").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaUrl").style.color="red";
				document.getElementById("idPagWeb").style.borderColor="red";
				document.getElementById("idPagWeb").focus();
				idPagWebOk = 0;
    	     	return false;
    	   	}else{
		    	if(is_url(Url)){
		    		document.getElementById("comprovaUrl").innerHTML = "<b>Correcte.</b>";
					document.getElementById("comprovaUrl").style.color="green";
					document.getElementById("idPagWeb").style.borderColor="green";
					idPagWebOk = 1;
		    	}else{
		    		document.getElementById("comprovaUrl").innerHTML = "<b>La URL no es correcta! ha de començar per ftp, http, https..</b>";
		    		
					document.getElementById("comprovaUrl").style.color="red";
					document.getElementById("idPagWeb").style.borderColor="red";
					document.getElementById("idPagWeb").focus();
					idPagWebOk = 0;
		    	}
    	   	}
	    }
	    
	    
	    function is_url(str) {
	        //Declaramos la expresión regular que se usará para validar la url pasada por parámetro
	        var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
	        //Retorna true en caso de que la url sea valida o false en caso contrario
	        return regexp.test(str);
	     }
    </script> 
            <br/><span><font color="silver">Tens que indicar el protocol ftp://, http://, https://</font></span>
        </td>
      </tr>
      
    </table>
       <span><font color="silver">* Obligatori</font></span>
    <br><br>
 
    <table border="0">
      <tr>
        <td>
          <input type="submit" value="Guardar" class="btn btn-success"/>
          </td>
          <td>
            <input type="reset" value="Netejar" class="btn btn-danger"/>
        </td>
      </tr>
    </table>
    </p>
</form>
</html>