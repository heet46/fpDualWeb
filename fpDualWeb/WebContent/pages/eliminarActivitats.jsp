<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
	<!-- BOOTSTRAP STYLES-->
     <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link rel="stylesheet" href="../assets/css/activitats.css">    
    
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
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
	
	ActivitatDAO aDAO = new ActivitatDAO();
	List<Activitat> llistaActivitats = aDAO.llistaTotesActivitats();
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
                    <li class="active-link">
                        <a href="activitats.jsp"><i class="fa fa-list "></i>Activitats</a>
                    </li>
                    <li>
                        <a href="administrador.jsp"><i class="fa fa-university "></i>Administrador </a>
                    </li>
                    <li>
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
                     <h2>Gesti� d'activitats</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  <h3>Llistat d'activitats</h3>
                <div class="row col-lg-12">
                    
 
                </div>
                  <!-- /. ROW  --> 
                            <div class="row">
                                <div class="col-lg-12">
                                <table class="table table-striped  table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Codi</th>
                                    <th>Descripci�</th>
                                    <th></th>
                                    <th>Detalls</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <tr>
									<%
										for (Activitat activitat : llistaActivitats) {
									%>
									<td><%=activitat.getId()%></td>
									<td><%=activitat.getCodi()%></td>
									<td><%=activitat.getDescripcio()%></td>
									<form action="../EliminarActivitats" method="Post">
										<td><input type="hidden" name="idActivitat" value="<%=activitat.getId()%>"></td>
	                                    <td>
	                                    	<input type="Submit" value="Eliminar" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">
	                             		</td>
                             		</form>

								</tr>
								<%
									}
									
								%>
                                
                            </tbody>
                        </table>
                  
                <br><br><br><br><br><br><br><br><br>
                <div class="col-lg-11"></div>
                <div class="col-lg-1">
                    <a class="flotante" href="activitats.jsp">
                        <i class="fa fa-arrow-left fa-2x"></i>
                    </a>
                </div>
                
              </div>
                 <!-- /. ROW  -->   
				 <!-- 
				 <div class="row">
                    <div class="col-lg-12 ">
					<br/>
                        <div class="alert alert-danger">
                             <strong>Want More Icons Free ? </strong> Checkout fontawesome website and use any icon <a target="_blank" href="http://fortawesome.github.io/Font-Awesome/icons/">Click Here</a>.
                        </div>
                       
                    </div>
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
                    &copy;  2017 Indra Software Labs | Design by: Joan Espu�es, Sergi Fern�ndez, Sisco Navarro, Thiago Hachikyan
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <!-- CUSTOM SCRIPTS -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>

    
   
</body>
</html>