<%@page import="model.UsuariDAO" %>
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
    <link href="../assets/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    
    <link href="../assets/css/tutors.css" rel="stylesheet" />
    
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
<script type="text/javascript">
function nif(dni) {
	  var numero
	  var letr
	  var letra
	  var expresion_regular_dni
	 
	  expresion_regular_dni = /^\d{8}[a-zA-Z]$/;
	 
	  if(expresion_regular_dni.test (dni) == true){
	     numero = dni.substr(0,dni.length-1);
	     letr = dni.substr(dni.length-1,1);
	     numero = numero % 23;
	     letra='TRWAGMYFPDXBNJZSQVHLCKET';
	     letra=letra.substring(numero,numero+1);
	    if (letra!=letr.toUpperCase()) {
	       alert('Error DNI, la lletra no li correspon');
	    	document.getElementById("NIF").value = "";
	     }else{
	       alert('Dni correcte');
	     }
	  }else{
	     alert('Error DNI, format no vàlid');
		  document.getElementById("NIF").value = "";
	   }
	}
</script>
<script type="text/javascript">
var restrict = function(tb) {
	  tb.value = tb.value.replace(/[^a-zA-Zñç]/g, '');
	};
</script>
<script type="text/javascript">
    function validateForm()
    {
    var g=document.getElementById("tec");
    if (g.selectedIndex==0)
      {
      alert("No s'ha seleccionat una tecnologia.");
      return false;
      }
    }
    </script>
<%
	HttpSession sesion=request.getSession(); 
	String nif;
	if(sesion.getAttribute("nif") == null){
	
		response.sendRedirect("login.jsp");

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
                  <a href="login.html" style="color:#fff;">LOGOUT</a>  

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
                    <li  class="active-link">
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
                    <div class="col-lg-12">
                     <h2>Afegir tutors</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                        <!--
                        <div class="alert alert-info">
                             <strong>Benvingut (usuari)! </strong>
                        </div>
                       -->
                    </div>
 
                    </div>
                  <!-- /. ROW  --> 
                            <div class="row text-center pad-top">
                                <form method="post" name="Form" onsubmit="return validateForm()" action="/fpDualWeb/afegirTutors">
                                
                                    <table>
                                        <tr>
                                            <td>NIF: </td>
                                            <td><input type="text" class="form-control" id="NIF" name="NIF" size="25" maxlength="9" onblur="nif(this.value)" required/></td>
                                        </tr>
                                        <%
                                        	UsuariDAO uDAO=new UsuariDAO();
                                        	String NIF=request.getParameter("NIF");
                                        	uDAO.compararNIF(NIF);
                                        %>
                                        <tr>
                                            <td>Password: </td>
                                            <td><input type="password" class="form-control" name="pass" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Nom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="nom" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Primer cognom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="Pcognom" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Segon cognom: </td>
                                            <td><input type="text" class="form-control" onpaste="restrict(this);" onkeypress="restrict(this);" onkeyup="restrict(this);" name="Scognom" size="25" required/></td>
                                        </tr>
                                        <tr>
                                            <td>Mail: </td>
                                            <td><input type="email" class="form-control" name="mail" size="25" required/></td>
                                        </tr>
                                        <tr>
                                        <td>Tecnologia: </td>
                                        <td>
                                            <select id="tec" name="tecno" class="form-control" required>
                                                <option selected hidden value="selec">Selecciona una opció:</option>
                                                <option value="JAVA">JAVA</option>
                                                <option value="SAP">SAP</option>
                                                <option value="NET">NET</option>
                                             </select>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td><br></td>
                                        </tr>
                                        <tr>
                                            <th><input type="submit" name="Afegir" class="btn btn-primary"/></th>
                                            <th><input type="reset" name="Esborrar" class="btn btn-danger"/></th>
                                        </tr>
                                    </table>
                                </form>
 
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
                   &copy;  2017 yourdomain.com | Design by: Joan Espuñes, Sergi Fernández, Sisco Navarro, Thiago Hachikyan
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