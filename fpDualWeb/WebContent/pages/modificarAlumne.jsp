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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="../assets/js/bootbox.js"></script>
  	
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
	String nif;
	if(sesion.getAttribute("nif") == null){	
		response.sendRedirect("pages/login.jsp");
	}

	String usuNif = null;
	String sessionID = null;
	String usuNom = null;
	String usuCognom = null;
	String usuMail = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
		
			if(cookie.getName().equals("nif")) usuNif = cookie.getValue();
			if(cookie.getName().equals("nom")) usuNom = cookie.getValue();
			if(cookie.getName().equals("cognom")) usuCognom = cookie.getValue();
			if(cookie.getName().equals("mail")) usuMail = cookie.getValue();
			if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
			
			
		}
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

                    <li class="active-link dropdown">
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
                     <h2 style="display:inline">Llistat d'alumnes </h2>
                     <div style="float:right; font-size:16px" ><a href="alumnes.jsp"><strong>Torna enrere</strong></a></div>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
              <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <table class="table table-striped  table-hover" id="myTable">
                            <thead>
                            	<tr>
									<th><input type="text" id="myId" onkeyup="buscarId()" placeholder="ID..." style="width:30px"></th>
									<th><input type="text" id="myNom" onkeyup="buscarNom()" placeholder="Filtrar per nom..." style="width:100%"></th>
									<th><input type="text" id="myCog" onkeyup="buscarCog()" placeholder="Filtrar per cognom..." style="width:100%"></th>
									<th><input type="text" id="myTut" onkeyup="buscarTut()" placeholder="Filtrar per tutor..." style="width:100%"></th>
									<th><input type="text" id="myCentre" onkeyup="buscarCentre()" placeholder="Filtrar per centre..." style="width:100%"></th>
								</tr>
                                <tr id="headeer">
                                    <th>#</th>
                                    <th>Nom</th>
                                    <th>Cognom</th>
                                    <th>Tutor</th>
                                    <th>Centre</th>
                                    <th hidden></th>
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
									<form action="../ModificarAlumne" method="Get">
										<td hidden><input type="hidden" name="idUsuari" value="<%=alumne.getIdUsuari()%>"></td>
	                                    <td>
	                                    	<input type="Submit" value="Edita" class="btn btn-warning">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
    <script>
	function buscarId() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myId");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}

	function buscarNom() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myNom");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}

	function buscarCog() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myCog");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}
	
	function buscarTut() {
		  // Declare variables 
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myTut");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[3];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    } 
		  }
		}
	
	function buscarCentre() {
		  // Declare variables 
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myCentre");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[4];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    } 
		  }
		}
</script>
   
</body>
</html>