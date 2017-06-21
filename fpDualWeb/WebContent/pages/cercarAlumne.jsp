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
	
	<script type="text/javascript" >  
     function showInputs(){  
          if(document.getElementById("cknif").checked == true){  
              document.getElementById("cb1").hidden = false;
              document.getElementById("cb1").required = true;
          }else if(document.getElementById("cknif").checked == false){  
              document.getElementById("cb1").hidden = true; 
              document.getElementById("cb1").required = false;
          }
          
          if(document.getElementById("cknom").checked == true){
              document.getElementById("cb2").hidden = false;
              document.getElementById("cb2").required = true;
          }else if(document.getElementById("cknom").checked == false){
              document.getElementById("cb2").hidden = true;
              document.getElementById("cb2").required = false;
          }
          
          if(document.getElementById("cktutor").checked == true){  
              document.getElementById("cb3").hidden = false;  
              document.getElementById("cb3").required = true;
          }else if(document.getElementById("cktutor").checked == false){  
              document.getElementById("cb3").hidden = true;  
              document.getElementById("cb3").required = false;
          }
          
          if(document.getElementById("ckcentre").checked == true){
              document.getElementById("cb4").hidden = false;
              document.getElementById("cb4").required = true;
          }else if(document.getElementById("ckcentre").checked == false){
              document.getElementById("cb4").hidden = true;
              document.getElementById("cb4").required = false;
          }
          
          if(document.getElementById("cknif").checked == true ||
        	 document.getElementById("cknom").checked == true || 
        	 document.getElementById("cktutor").checked == true || 
       		 document.getElementById("ckcentre").checked == true){
              document.getElementById("btnsub").disabled = false;
          }
          
          if(document.getElementById("cknif").checked == false &&
             document.getElementById("cknom").checked == false && 
             document.getElementById("cktutor").checked == false &&
             document.getElementById("ckcentre").checked == false){
             document.getElementById("btnsub").disabled = true;
          }
     }  
     </script> 
</head>
<body>
<%
	HttpSession sesion=request.getSession(); 
	String nif;
	if(sesion.getAttribute("nif") == null){	
		response.sendRedirect("login.jsp");
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
                     <h2>Cerca d'alumnes </h2>
                    </div>
                </div>              
                 <!-- /. ROW  -->
               <hr/>
				<div class="row">
                    <div class="col-lg-12 col-md-12">
                    
                        <form action="../CercarAlumne" method="Post">
                        <table id="taula">
	                        <tr valign="middle">
	                        	<td width="15px"><input id="cknif" type="checkbox" onclick="showInputs()"></td>
	                        	<td id="soto"><label for="cknif">&nbsp;&nbsp;D.N.I</label></td>
	                        	<td width="15px"><input id="cknom" type="checkbox" onclick="showInputs()"></td>
	                        	<td id="soto"><label for="cknom">&nbsp;&nbsp;Nom</label></td>
	                        	<td width="15px"><input id="cktutor" type="checkbox" onclick="showInputs()"></td>
	                        	<td id="soto"><label for="cktutor">&nbsp;&nbsp;Tutor</label></td>
	                        	<td width="15px"><input id="ckcentre" type="checkbox" onclick="showInputs()"></td>
	                        	<td id="soto"><label for="ckcentre">&nbsp;&nbsp;Centre</label></td>
	                        </tr>
	                        <tr>
	                        	<td colspan=2><input type="text" class="cbx" id="cb1" name="nif" hidden></td>
	                        	<td colspan=2><input type="text" class="cbx" id="cb2" name="nom" hidden></td>
	                        	<td colspan=2><input type="text" class="cbx" id="cb3" name="tutor" hidden></td>
	                        	<td colspan=2><input type="text" class="cbx" id="cb4" name="centre" hidden></td>
	                        </tr>
                        </table>
                        
                        <input type="submit" class="btn btn-primary" value="Cercar" id="btnsub" disabled>
                        </form>

                    </div>
				</div>
				<hr/>
            <!-- /. PAGE INNER  -->
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>