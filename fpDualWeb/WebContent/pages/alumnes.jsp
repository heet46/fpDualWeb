<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
</head>

<body>
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
			response.sendRedirect("login.jsp");
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
		
	try{
		session.removeAttribute("duplicat");
		session.setAttribute("dni2","");
		session.setAttribute("password2",""); 
		session.setAttribute("nom2","");      
		session.setAttribute("cognoms2","");  
		session.setAttribute("email2","");    
		session.setAttribute("dataInici2","");
		session.setAttribute("dataFinal2","");
	}catch(Exception e){}
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
                    	<img src="../assets/img/logo.png" height="50px"/>
                    </a>                    
                </div>
              
                <span class="logout-spn">                
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
                    <li>
                        <a href="../index.jsp" ><i class="fa fa-desktop "></i>Inici </a>
                    </li>
                    <%if(permis > 1){ %>
                    <li class="active-link">
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
                    <li>
                    	<a href="registre.jsp"><i class="fa fa-clock-o"></i>Registre d'hores</a>
                    </li>
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
                    <li>
                    	<a href="dadesUsuari.jsp"><i class="fa fa-id-card"></i>Dades d'usuari</a>
                    </li>
                    <%} %>
                </ul>
            </div>
        </nav>
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
        	<div id="page-inner">
            	<div class="row">
                	<div class="col-md-12">
                    	<br>
                     	<h2 style="display:inline">Gesti� d'alumnes </h2>  
                     	<div style="float:right; font-size:16px" >
                     		<a href="../index.jsp"><strong>Torna enrere</strong></a>
                     	</div>                   
                    </div>
				</div>               
                
                <!-- /. ROW  -->
                <hr />
              
                <!-- /. ROW  --> 
                <div class="row text-center pad-top">
                	<%if(permis >= 3){ %>
					<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                    	<div class="div-square">
                        	<a href="afegirAlumne.jsp" >
	                        	<i class="fa fa-user-plus fa-5x" aria-hidden="true"></i>
	                        	<h4>Afegir alumne</h4>
                      		</a>
                      	</div>                     
                  	</div> 
                  	<%} %>
                 	<%if(permis == 4){ %>
                  	<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      	<div class="div-square">
                           	<a href="modificarAlumne.jsp" >
                        		<i class="fa fa-pencil fa-5x" aria-hidden="true"></i>
                      			<h4>Modificar alumne</h4>
                      		</a>
                      	</div>                     
                  	</div>
                  	<%} %>
                  	<%if(permis >= 3){ %>
                  	<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                    	<div class="div-square">
                        	<a href="llistatAlumnes.jsp" >
								<i class="fa fa-id-card fa-5x" aria-hidden="true"></i>
                      			<h4>Gesti� d'alumnes</h4>
                      		</a>
                      	</div>
                  	</div>
                  	<%} %>
                  	<%if(permis == 4){ %>
                  	<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                      	<div class="div-square">
                        	<a href="eliminarAlumne.jsp" >
                        		<i class="fa fa-user-times fa-5x" aria-hidden="true"></i>
                      			<h4>Eliminar alumne</h4>
                      		</a>
                      	</div>                     
                  	</div>
              		<%} %>
              		<%if(permis >= 3){ %>
              		<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                    	<div class="div-square">
							<a href="cercarAlumne.jsp" >
	                    		<i class="fa fa-search fa-5x" aria-hidden="true"></i>
	                     		<h4>Cercar alumne</h4>
                     		</a>
                     	</div>
					</div>
					<%} %>
					<%if(permis == 2){ %>
					<div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                    	<div class="div-square">
							<a href="alumnesTutor.jsp" >
	                    		<i class="fa fa-users fa-5x" aria-hidden="true"></i>
	                     		<h4>Els teus alumnes</h4>
                     		</a>
                     	</div>
					</div>
					<%} %>
              	</div>
    		</div> <!-- /. PAGE INNER  -->
		</div> <!-- /. PAGE WRAPPER  -->
    
    <div class="footer">
		<div class="row">
			<div class="col-lg-12" >
				&copy;  2017 Indra Software Labs | Design by: Joan Espu�es, Sergi Fern�ndez, Sisco Navarro, Thiago Hachikyan
            </div>
        </div>
	</div>
    
	</div> <!-- /. WRAPPER  -->
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
</body>
</html>
