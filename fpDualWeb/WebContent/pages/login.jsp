<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registre d'hores</title>
  <link rel="stylesheet" href="../assets/css/login.css">
  <!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="../assets/img/favicon-clock-o.ico" />
	<script src="../assets/js/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
    		setTimeout(function() {
        	$(".content").fadeOut(1500);
    		},1500);
		});
	</script>
	
</head>

<body>
<%
int incorrecte;
try{
	incorrecte = Integer.parseInt(session.getAttribute("correcte").toString());
}catch(Exception e){
	incorrecte = 0;
}


%>
  <div class="login-page">
  <div class="form">
  <h2>Sistema de registre d'hores</h2>
    <form class="login-form" method="Post" action="../Login" name="frmLogin">
      <input type="text" name="dni" placeholder="D.N.I."/>
      <input type="password" name="password" placeholder="Contrasenya"/>
      <input type="submit" value="Login" class="boto" />
    </form>
  </div>
  <% if(incorrecte == 1){ %>
  	<div class="content" id="alerta">
  		Error, usuari o contrasenya <strong>incorrectes! </strong>
  	</div>
  <%} %>
</div>

	<script src="assets/js/login.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
	<script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
</body>
</html>