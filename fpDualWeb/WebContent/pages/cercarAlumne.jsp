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
    <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- BOOTSTRAP STYLES-->    
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    
    <!-- CHECKBOX -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<script src="bootstrap-checkbox.min.js" defer></script>
	
    <!-- CUSTOM STYLES-->
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
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
	
	CentreDAO cDAO = new CentreDAO();
	List<String> llistaCentres = cDAO.nomsCentres();
	TutorDAO tDAO = new TutorDAO();
	List<String> llistaTutors = tDAO.nomsTutors();
	List<Alumne> llistaAlumnes;
	
	try{
		llistaAlumnes = (ArrayList<Alumne>) session.getAttribute("list");
		System.out.println("Llista: "+llistaAlumnes.toString());
	}catch(Exception e){
		llistaAlumnes = null;
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
           
           		<form method="post" action="../Logout" name="logoutForm">
                <span class="logout-spn" >                
						<a href="javascript: submitform()" style="color:#fff;">LOGOUT</a>
						<p><strong><%=usuNom %></strong> | <%=usuNif%></p>
						<script type="text/javascript">
						function submitform(){
						  document.logoutForm.submit();
						}
					</script>
                </span>
                </form>
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
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                
				<div class="row">
                    <div class="col-md-12">
                    <br>
                     <h2 style="display:inline">Cerca d'alumnes </h2>
                     <div style="float:right; font-size:16px" ><a href="../index.jsp"><strong>Torna enrere</strong></a></div>
                    </div>
                </div>              
               
               <hr/>
               <form action="../CercarAlumne" method="Post">
               
               	<div class="row">
               	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
					<a href="#filtre" data-toggle="collapse" class="btn btn-info" style="margin-bottom:10px">Filtre</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                	<input type="submit" class="btn btn-success" value="Cercar" >
				</div>
               	</div>
               
               <div id="filtre" class="collapse">
				                         
					<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h5><strong>D.N.I.</strong></h5>
  						<input type="text" class="form-control" placeholder="D.N.I." name="dni"/>
					</div>
					
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h5><strong>Nom</strong></h5>
  						<input type="text" class="form-control" placeholder="Nom" name="nom"/>
					</div>
					
					<br>
					
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h5><strong>Primer cognom</strong></h5>
  						<input type="text" class="form-control" placeholder="Primer cognom" name="cognom1"/>
					</div>
					
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h5><strong>Segon cognom</strong></h5>
  						<input type="text" class="form-control" placeholder="Segon cognom" name="cognom2"/>
					</div>
					
					<br>										
					
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h5><strong>Correu electrònic</strong></h5>
  						<input type="text" class="form-control" placeholder="Correu electrònic" name="mail"/>
					</div>
															
					</div>
					<div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <h5><strong>Tutor</strong></h5>
                            <select class="form-control" name="tutor">
                            	<option value="" selected hidden="true">Selecciona el tutor</option>
                            	<% 
                            	for(int i=0; i<llistaTutors.size(); i++) { 
                            	%>
	                                <option value="<%=llistaTutors.get(i) %>">
	                                	<%=llistaTutors.get(i) %>
	                                </option>
                            <% 
                            	} 
                            %>
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <h5><strong>Centre</strong></h5>
                            <select class="form-control" name="centre">
                            	<option value="" selected hidden="true">Selecciona el centre</option>
                            	<% 
                            	for(int i=0; i<llistaCentres.size(); i++) { 
                            	%>
	                                <option value="<%=llistaCentres.get(i) %>">
	                                	<%=llistaCentres.get(i) %>
	                                </option>
                            <% 
                            	} 
                            %>
                            </select>
                        </div>
                	</div>
                </div>
                <!-- END COLLAPSE -->
				</form>
				<hr>
				
				<%if(llistaAlumnes != null){ %>
				<div class="row">
					<div class="col-md-12">
						<h2>Resultats</h2>
					</div>
				</div>
				
				<div class="row">
                    <div class="col-lg-12 col-md-12">
                        <table class="table table-striped  table-hover" id="myTable">
                            <thead>
                                <tr id="headeer">
                                    <th>#</th>
                                    <th>NIF</th>
                                    <th>Nom</th>
                                    <th>Cognoms</th>
                                    <th>eMail</th>                                    
                                    <th>Tutor</th>
                                    <th>Centre</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
									<%
										for (Alumne alumne : llistaAlumnes) {
									%>
									<td><%=alumne.getIdUsuari()%></td>
									<td><%=alumne.getNIF()%></td>
									<td><%=alumne.getNom()%></td>
									<td><%=alumne.getCognom1()%>&nbsp;<%=alumne.getCognom2() %></td>
									<td><%=alumne.getMail()%></td>
									<td><%=alumne.getTutor().getNom()%></td>
									<td><%=alumne.getCentre().getNom()%></td>

							
								</tr>
								<%
									}
								%>
                                
                            </tbody>
                        </table>
                    </div>           
    			</div>
				
				<%} %>
				
				</div>
				<!-- END PAGE INNER -->
				<hr/>
            </div>
        	<!-- /. PAGE WRAPPER  -->
		</div>
    <div class="footer">
      
    
             <div class="row">
                <div class="col-lg-12" >
                    &copy;  2017 Indra Software Labs | Design by: Joan Espuñes, Sergi Fernandez, Sisco Navarro, Thiago Hachikyan
                </div>
        	</div>
        </div>
          

     <!-- /. WRAPPER  -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>