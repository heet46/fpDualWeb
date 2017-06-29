<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
   
    <link href="assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="assets/css/custom.css" rel="stylesheet" />
    

     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="assets/img/favicon-clock-o.ico" />
   
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
	String nif=null;
	String usuNif=null;
	String usuNom=null;
	String usuCognom=null;
	String usuMail=null;
	int permis=0;
	try{
		if(sesion.getAttribute("nif") == null){	
			session.invalidate();
			response.sendRedirect("pages/login.jsp");
		}

		usuNif = sesion.getAttribute("nif").toString();
		usuNom = sesion.getAttribute("nomComplet").toString();
		usuCognom = sesion.getAttribute("cognom1Login").toString();
		usuMail = sesion.getAttribute("mailLogin").toString();
		permis = Integer.parseInt(sesion.getAttribute("permis").toString());
		
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();			
			}
		}
	}catch(Exception e){}
	finally{}
		
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
                    <a class="navbar-brand" href="index.jsp">
                        <img src="assets/img/logo.png" height="50px"/>
                    </a>
                </div> 
              
                <span class="logout-spn" >                
	                <form method="post" action="Logout" name="logoutForm">
						<a href="javascript: submitform()" style="color:#fff;">LOGOUT<br></a>
						
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
                 
                    <li class="active-link">
                        <a href="index.jsp" ><i class="fa fa-desktop "></i>Inici </a>
                    </li>
                    <%if(permis > 1){ %>
                    <li>
                        <a href="pages/alumnes.jsp"><i class="fa fa-graduation-cap "></i>Alumnes</a>
                    </li>
                    <%} %>
                    <%if(permis > 1){ %>
                    <li>
                        <a href="pages/tutors.jsp"><i class="fa fa-book"></i>Tutors</a>
                    </li>
					<%} %>
                    <%if(permis > 1){ %>
                    <li>
                        <a href="pages/centre.jsp"><i class="fa fa-university "></i>Centres </a>
                    </li>
                    <%} %>
                    <%if(permis >= 2){%>
                    <li>
                        <a href="pages/activitats.jsp"><i class="fa fa-list "></i>Activitats</a>
                    </li>
                    <%} %>
                    <li>
                    	<a href="pages/registre.jsp"><i class="fa fa-clock-o"></i>Registre d'hores</a>
                    </li>
                    <%if(permis == 4){ %>
                    <li>
                        <a href="pages/administrador.jsp"><i class="fa fa-user-o "></i>Administrador </a>
                    </li>
                    <%} %>
                    <%if(permis > 1){ %>
                    <li>
                    	<a href="pages/responsables.jsp"><i class="fa fa-street-view"></i>Responsables</a>
                    </li>
                    <%} %>
                    <%if(permis == 1){ %>
                    <li>
                    	<a href="pages/dadesUsuari.jsp"><i class="fa fa-id-card"></i>Dades d'usuari</a>
                    </li>
                    <%} %>
                </ul>
            </div>
            

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>Panell de control</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
              
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info content" id="alerta">
                             &nbsp;Benvingut <strong><%=usuNom%>! </strong>
                        </div>                     
                    </div>
                </div>


                  <!-- /. ROW  --> 
                  <div class="row text-center pad-top">
                  <%if(permis > 1){%>
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="pages/alumnes.jsp">
                        <i class="fa fa-graduation-cap fa-5x" aria-hidden="true"></i>
                        <h4>Alumnes</h4>
                      </a>
                      </div>
                  </div> 
                  <%} %>
                  <%if(permis > 1){%>
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="pages/tutors.jsp" >
                    <i class="fa fa-book fa-5x" aria-hidden="true"></i>
                      <h4>Tutors</h4>
                      </a>
                      </div>
                  </div>
                  <%} %>
                  <%if(permis > 1){%>
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="pages/centre.jsp" >
						<i class="fa fa-university fa-5x" aria-hidden="true"></i>
                      <h4>Centres</h4>
                      </a>
                      </div>
                  </div>
                  <%} %>
                  <%if(permis >= 2){%>
                  
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="pages/activitats.jsp" >
 						<i class="fa fa-list fa-5x"></i>
                      <h4>Activitats</h4>
                      </a>
                      </div>
                  </div>
                  <%} %> 
                  
                  <%if(permis == 1 || permis == 2 || permis==3){ %>
                  <%if(permis == 1){ %>
                  		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                  <%}else{ %>
						<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                  <%} %>
                      <div class="div-square">
                           <a href="pages/registre.jsp" >
 						<i class="fa fa-clock-o fa-5x"></i>
                      <h4>Registre d'hores</h4>
                      </a>
                      </div>
                  </div>
                  <%} %>
                  
                  <%if(permis == 4){%>
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="pages/administrador.jsp" >
						<i class="fa fa-user-o fa-5x" aria-hidden="true"></i>
                        <h4>Administrador</h4>
                      </a>
                      </div>
                  </div>
                  <%} %>
                  <%if(permis >= 2){%>
                  <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                        <a href="pages/responsables.jsp" >
                          	<i class="fa fa-street-view fa-5x"></i>
                     		<h4>Responsables</h4>
                     	</a>
                     </div>
				  </div>
				<%} %>
					
				<%if(permis == 1){ %>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                      <div class="div-square">
                           <a href="pages/dadesUsuari.jsp" >
                    <i class="fa fa-id-card fa-5x"></i>
                      <h4>Dades d'usuari</h4>
                      </a>
                      </div>
					</div>
				<%} %>
					
                  </div>
                  
              </div>
                 <!-- /. ROW  -->   
				  
                  <!-- /. ROW  --> 
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
	<script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>