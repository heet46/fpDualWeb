<%@page import="java.io.PrintWriter"%>
<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    
    <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />

    <link href="../assets/css/custom.css" rel="stylesheet" />

   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   	<!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.tablesorter.js"></script>
	<script type="text/javascript">
	$(document).ready(function() 
		    { 
		        $("#myTable").tablesorter(); 
		    } 
		);
	</script>
	
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
	
	Alumne a = new Alumne();
	a.setNIF(usuNif);
	AlumneDAO aDAO = new AlumneDAO();
	List<Alumne> valorsAlumne = aDAO.dadesAlumne(a);
	List<Tutor> valorsTutor = aDAO.dadesTutor(a);
	List<Centre> valorsCentre = aDAO.dadesCentre(a);
	List<Usuari> valorsResponsable = aDAO.dadesResponsable(a);
	aDAO.tancarConn();
	
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
                 
                    <li>
                        <a href="../index.jsp" ><i class="fa fa-desktop "></i>Inici </a>
                    </li>
                    
                    <li class="active-link">
                    	<a href="dadesUsuari.jsp"><i class="fa fa-id-card"></i>Dades d'usuari</a>
                    </li>

                </ul>
			</div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                
                <div class="row">
                    <div class="col-md-12">
						<br>
                     	<h2 style="display:inline">Dades d'usuari </h2>
                     	<div style="float:right; font-size:16px" ><a href="../index.jsp"><strong>Torna enrere</strong></a></div>   
					</div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                
                	<div class="col-lg-12 col-md-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Alumne" data-toggle="tab">Alumne</a>
                            </li>
                            <li class=""><a href="#Tutor" data-toggle="tab">Tutor</a>
                            </li>
                            <li class=""><a href="#Centre" data-toggle="tab">Centre</a>
                            </li>
                            <li class=""><a href="#Responsable" data-toggle="tab">Responsable</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                        	<!-- PESTANYA ALUMNE -->
                            <div class="tab-pane fade active in" id="Alumne">
                                <div class="row" style="margin-top:10px">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>NIF</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getNIF() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getNom() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getCognom1()%> <%=valorsAlumne.get(0).getCognom2() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getMail() %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Data inici</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getDataInici() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Data finalització</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsAlumne.get(0).getDataFi() %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Tutor</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<a href="#Tutor" data-toggle="tab"><%=valorsAlumne.get(0).getTutor().getNom() %></a>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Centre</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<a href="#Centre" data-toggle="tab"><%=valorsAlumne.get(0).getCentre().getNom() %></a>
	                                </div>
                                </div>  
                                <hr>
                                <div class="row">
	                                <form action="../ModificarAlumne" method="Get">
		                                <div class="col-lg-2 col-md-2">
		                                	<input type="hidden" value="<%=valorsAlumne.get(0).getIdUsuari() %>" name="idUsuari">
		                                </div>
		                                <div class="col-lg-10 col-md-10">
		                                	<input type="submit" value="Editar dades">
		                                </div>
		                            </form>
                                </div>                              
                            </div>
                            
                            <!-- PESTANYA TUTOR -->
                            <div class="tab-pane fade" id="Tutor">
                                <div class="row" style="margin-top:10px">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>NIF</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsTutor.get(0).getNIF() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsTutor.get(0).getNom() %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsTutor.get(0).getCognom1()%> <%=valorsTutor.get(0).getCognom2()%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsTutor.get(0).getMail() %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Tecnología</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%=valorsTutor.get(0).getTecnologia() %>
	                                </div>
	                            </div>                                 
							</div>
							
							<!-- PESTANYA CENTRE -->
                            <div class="tab-pane fade" id="Centre">
                                <div class="row" style="margin-top:10px">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Codi</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsCentre.isEmpty() && valorsCentre != null){%>
											<%=valorsCentre.get(0).getCodi() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsCentre.isEmpty() && valorsCentre != null){%>
											<%=valorsCentre.get(0).getNom() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Telèfon</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsCentre.isEmpty() && valorsCentre != null){%>
											<%=valorsCentre.get(0).getTlf() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Direcció web</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsCentre.isEmpty() && valorsCentre != null){%>
											<%=valorsCentre.get(0).getWeb() %>
										<%}%>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Responsable</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsResponsable.isEmpty() && valorsResponsable != null){%>
											<%=valorsResponsable.get(0).getNom() %>
										<%}%>
	                                </div>
                                </div>
                            </div>
                            
                            <!-- PESTANYA RESPONSABLE -->
                            <div class="tab-pane fade" id="Responsable">
                                <div class="row" style="margin-top:10px">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>NIF</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsResponsable.isEmpty() && valorsResponsable != null){%>
											<%=valorsResponsable.get(0).getNIF() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsResponsable.isEmpty() && valorsResponsable != null){%>
											<%=valorsResponsable.get(0).getNom() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsResponsable.isEmpty() && valorsResponsable != null){%>
											<%=valorsResponsable.get(0).getCognom1() %> <%=valorsResponsable.get(0).getCognom2() %>
										<%}%>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<%if(!valorsResponsable.isEmpty() && valorsResponsable != null){%>
											<%=valorsResponsable.get(0).getMail() %>
										<%}%>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Centre</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
										<%if(!valorsCentre.isEmpty() && valorsCentre != null){%>
											<%=valorsCentre.get(0).getNom() %>
										<%}%>
	                                </div>
	                            </div>
                            </div>

                        </div>                	
                	</div>
                </div>
                
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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>
