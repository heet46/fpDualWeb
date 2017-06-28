<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%@page import="model.RegistreDAO"%>
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
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/custom.css" rel="stylesheet" />
    
    <link href="../assets/css/activitats.css" rel="stylesheet" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <script src="../assets/js/bootstrap.min.js"></script>
    
    <script src="../assets/js/custom.js"></script>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
	
	<link rel="stylesheet" href="../assets/css/calendari.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$( function() {
	  $("#datepicker").datepicker({
		  dateFormat: "dd/mm/yy",
	      monthNames: [ "Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Setembre", "Octubre", "Novembre", "Desembre" ],
	      monthNamesShort: [ "Gen", "Feb", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Des" ],
	      dayNames: [ "Diumenge", "Dilluns", "Dimarts", "Dimecres", "Dijous", "Divendres", "Dissabte" ],
	      dayNamesMin: [ "Dl", "Dm", "Dc", "Dj", "Dv", "Ds", "Dg" ],
	      prevText: "Anterior",
	      nextText: "Següent",
	      showAnim: "fold",
	      duration: "normal"
	  });
	  var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
	  $( "#datepicker" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
	  
	  var monthNames = $( "#datepicker" ).datepicker( "option", "monthNames" );
	  $( "#datepicker" ).datepicker( "option", "monthNames", [ "Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Setembre", "Octubre", "Novembre", "Desembre" ] );
	  
	  var monthNamesShort = $( "#datepicker" ).datepicker( "option", "monthNamesShort" );
	  $( "#datepicker" ).datepicker( "option", "monthNamesShort", [ "Gen", "Feb", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Des" ] );
	  
	  var dayNames = $( "#datepicker" ).datepicker( "option", "dayNames" );
	  $( "#datepicker" ).datepicker( "option", "dayNames", [ "Diumenge", "Dilluns", "Dimarts", "Dimecres", "Dijous", "Divendres", "Dissabte" ] );
	  
	  var dayNamesMin = $( "#datepicker" ).datepicker( "option", "dayNamesMin" );
	  $( "#datepicker" ).datepicker( "option", "dayNamesMin", [ "Dl", "Dm", "Dc", "Dj", "Dv", "Ds", "Dg" ] );
	  	  
	  var prevText = $( "#datepicker" ).datepicker( "option", "prevText" );
	  $( "#datepicker" ).datepicker( "option", "prevText", "Anterior" );
	  
	  var nextText = $( "#datepicker" ).datepicker( "option", "nextText" );
	  $( "#datepicker" ).datepicker( "option", "nextText", "Següent" );
	  
	  var showAnim = $( "#datepicker" ).datepicker( "option", "showAnim" );
      $( "#datepicker" ).datepicker( "option", "showAnim", "fold" );
      
      var duration = $( "#datepicker" ).datepicker( "option", "duration" );
      $( "#datepicker" ).datepicker( "option", "duration", "normal" );

	});
	</script>
	</head>
<body>
<%
HttpSession sesion=request.getSession(); 
String nif = null;
String usuNif = null;
String usuNom = null;
String usuCognom = null;
String usuMail = null;
int permis = 0;
double hRestants = 0;
String data = null;
int nReg = 0;
List<String> llistaActivitats = null;
List<Object> llistaRegistres = null;

try{
	if(sesion.getAttribute("nif").toString() == null){	
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
	
	data = sesion.getAttribute("afgData").toString();
	llistaRegistres = (ArrayList<Object>)sesion.getAttribute("llistaRegistre");
	nReg = Integer.parseInt(sesion.getAttribute("nRegistres").toString());
	
	try{
		hRestants = Double.parseDouble(sesion.getAttribute("hRestants").toString());
	}catch(Exception e){
		hRestants = 9;
	}
	
	RegistreDAO rDAO = null;
	try{
		sesion.removeAttribute("horesMaximes");
		rDAO = new RegistreDAO();
		llistaActivitats = rDAO.llistaActivitats();
	}catch(Exception e){}
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
					<%if(permis > 1){ %>
                    <li>
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
                    <%if(permis == 1 || permis == 2){ %>
                    <li class="active-link">
                    	<a href="registre.jsp"><i class="fa fa-clock-o"></i>Registre d'hores</a>
                    </li>
                    <%} %>
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
                    <div class="col-lg-12">
                     <br>
                     <h2 style="display:inline">Nou registre d'activitats&nbsp;</h2> <%=data %>
                     <div style="float:right; font-size:16px" ><a href="seleccioData.jsp"><strong>Torna enrere</strong></a></div> 
                    </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
                <form action="../AfegirRegistre" method="Post">
	                <div class="row">
	                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                		<h4>Activitat</h4>
                            <select class="form-control" name="activitat" required>
                            	<option value="" selected hidden>Selecciona una activitat</option>
                            	<% 
                            	for(int j=0; j<llistaActivitats.size(); j++) { 
                            	%>
	                                <option value="<%=llistaActivitats.get(j).toString() %>">
	                                	<%=llistaActivitats.get(j).toString() %>
	                                </option>
                            <% 
                            	} 
                            %>
                            </select>
	                	</div>
	 				</div>
	 				<hr>
	 				<div class="row">
	 					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	 						<h4>Hores</h4>
	 						<% double num1=(100/(hRestants-1));%> 
	 						<input type="range" min=1 max=<%=hRestants%> name=hores>
	 						<table width="100%">
	 							<tr>
	 							<% for(int i=1;i<=hRestants;i++){ %>
	 								<td width="<%=num1%>%"><%=i%>h</td>
	 								<%} %>
	 							</tr>
	 						</table>
	 					</div>
	 				</div>
	 				<hr>
	 				<div class="row">
	                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                		<input type="submit" class="btn btn-primary" style="margin-top:10px" value="Afegir registre">
	                	</div>
	 				</div>
	                <!-- ROW -->
	                <hr>
	                <br>
	                
	                <div class="row">
	                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                	<%
	                	if(nReg > 0){
	                		int i=0;
	                		int j=1;
		                	while(i<llistaRegistres.size()){
		                %>
		                	<div class="panel panel-primary">
			                    <div class="panel-heading">
			                        Registre #<%=j %>
			                    </div>
								<div class="panel-body">
					             	<div class='row col-lg-12 col-md-12'>
					             		<b>Data: </b> <%=llistaRegistres.get(i+1)%> <br/>
										<b>Hores: </b> <%=llistaRegistres.get(i+2)%> <br/>
										<b>Activitat: </b> <%=llistaRegistres.get(i)%> <br/>

									</div>
			                    </div>
		                	</div>
		                <%
		                j++;
		                i = i+4;
		                	}
	                	}	                	
	                	%>
	                	</div>
	                </div>
				</form>
    		
    		</div> <!-- PAGE-INNER -->
		
		</div> <!-- PAGE-WRAPPER -->
	
	</div> <!-- WRAPPER -->
    
    <div class="footer">
		<div class="row">
			<div class="col-lg-12" >
			    &copy;  2017 Indra Software Labs | Design by: Joan Espuñes, Sergi Fernández, Sisco Navarro, Thiago Hachikyan
			</div>
        </div>
	</div>
          

    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <!-- CUSTOM SCRIPTS -->
    


    
   
</body>
</html>