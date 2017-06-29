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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
	<!-- Scripts de Control de entrada de datos -->
    <script>
		function habilitar(value){ //Funcion que comprueba cual radius es marcado para anular o no el input.
			if(value=="1")
			{
				// habilitamos
				document.getElementById("iddelcentre").disabled=false;
			}else if(value=="2"){
				// deshabilitamos
				document.getElementById("iddelcentre").disabled=true;
			}
		}

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
	 <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>

	<!-- BOOTSTRAP STYLES-->

     <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />

        <!-- CUSTOM STYLES-->
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../assets/css/custom.css" rel="stylesheet" />
    <link href="../assets/css/tutors.css" rel="stylesheet" />

     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

             <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
    <script src="assets/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
    		setTimeout(function() {
        	$(".content").fadeOut(1500);
    		},1500);
		});
	</script>
</head>
<body>


<!-- Permetre acces nomes si hi ha una sessio -->
<%
	HttpSession sesion=request.getSession(); 
	String nif;
	int permis=0;
	if(sesion.getAttribute("nif") == null){	
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	String usuNif = sesion.getAttribute("nif").toString();
	String usuNom = sesion.getAttribute("nomComplet").toString();
	String usuCognom = sesion.getAttribute("cognom1Login").toString();
	String usuMail = sesion.getAttribute("mailLogin").toString();
	permis = Integer.parseInt(sesion.getAttribute("permis").toString());
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();			
		}
	}	
%>
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../index.jsp">
                        <img src="../assets/img/logo.png" height="50px" />
                    </a>
                </div>
                 <span class="logout-spn" >                
	                <form method="post" action="../Logout" name="logoutForm">
						<a href="javascript: submitform()" style="color:#fff;">LOGOUT</a>
					</form>
					<p><strong><%=usuNom %></strong> | <%=usuNif%></p>					
					<script type="text/javascript">
						function submitform(){
						  document.logoutForm.submit();
						}
					</script>
                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
       <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
              <ul class="nav" id="main-menu">
                <li >
                    <a href="../index.jsp" ><i class="fa fa-desktop "></i>Inici</a>
                </li>
				<%if(permis > 1){ %>
                <li>
                    <a href="alumnes.jsp"><i class="fa fa-graduation-cap "></i>Alumnes</a>
                </li>
                <%} %>
                <%if(permis > 1){ %>
                <li>
                    <a href="tutors.jsp"><i class="fa fa-book"></i>Tutors</a>
                </li>
				<%} %>
                <%if(permis > 1){ %>
                <li>
                    <a href="centre.jsp"><i class="fa fa-university "></i>Centres </a>
                </li>
                <%} %>
                <%if(permis >= 2){%>
                <li>
                    <a href="activitats.jsp"><i class="fa fa-list "></i>Activitats</a>
                </li>
                <%} %>
                <%if(permis == 1 || permis == 2){ %>
                <li>
                	<a href="registre.jsp"><i class="fa fa-clock-o"></i>Registre d'hores</a>
                </li>
                <%} %>
                <%if(permis == 4){ %>
                <li>
                    <a href="administrador.jsp"><i class="fa fa-user-o "></i>Administrador </a>
                </li>
                <%} %>
                <%if(permis > 1){ %>
                <li>
                	<a href="responsables.jsp"><i class="fa fa-street-view"></i>Responsables</a>
                </li>
                <%} %>
                <%if(permis == 1){ %>
                <li class="active-link">
                	<a href="dadesUsuari.jsp"><i class="fa fa-id-card"></i>Dades d'usuari</a>
                </li>
                <%} %>
              </ul>
          </div>

        </nav>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12" align="center">
                    <%if(permis == 1){ %>
                    	<a title="Manteniment Centres" href="dadesUsuari.jsp">
                    		<img border='0' src='../assets/img/BackArrow.ico' style='position:fixed; head:0; right:0;' width="50" height="50" />
                    	</a>
                    <%}else{ %>
	                    <a title="Manteniment Centres" href="../pages/centre.jsp">
                    		<img border='0' src='../assets/img/BackArrow.ico' style='position:fixed; head:0; right:0;' width="50" height="50" />
                    	</a>
              		<%} %>
                   
                    </div>
                </div>
                <h2><i class="fa fa-info-circle" aria-hidden="true"> </i> Informacio del teu Centre</h2>
                 <!-- /. ROW  -->
                  <hr />
                 <!-- /. ROW  --> 
				<br/>
				<p>
					<div class="panel panel-primary">
	                    <div class="panel-heading">
	                        Informacio del teu Centre
	                    </div>
                          <div class="panel-body">
		             	<div class='row col-lg-12 col-md-12'>
		             	<%
			             	String laIdcentre="";
		             		String nom="";
							String codi="";
							String telefon="";
							String web="";
			             	ResultSet rs;
			             	CentreDAO cdao = new CentreDAO();
			             	rs = cdao.centreAlumneperNIF(usuNif);
			             	try { 
			             		while (rs.next()) { 
		             				laIdcentre = rs.getString(1);
		             				nom = rs.getString(2);
									codi = rs.getString(3);
									telefon = rs.getString(4);
									web = rs.getString(5);
			             		}	
			             	} catch (SQLException e) { 
			             		  e.printStackTrace(); 
			             	}finally{};
						 %>
							<b>Nom: </b> <%=nom%> <br/>
							<b>Codi: </b> <%=codi%> <br/>
							<b>Telefon: </b> <%=telefon%> <br/>
							<b>Pagina Web: </b> <%=web%> <br/>
						</div>
                    </div>
                 <p/>  
                <!-- /. ROW  -->
                 <!-- /. ROW  -->  
                </div>
                 <!-- /. PAGE INNER  -->
                </div>
         <!-- /. PAGE WRAPPER  -->
            </div>
        </div>
    <div class="footer">
     <div class="row">
               <div class="col-lg-12" >
                    &copy;  2017 Indra Software Labs | Design by: Joan Espuñes, Sergi Fernández, Sisco Navarro, Thiago Hachikyan
                </div>
        	</div>
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../assets/js/custom.js"></script>
</body>
</html>