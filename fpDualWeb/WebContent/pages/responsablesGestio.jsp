<%@page import="model.ResponsableDAO" %>
<%@page import="model.Responsable" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="UTF-8" />
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
    
     <link href="../assets/css/bootstrap-X.X.css" rel="stylesheet" />
     
     <link href="../assets/css/bootstrap-X.X-flex.css" rel="stylesheet" />
     
     <link href="../assets/css/bootstrap.js" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.‌​2/css/bootstrap.min.‌​css">
    
    <link href="../assets/css/tutors.css" rel="stylesheet" />
    
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
         <!-- FAVICON -->
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
                    <li>
                        <a href="administrador.jsp"><i class="fa fa-university "></i>Administrador </a>
                    </li>
                    <li class="active-link">
                    	<a href="responsables.jsp"><i class="fa fa-street-view"></i>Responsables</a>
                    </li>
                </ul>
            </div>


        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>Gesti� responsables</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                    </div>
 
                    </div>
                  <!-- /. ROW  --> 
                        
                            <div class="row">
                                <div class="col-lg-12">
                                          
	                                <table class="table table-hover table-inverse" id="myTable">
	                                    <thead>
	                                   		<tr>
	                                   			<th><input type="text" id="myCentre" onkeyup="buscarIdCentre()" placeholder="Buscar per ID..."></th>
		                                    	<th><input type="text" id="myNom" onkeyup="buscarNom()" placeholder="Buscar per Nom..."></th>
		                                    	<th><input type="text" id="myCog" onkeyup="buscarCog()" placeholder="Buscar per Cognom..."></th>
		                                    	<th><input type="text" id="myNIF" onkeyup="buscarNIF()" placeholder="Buscar per NIF...">    </th>
	                                    	</tr>
	                                        <tr id="headeer">
	                                        	<th><span>#Centre</span></th>
		                                        <th><span>Nom</span></th>
		                                        <th><span>Cognom</span></th>
		                                        <th><span>NIF</span></th>
		                                        <th><span>E-mail</span></th>
		                                        <th>&nbsp;</th>
		                                        <th>&nbsp;</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <%
	                                        	ResponsableDAO rDAO=new ResponsableDAO();
	                                        	List<Responsable> respo=null;
	                                        	try{	
	                                        		respo=rDAO.consultaRespos();
	                                        	}catch(Exception e){
	                                        		e.printStackTrace();
	                                        	}
	                                        	for(Responsable r:respo){
	                                        %>
	                                        		<tr>
	                                        			<td>
	                                        				<%=r.getIdCentre() %>
	                                        			</td>
	                                        			<td>
	                                        				<%=r.getNom()%>
	                                        			</td>
	                                        			<td>
	                                        				<%=r.getCognom1()%>
	                                        			</td>
	                                        			<td>
	                                        				<%=r.getNIF()%>
	                                        			</td>
	                                        			<td>
	                                        				<%=r.getMail()%>
	                                        			</td>
	                                        			<form name="form" method="Post" action="../EliminarResponsable" class="table-link" onsubmit="comprobarTutor()">
	                                        				<td hidden>
                                                        		<input type="hidden" name="NIF" id="NIF" value="<%=r.getNIF()%>" size="0">
                                                        	</td>
	                                        				<td style="width: 5%">
                                                        		<input type="submit" class="btn btn-danger" value="Eliminar">
                                                       	 	</td>
                                                       	 </form>
                                                       	 <form name="form" method="Post" action="../ModificarResponsable" class="table-link">
                                                       	    <td hidden>
                                                        		<input type="hidden" name="NIF" value="<%=r.getNIF()%>" size="0">
	                                        				</td>
                                                        	<td style="width: 5%">
                                                        		<input type="submit" class="btn btn-warning" value="Modificar">
                                                        	</td>
														</form>
	                                        		</tr>
	                                        <% 
	                                        	}
	                                       	%>	
	                                       		    <tr>
	                                        			<td>
	                                        				<a href="responsablesAfegir.jsp"><button  class="btn btn-primary">Afegir Responsable</button></a> 
	                                        			</td>
	                                        		</tr>
	                                    </tbody>
	                                </table>
                                   </div>
                               </div>
                                   </div>
                               </div>
                                                    <a href="tutors.jsp"  id="fletxa">
               			<i class="fa fa-hand-o-left fa-4x" style='position:fixed; head:0; bottom:50px; right:35px;' width="50" height="50"></i>
              		</a>
                           </div>
                        
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2017 Indra Software Labs | Design by: Joan Espu�es, Sergi Fern�ndez, Sisco Navarro, Thiago Hachikyan
                </div>
            </div>
        </div>
          
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <!-- CUSTOM SCRIPTS -->

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
<script>		        
	bootbox.alert("Error, aquest tutor est� lligat a un alumne", function() {
	console.log("Alert Callback");
	});
</script>
<%} %>
 
 <script>
	function buscarIdCentre() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myCentre");
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
</script>
 
<script>
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
</script>

<script>
	function buscarNIF() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myNIF");
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
</script>

<script>
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
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>

    
   
</body>
</html>