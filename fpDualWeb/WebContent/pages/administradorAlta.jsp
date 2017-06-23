<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
		
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
	if(sesion.getAttribute("nif") == null){	
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	String usuNif = sesion.getAttribute("nif").toString();
	String usuNom = sesion.getAttribute("nomComplet").toString();
	String usuCognom = sesion.getAttribute("cognom1Login").toString();
	String usuMail = sesion.getAttribute("mailLogin").toString();
	
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
                <li>
                    <a href="alumnes.jsp"><i class="fa fa-graduation-cap "></i>Alumnes</a>
                </li>
                <li>
                    <a href="tutors.jsp"><i class="fa fa-book"></i>Tutors</a>
                </li>

                <li>
                    <a href="centre.jsp"><i class="fa fa-university "></i>Centres </a>
                </li>
                <li>
                    <a href="activitats.jsp"><i class="fa fa-list "></i>Activitats</a>
                </li>
                <li class="active-link">
				    <a href="administrador.jsp"><i class="fa fa-university "></i>Administrador </a>
				</li>
				<li>
                	<a href="responsables.jsp"><i class="fa fa-street-view"></i>Responsables</a>
                </li>
              </ul>
          </div>

        </nav>
       <div id="page-wrapper" >
            <div id="page-inner">
                
                <div class="row">
                    <div class="col-md-12">
                    <a title="Manteniment Administradors" href="../pages/administrador.jsp">
                    	<img border='0' src='../assets/img/BackArrow.ico' style='position:fixed; head:0; right:0;' width="50" height="50" />
                    </a>
                     <h2>Afegir Administrador</h2>
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <%
				  	int existeix=0;
				  	try{
					  	existeix=Integer.parseInt(session.getAttribute("existeix").toString());
				  	}catch(Exception e){
				  		existeix=0;  
					}
					  if(existeix==1){
				%>
					    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
					    <script src="../assets/js/bootstrap.min.js"></script>
				<script src="../assets/js/bootbox.min.js"></script>
				<script type="text/javascript">		        
					bootbox.alert("Error, aquest Administrador ja està creat", function() {
					console.log("Alert Callback");
					})
				</script>
				<%
					String NIF2=session.getAttribute("NIF2").toString();
					String pass2=session.getAttribute("pass2").toString();
					String nom2=session.getAttribute("nom2").toString();
					String Pcognom=session.getAttribute("Pcognom2").toString();
					String Scognom=session.getAttribute("Scognom2").toString();
					String mail=session.getAttribute("mail2").toString();
				%>
				<%}else{ %>
				<%
					session.setAttribute("NIF2","");
					session.setAttribute("pass2","");
					session.setAttribute("nom2","");
					session.setAttribute("Pcognom2","");
					session.setAttribute("Scognom2","");
					session.setAttribute("mail2","");
				%>
				<%} %>
                  <hr />
                 <!-- /. ROW  --> 
<div class="row text-center pad-top">
                                <form method="post" name="Form" onsubmit="return validateForm()" action="/fpDualWeb/afegirTutors">
                                
                                    <table>
                                        <tr>
                                            <td>NIF: </td>
                                            <td><input type="text" class="form-control" value="${NIF2}" name="NIF" size="25" maxlength="9" onblur="nif(this.value)" required/></td>
                                        </tr>
                                        <%
                                        	UsuariDAO uDAO=new UsuariDAO();
                                        	String NIF=request.getParameter("NIF");
                                        	if(uDAO.compararNIF(NIF)){
                                        		request.setAttribute("NIF", "");
                                        	}
                                        %>
                                        <tr>
                                            <td>Password: </td>
                                            <td><input type="password" class="form-control" name="pass" value="${pass2}" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Nom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="nom" value="${nom2}" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Primer cognom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="Pcognom" value="${Pcognom2}"  size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Segon cognom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="Scognom" value="${Scognom2}" size="25"/></td>
                                        </tr>
                                        <tr>
                                            <td>Mail: </td>
                                            <td><input type="email" class="form-control" name="mail" value="${mail2}" size="25" required/></td>
                                        </tr>
                                        
                                        <tr>
                                            <td><br></td>
                                        </tr>
                                        <tr>
                                            <th><input type="submit" value="Afegir" class="btn btn-primary"/></th>
                                            <th><input type="reset" value="Reset" class="btn btn-danger"/></th>
                                        </tr>
                                    </table>
                                </form>
 
                  </div>
                                    
              </div>
					












<!-- /. ROW  -->
<hr />
<!-- /. ROW  -->  
</div>
 <!-- /. PAGE INNER  -->
</div>
<br><br>
         <!-- /. PAGE WRAPPER  -->
</div>
 <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
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