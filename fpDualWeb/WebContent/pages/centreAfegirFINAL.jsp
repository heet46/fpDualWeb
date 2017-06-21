<%@ page import="controlador.*" %>
<%@ page import="model.*" %>
<%@ page import="servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<!-- Variables Globals -->
	<%!
	int idCentreOk = 1,
	idNomOk = 0,
	idCodiCentreOk = 0,
	idTelefonOk = 0,
	idPagWebOk = 0,
	cosultaOK = 0,
	resultatBuscar = 0,
	resulte = 0,
	intbuscar = 666;
	%>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
	<!-- Scripts de Control de entrada de datos -->
    <script>
    
		function habilitar(value){ //Funcion que comprueba cual radius es marcado para anular o no el input.
			if(value=="1")
			{
				// habilitamos
				document.getElementById("iddelcentre").disabled=false;
				document.getElementById("iddelcentre").focus();
			}else if(value=="2"){
				// deshabilitamos
				document.getElementById("iddelcentre").disabled=true;
			}
		}

		function valida(e){ // Funcion que delimita los caracteres que entremos a unicamente Enteros.
		    tecla = (document.all) ? e.keyCode : e.which;
		    //Tecla de retroceso para borrar, siempre la permite
		    if (tecla==8){
		        return true;
		    }
		    // Patron de entrada, en este caso solo acepta numeros
		    patron =/[0-9]/;
		    tecla_final = String.fromCharCode(tecla);
		    return patron.test(tecla_final);
		}
</script>
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
    
    <link href="../assets/css/tutors.css" rel="stylesheet" />
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
                <li >
                    <a href="../index.jsp" ><i class="fa fa-desktop "></i>Inici</a>
                </li>
                <li>
                    <a href="alumnes.jsp"><i class="fa fa-graduation-cap "></i>Alumnes</a>
                </li>
                <li>
                    <a href="tutors.jsp"><i class="fa fa-book"></i>Tutors</a>
                </li>

                <li  class="active-link">
                    <a href="centre.jsp"><i class="fa fa-university "></i>Centres </a>
                </li>
                <li>
                    <a href="activitats.jsp"><i class="fa fa-list "></i>Activitats</a>
                </li>
              </ul>
          </div>

        </nav>
       <div id="page-wrapper" >
            <div id="page-inner">
                
                <div class="row">
                    <div class="col-md-12">
                    <a title="Manteniment Centres" href="../pages/centre.jsp">
                    	<img border='0' src='../assets/img/BackArrow.ico' style='position:fixed; head:0; right:0;' width="50" height="50" />
                    </a>
                     <h2>Afegir Centres</h2>
                    </div>
                </div>
                 <!-- /. ROW  -->
                  <hr />
                 <!-- /. ROW  --> 

<form name="vinform" action="../CentreFormulariAfegir" method="post">

  <p>
  <table border="0" class="tablaAgregar">
      
      <tr>
        <td><br>
          Nom del Centre:
        </td>
        <td><br>
        
            <input type="text" name="nomCentre" id="idNomCentre" maxlength="30" value="" onblur="validarNom()" required /><span><font color="silver"> *</font></span><span id="comprovaNom"> </span>
	<script>      
       function validarNom() {
			if ($('#idNomCentre').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaNom").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaNom").style.color="red";
				document.getElementById("idNomCentre").style.borderColor="red";
				document.getElementById("idNomCentre").focus();
				idNomOk = 0;
    	     	return false;
    	   	}
			if (($('#idNomCentre').val().length >= 1) && ($('#idNomCentre').val().length <= 3)) {
    	    	document.getElementById("comprovaNom").innerHTML = "<b>El nom a de tenir 4 o mes caracters.</b>";
				document.getElementById("comprovaNom").style.color="red";
				document.getElementById("idNomCentre").style.borderColor="red";
				document.getElementById("idNomCentre").focus();
				idNomOk = 0;
			}
			if ($('#idNomCentre').val().length >= 4) {
    	    	document.getElementById("comprovaNom").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaNom").style.color="green";
				document.getElementById("idNomCentre").style.borderColor="green";
				idNomOk = 1;
			}
			
    	 }
       </script>
	
	
        </td>
      </tr>
      <tr>
        <td>
          Codi del Centre:
          </td>
          <td>
            <input type="text" name="codiCentre" id="idCodiDelCentre" value=""  maxlength="5" onkeypress="return valida(event)" onblur="validarCodiCentre()" required /><span><font color="silver"> *</font></span><span id="comprovaCodiCentre"> </span>
            
            <script>      
       function validarCodiCentre() {
    	   //boolean correcte = 0;
    	   //int cosultaOK = 0;
			if ($('#idCodiDelCentre').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaCodiCentre").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaCodiCentre").style.color="red";
				document.getElementById("idCodiDelCentre").style.borderColor="red";
				document.getElementById("idCodiDelCentre").focus();
				idCodiCentreOk = 0;
    	     	return false;
    	   	}
			if ($('#idCodiDelCentre').val().length >= 1) {
    	    	document.getElementById("comprovaCodiCentre").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaCodiCentre").style.color="green";
				document.getElementById("idCodiDelCentre").style.borderColor="green";
				idCodiCentreOk = 1;
			}
			
    	 }
       </script>
       
        </td>
      </tr>
      <tr>
        <td>
          Telefon:
          </td>
          <td>
            <input type="text" name="Telefon" id="idTelefon" value=""  maxlength="9" onkeypress="return valida(event)" onblur="validarTelefon()" required /><span><font color="silver"> *</font></span><span id="comprovaTelefon"> </span>
             <script>      
       function validarTelefon() {
			if ($('#idTelefon').val().length == 0) {
				//alert('Tens que introduïr una ID');
    	    	document.getElementById("comprovaTelefon").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaTelefon").style.color="red";
				document.getElementById("idTelefon").style.borderColor="red";
				document.getElementById("idTelefon").focus();
				idTelefonOk = 0;
    	     	return false;
    	   	}
			if ($('#idTelefon').val().length >= 1 && $('#idTelefon').val().length <= 8) {
				document.getElementById("comprovaTelefon").innerHTML = "<b>El numero de telefon es de 9 xifres.</b>";
				document.getElementById("comprovaTelefon").style.color="red";
				document.getElementById("idTelefon").style.borderColor="red";
				document.getElementById("idTelefon").focus();
				idTelefonOk = 0;
			}
			if ($('#idTelefon').val().length == 9) {
    	    	document.getElementById("comprovaTelefon").innerHTML = "<b>Correcte.</b>";
				document.getElementById("comprovaTelefon").style.color="green";
				document.getElementById("idTelefon").style.borderColor="green";
				idTelefonOk = 1;
			}
			
    	 }
       </script>
        </td>
      </tr>
      <tr>
        <td>
        
          Pagina Web:
          <br/>
          </td>
          <td>

            <input type="text" name="pagWeb" id="idPagWeb" maxlength="30" value="" onblur="validarURL(this.idPagWeb)" required /><span><font color="silver"> *</font></span><span id="comprovaUrl"> </span>
             
  	<script>   
	    function validarURL() {
	    	var Url = document.getElementById("idPagWeb").value;
	    	if ($('#idPagWeb').val().length == 0) {
    	    	document.getElementById("comprovaUrl").innerHTML = "<b>No pots deixar-ho buit (Camp obligatori)!!</b>";
				document.getElementById("comprovaUrl").style.color="red";
				document.getElementById("idPagWeb").style.borderColor="red";
				document.getElementById("idPagWeb").focus();
				idPagWebOk = 0;
    	     	return false;
    	   	}else{
		    	if(is_url(Url)){
		    		document.getElementById("comprovaUrl").innerHTML = "<b>Correcte.</b>";
					document.getElementById("comprovaUrl").style.color="green";
					document.getElementById("idPagWeb").style.borderColor="green";
					idPagWebOk = 1;
		    	}else{
		    		document.getElementById("comprovaUrl").innerHTML = "<b>La URL no es correcta! ha de començar per ftp, http, https..</b>";
		    		
					document.getElementById("comprovaUrl").style.color="red";
					document.getElementById("idPagWeb").style.borderColor="red";
					document.getElementById("idPagWeb").focus();
					idPagWebOk = 0;
		    	}
    	   	}
	    	
	    }

	    function is_url(str) {
	        //Declaramos la expresión regular que se usará para validar la url pasada por parámetro
	        var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
	        //Retorna true en caso de que la url sea valida o false en caso contrario
	        return regexp.test(str);
	     }

    </script> 
            <br/><span><font color="silver">Tens que indicar el protocol ftp://, http://, https://</font></span>
        </td>
      </tr>
      <tr>
        <td>
          ID personalitzada?
          </td>
          <td>
          <input type="radio" name="habilitarDeshabilitar" value="1" onchange="habilitar(this.value);" >Si 
            <input type="radio" name="habilitarDeshabilitar" value="2" onchange="habilitar(this.value);" checked>No
        </td>
      </tr>
      <tr>
        <td>
          ID del Centre:
          </td>
          <td>
            <input type="text" id="iddelcentre" name="idcentre" maxlength="5" onblur="validarIdCentre()" onkeypress="return valida(event)"/> <span name="comprovarNID" id="comprovaID"> </span>

       <script>  
       
       // Desactivem la ID del Centre, ja que per defecte esta com a NO el Check
       	document.getElementById("iddelcentre").disabled=true; // Serveix per deshabilitar el INPUT amb ID...


   	var request;
   	function sendInfo() {
   		var v=document.vinform.idcentre.value;
   		var url="centreAfegirFinal2.jsp?val="+v;

   		if(window.XMLHttpRequest){
   			request=new XMLHttpRequest();
   		}
   		else if(window.ActiveXObject){
   			request=new ActiveXObject("Microsoft.XMLHTTP");
   		}

   		try {
   			request.onreadystatechange=getInfo;
   			request.open("GET",url,true);
   			request.send();
   		}
   		catch(e) {
   			alert("Unable to connect to server");
   		}
   	}

   	function getInfo(){
   		if(request.readyState==4){
   			var val=request.responseText;
   			
   			if(val == 1){
   				document.getElementById("comprovaID").innerHTML = "<b>La ID ja esta ocupada, tria'n una diferent!!</b>";
				document.getElementById("comprovaID").style.color="red";
				document.getElementById("iddelcentre").style.borderColor="red";
				idCentreOk = 0;
   			}
   			
   			if(val == 0){
   				document.getElementById("comprovaID").innerHTML = "<b>Id Lliure! Correcte!!</b>";
				document.getElementById("comprovaID").style.color="green";
				document.getElementById("iddelcentre").style.borderColor="green";
				idCentreOk = 1;
				
   			}
   			

   	}
   }

	    function validarIdCentre() {
	    	
	 	   sendInfo();
	 	   
			if ($('#iddelcentre').val().length == 0) {
			 	    	document.getElementById("comprovaID").innerHTML = "<b>No pots deixar-ho buit si es marca 'Si' adalt.!!</b>";
				document.getElementById("comprovaID").style.color="red";
				document.getElementById("iddelcentre").style.borderColor="red";
				document.getElementById("iddelcentre").focus();
			 	   	}
			
			if ($('#iddelcentre').val().length >= 1) {
			 	    	document.getElementById("comprovaID").innerHTML = "<b>Comprovant...</b>";
				document.getElementById("comprovaID").style.color="silver";
				document.getElementById("iddelcentre").style.borderColor="silver";
			}
			
		}

	</script>
            

        </td>
      </tr>
    </table>
       <span><font color="silver">* Obligatori</font></span>
    <br><br>
 
    <table border="0">
      <tr>
        <td>
          <input type="submit" value="Enviar" id="enFor" class="btn btn-success"/>

          </td>
          <td>
            <input type="reset" value="Netejar" class="btn btn-danger"/>
        </td>
      </tr>
    </table>
    </p>
</form>
<!-- /. ROW  -->
<hr />
<!-- /. ROW  -->  
</div>
 <!-- /. PAGE INNER  -->
</div>
<br><br>
         <!-- /. PAGE WRAPPER  -->
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
    <script src="../assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../assets/js/custom.js"></script>
</body>
</html>