<%@page import="model.UsuariDAO" %>
<%@page import="model.Responsable" %>
<%@page import="model.ResponsableDAO" %>
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
	
	session.setAttribute("existeix", 0);
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
                     <h2>Consultar responsables</h2>   
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
	                                <table class="table table-hover table-inverse">
	                                    <thead>
	                                        <tr id="headeer">
	                                        <th><span>#Centre</span></th>
	                                        <th><span>Nom</span></th>
	                                        <th><span>Cognom</span></th>
	                                        <th><span>NIF</span></th>
	                                        <th><span>E-mail</span></th>
	                                        <th>&nbsp;</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <%
	                                        	ResponsableDAO rDAO=new ResponsableDAO();
	                                        	UsuariDAO uDAO=new UsuariDAO();
	                                        	String NIF=(String)session.getAttribute("NIF");
	                                        	String nom=(String)session.getAttribute("nom");
	                                        	String cognom=(String)session.getAttribute("cognom");
	                                        	System.out.println(NIF+","+nom+","+cognom);
	                                    		Responsable rs=new Responsable(NIF, "", nom, cognom,"", "",3);
	                                        	List<Responsable> respo=rDAO.cercarRespos(rs);
	                                        	rDAO.tancarConn();
	                                        	uDAO.tancarConn();
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
	                                        		</tr>
	                                        <% 
	                                        	}
	                                       	%>	
	                                    </tbody>
	                                </table>
								 </div>
                               </div>
                                   </div>
                               </div>
                           </div>
                     <a href="tutorsCercar.jsp"  id="fletxa">
               			<i class="fa fa-hand-o-left fa-4x" style='position:fixed; head:0; bottom:50px; right:35px;' width="50" height="50"></i>
              		</a>
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