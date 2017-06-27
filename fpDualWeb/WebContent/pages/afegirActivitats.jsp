<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://use.fontawesome.com/d43d49ce33.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
    
    <script>
        function habilitar(value) {
            if(value=="1"){
                document.getElementById("id").disabled = true;
            }else if(value=="2"){
                document.getElementById("id").disabled = false;
            }
        }
    </script>
	<!-- BOOTSTRAP STYLES-->
     <!-- FONTAWESOME STYLES-->
    <link rel="stylesheet" href="../assets/css/activitats.css">
     
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/custom.css" rel="stylesheet" />
    
    <link href="../assets/css/activitats.css" rel="stylesheet" />
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
                  <h3>Alta d'activitat</h3>
                <div class="row">
                    
                    
                    <form class="form-horizontal" action="../AfegirActivitats" method="Post">
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="id">ID:</label>
                            <div class="col-lg-1">
                                <input type="number" min="1" onkeypress="return event.charCode >= 48" required class="form-control" disabled id="id" name="id">
                                
                            </div>
                            <label class="control-label col-lg-1" for="auto">Auto ID:</label>
                            <div class="col-lg-2">
                                <label class="radio-inline"><input type="radio" value="1" onchange="habilitar(this.value);" checked="checked" name="auto1">Si</label>
                                <label class="radio-inline"><input type="radio" value="2" onchange="habilitar(this.value);" name="auto1">No</label>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                       
                        <br>
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="codi">Codi:</label>
                            <div class="col-lg-4">
                                <select class="form-control" name="codi" required>
                                    <option hidden selected value="">Selecciona una opci�...</option>
                                    <option value="SQL">SQL (Consulta de dades)</option>
                                    <option value="JAV">JAV (Programaci� amb Java)</option>
                                    <option value="C++">C++ (Programaci� amb C++)</option>
                                    <option value="NET">NET (Programaci� amb .NET)</option>
                                    <option value="SAP">SAP (Programaci� amb SAP)</option>
                                </select>
                            </div>
                        </div>
                        
                        <br>
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="desc">Descripci�:</label>
                            <div class="col-lg-4">
                                <textarea class="form-control" rows="5" id="desc" name="descripcio" required></textarea>
                            </div>
                        </div>
                        <div class="col-lg-7"></div>
                        <!--div class="col-lg-2"-->
                        <input type="submit" value="Enviar" class="btn btn-default col-lg-1">
                        
                        <!--/div-->
                    </form>    
                </div>
                  <!-- /. ROW  --> 
                <br><br><br><br><br><br><br>
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