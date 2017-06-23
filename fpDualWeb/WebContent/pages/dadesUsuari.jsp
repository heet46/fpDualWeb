<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
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
                    <a class="navbar-brand" href="#">
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
                        <a href="index.html" ><i class="fa fa-desktop "></i>Dashboard <span class="badge">Included</span></a>
                    </li>                   
                    <li>
                        <a href="ui.html"><i class="fa fa-table "></i>UI Elements  <span class="badge">Included</span></a>
                    </li>
                    <li class="active-link">
                        <a href="blank.html"><i class="fa fa-edit "></i>Blank Page  <span class="badge">Included</span></a>
                    </li>



                 <li>
                        <a href="#"><i class="fa fa-qrcode "></i>My Link One</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o"></i>My Link Two</a>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-edit "></i>My Link Three </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table "></i>My Link Four</a>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-edit "></i>My Link Five </a>
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
                     	<div style="float:right; font-size:16px" ><a href="alumnes.jsp"><strong>Torna enrere</strong></a></div>   
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
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Data inici</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Data finalització</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Tutor</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<a href="#Tutor"><% %></a>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Centre</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<a href="#Centre"><% %></a>
	                                </div>
                                </div>  
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<a href=""><strong>Edita</strong></a>
	                                </div>
                                </div>                              
                            </div>
                            
                            <!-- PESTANYA TUTOR -->
                            <div class="tab-pane fade" id="Tutor">
                                <div class="row" style="margin-top:10px">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>NIF</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Tecnología</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
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
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Telèfon</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Direcció web</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Responsable</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
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
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Nom</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Cognoms</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Correu electrònic</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
	                                </div>
                                </div>
                                <hr style="margin:5px">
                                
                                <div class="row">
	                                <div class="col-lg-2 col-md-2">
	                                	<label>Centre</label>
	                                </div>
	                                <div class="col-lg-10 col-md-10">
	                                	<% %>
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
                    &copy;  2014 yourdomain.com | Design by: <a href="http://binarytheme.com" style="color:#fff;"  target="_blank">www.binarytheme.com</a>
                </div>
        </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>
