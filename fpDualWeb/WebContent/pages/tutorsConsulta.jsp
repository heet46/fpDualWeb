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
                  <a href="login.jsp" style="color:#fff;">LOGOUT</a>  

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
                     <h2>Consultar tutors</h2>   
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
                        <div class="container bootstrap snippet">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="main-box no-header clearfix">
                                        <div class="main-box-body clearfix">
                                            <div class="table-responsive">
                                                <table class="table user-list">
                                                    <thead>
                                                        <tr>
                                                        <th><span>Usuari</span></th>
                                                        <th><span>NIF</span></th>
                                                        <th><span>Data</span></th>
                                                        <th class="text-center"><span>Estat</span></th>
                                                        <th><span>E-mail</span></th>
                                                        <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Prova1
                                                            </td>
                                                            <td>12345678B</td>
                                                            <td>2013/08/12</td>
                                                            <td class="text-center">
                                                                <span class="label label-default">Pendent</span>
                                                            </td>
                                                            <td>
                                                                marlon@brando.com
                                                            </td>
                                                            <td style="width: 20%;">
                                                                <a href="#" class="table-link">
                                                                    <span class="fa-stack">
                                                                        <i class="fa fa-square fa-stack-2x"></i>
                                                                        <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                                    </span>
                                                                </a>
                                                        </tr>
                                                        <%@page import="model.TutorDAO,model.Usuari" %>
                                                        <%
                                                        	TutorDAO tDAO=new TutorDAO();
                                                        	Usuari[] usu=tDAO.consultaTutor();
                                                        	for(Usuari u:usu){
                                                        		out.println("<tr>");
                                                        		out.println("<td>");
                                                        		u.getNom();
                                                        		out.println("</td>");
                                                        		out.println("<td>");
                                                        		u.getNIF();
                                                        		out.println("</td>");
                                                        		out.println("<td>");
                                                        		out.println("</td>");
                                                        	}
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                    &copy;  2017 yourdomain.com | Design by: Joan Espuñes, Sergi Fernàndez, Sisco Navarro, Thiago Hachikyan
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