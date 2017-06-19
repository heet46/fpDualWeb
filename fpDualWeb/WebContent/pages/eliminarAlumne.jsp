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
    <!-- CUSTOM STYLES-->
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
</head>
<body>
<%
	HttpSession sesion=request.getSession(); 

	if(sesion.getAttribute("nif") == null){	
		response.sendRedirect("login.jsp");
	}
	
	AlumneDAO aDAO = new AlumneDAO();
	List<Alumne> llistaAlumnes = aDAO.llistaTotsAlumnes();
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
                     	<h2>Llistat d'alumnes </h2>                     
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
              <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <table class="table table-striped  table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nom</th>
                                    <th>Cognom</th>
                                    <th>Tutor</th>
                                    <th>Centre</th>
                                    <th></th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                                        
                                <tr>
									<%
										for (Alumne alumne : llistaAlumnes) {
									%>
									<td><%=alumne.getIdUsuari()%></td>
									<td><%=alumne.getNom()%></td>
									<td><%=alumne.getCognom1()%></td>
									<td><%=alumne.getTutor().getNom()%></td>
									<td><%=alumne.getCentre().getNom()%></td>
									<form action="../EliminarAlumne" method="Post">
										<td><input type="hidden" name="idUsuari" value="<%=alumne.getIdUsuari()%>"></td>
	                                    <td>
	                                    	<input type="Submit" value="Borrar" class="btn btn-danger">
	                             		</td>
                             		</form>
                             									
								</tr>
								<%
									}
								%>
                                
                            </tbody>
                        </table>

                    </div>
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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <!-- bootbox code -->
    <script src="bootbox.min.js"></script>
    <script>
        $(document).on("click", ".alert", function(e) {
            bootbox.alert("Hello world!", function() {
                console.log("Alert Callback");
            });
        });
    </script>
    
   
</body>
</html>