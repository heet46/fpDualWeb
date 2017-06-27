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
	
	ActivitatDAO aDAO = new ActivitatDAO();
	List<Activitat> llistaActivitats;
	
	try{
		llistaActivitats = (ArrayList<Activitat>) session.getAttribute("list");
		System.out.println("Llista: "+llistaActivitats.toString());
	}catch(Exception e){
		llistaActivitats = null;
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
                     <h2>Cerca d'activitats</h2>
                     
                    </div>
                    <div class="col-lg-12"><hr></div>
                    <div class="col-lg-12">
                    	<h3>Llistat d'activitats</h3>
                    </div>
                    <div class="col-lg-12">
                    
                    	<form class="form-inline" action="../CercarActivitats" method="Post">
                    		<div class="input-group input">
                    			<input class="cercar form-control" name="descripcio" type=text placeholder="Cercar..." size="12">
                    			<div class="input-group-btn">
                    				<button type=Submit class="btn btn-primary fa fa-search cercarb"></button>
                    			</div>
                    		</div>
                    		
                    	<div class="dropdown">
  						<button class="btn btn-primary dropdown-toggle dropbutton" type="button" data-toggle="dropdown">Filtre
  						<span class="caret"></span></button>
  						<ul class="dropdown-menu dropmenu">
  							<li class="dropdown-header">Filtrar per Codi</li>
  							<li><a href="#" class="small" data-value="'SQL'" tabIndex="-1"><input type="checkbox" value="'SQL'" name="codi1"/>&nbsp;SQL (Consulta de dades)</a></li>
    						<li><a href="#" class="small" data-value="'JAV'" tabIndex="-1"><input type="checkbox" value="'JAV'" name="codi2"/>&nbsp;JAV (Programació amb Java)</a></li>
							<li><a href="#" class="small" data-value="'C++'" tabIndex="-1"><input type="checkbox" value="'C++'" name="codi3"/>&nbsp;C++ (Programació amb C++)</a></li>
							<li><a href="#" class="small" data-value="'NET'" tabIndex="-1"><input type="checkbox" value="'NET'" name="codi4"/>&nbsp;NET (Programació amb .NET)</a></li>
							<li><a href="#" class="small" data-value="'SAP'" tabIndex="-1"><input type="checkbox" value="'SAP'" name="codi5"/>&nbsp;SAP (Programació amb SAP)</a></li>
							
						</ul>
					</div>
                    	</form>
                    </div>
                    
                </div>              
                 <!-- /. ROW  -->
                <div class="row col-lg-12">
                    
 
                </div>
                  <!-- /. ROW  -->
                  
                            <div class="row">
                                <div class="col-lg-12">
                                <table class="table table-striped  table-hover">
                            <thead>
                                <tr id="headeer">
                                    <th width="20%">ID</th>
                                    <th width="30%">Codi</th>
                                    <th width="50%">Descripció</th>
                                </tr>
                            </thead>
                            <%if(llistaActivitats != null){ %> 
                            <tbody> 
                                <tr>
									<%
										for (Activitat activitat : llistaActivitats) {
									%>
									<td width="20%"><%=activitat.getId()%></td>
									<td width="30%"><%=activitat.getCodi()%></td>
									<td width="50%"><%=activitat.getDescripcio()%></td>

								</tr>
								<%
									}
									
									
								%>
                                
                            </tbody>
                            <%} if(llistaActivitats != null)
                            	llistaActivitats.clear(); %>
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
                    &copy;  2017 Indra Software Labs | Design by: Joan Espuñes, Sergi Fernández, Sisco Navarro, Thiago Hachikyan
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
    <script>
    var options = [];

    $( '.dropdown-menu a' ).on( 'click', function( event ) {

       var $target = $( event.currentTarget ),
           val = $target.attr( 'data-value' ),
           $inp = $target.find( 'input' ),
           idx;

       if ( ( idx = options.indexOf( val ) ) > -1 ) {
          options.splice( idx, 1 );
          setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
       } else {
          options.push( val );
          setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
       }

       $( event.target ).blur();
          
       console.log( options );
       return false;
    });
    </script>

    
   
</body>
</html>