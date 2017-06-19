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
	<!-- BOOTSTRAP STYLES-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/custom.css" rel="stylesheet" />
    
    <script src="../assets/js/gen_validatorv4.js" type="text/javascript"></script>
    <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
    

     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<%
	HttpSession sesion=request.getSession(); 
	String nif;
	if(sesion.getAttribute("nif") == null){	
		response.sendRedirect("login.jsp");
	}
	
	CentreDAO cDAO = new CentreDAO();
	List<String> llistaCentres = cDAO.nomsCentres();
	TutorDAO tDAO = new TutorDAO();
	List<String> llistaTutors = tDAO.nomsTutors();
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
                     <h2>Alta d'alumnes </h2>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  
                <div class="row">
                    <div class="col-md-12">
                     <h4>Formulari d'alta alumnes </h4>
                    </div>
                </div>  
                <form method="post" action="../AfegirAlumne" name="afgAlumne">
                <div class="row">
                        <div class="col-md-6">
                        	<h5>D.N.I.</h5>
                            <input type="text" class="form-control" placeholder="D.N.I." name="dni" id="dni" required/>
                        </div>
                        <div class="col-md-6">
                        	<h5>Contrasenya</h5>
                            <input type="password" class="form-control" placeholder="Contrasenya" name="password" required/>
                        </div>
                </div>
                <br>
                <div class="row">
                        <div class="col-md-6">
                        	<h5>Nom</h5>
                            <input type="text" class="form-control" placeholder="Nom" name="nom" required/>
                        </div>
                        <div class="col-md-6">
                        	<h5>Cognoms</h5>
                            <input type="text" class="form-control" placeholder="Cognoms" name="cognoms" required/>
                        </div>
                </div>
                <br>
                <div class="row">
                        <div class="col-md-12">
                        	<h5>Correu electrònic</h5>
                            <input type="email" class="form-control" placeholder="Correu electronic" name="email" required/>
                        </div>
                </div>
                <hr>
                <div class="row">
                        <div class="col-md-6">
                            <h5>Data inicial</h5>
                            <input type="date" class="form-control" name="dataInici" required/>
                        </div>
                        <div class="col-md-6">
                            <h5>Data finalitzacio</h5>
                            <input type="date" class="form-control"  name="dataFinal" required/>
                        </div>
                </div>
                <hr>
                <div class="row">
                        <div class="col-md-6">
                            <h5>Tutor</h5>
                            <select class="form-control" name="tutor" required>
                            	<option value="" selected hidden>Selecciona el tutor</option>
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
                        <div class="col-md-6">
                            <h5>Centre</h5>
                            <select class="form-control" name="centre" required>
                            	<option value="" selected hidden>Selecciona el centre</option>
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
                <hr>
                <div class="row">
                	<center><input type="submit" class="btn btn-primary" value="AFEGIR ALUMNE"/></center>                
                </div>
                
                </form>
				
            
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
             <div class="row">
                <div class="col-lg-12" >
                    &copy;  2017 yourdomain.com | Design by: Joan Espuñes, Sergi Fernandez, Sisco Navarro, Thiago Hachikyan
                </div>
        </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>