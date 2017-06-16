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
     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<% 
	Activitat activitat = new Activitat();
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
                    <li>
                        <a href="tutors.jsp"><i class="fa fa-book"></i>Tutors</a>
                    </li>

                    <li>
                        <a href="centre.jsp"><i class="fa fa-university "></i>Centres </a>
                    </li>
                    <li class="active-link">
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
                     <h2>Gestió d'activitats</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  <h3>Alta d'activitat</h3>
                <div class="row">
                    
                    
                    <form class="form-horizontal">
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="id">ID:</label>
                            <div class="col-lg-1">
                                <select type="text" class="form-control" id="id">
                                    <option><%=activitat.getId()%></option>
                                </select>
                            </div>
                            <!-- <label class="control-label col-lg-1" for="auto">Nova ID:</label> 
                            <div class="col-lg-1">
                                <input type="text" class="form-control" id="newid">
                            </div>-->
                        </div>
                        <div class="col-lg-2"></div>
                       
                        <br>
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="codi">Codi:</label>
                            <div class="col-lg-4">
                                <select class="form-control" id="codi">
                                    <option disabled selected>Select an option</option>
                                    <option>EXC (Excursió)</option>
                                    <option>TLL (Taller)</option>
                                    <option>TBL (Treball)</option>
                                </select>
                            </div>
                        </div>
                        
                        <br>
                        <div class="col-lg-2"></div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="desc">Descripció:</label>
                            <div class="col-lg-4">
                                <textarea class="form-control" rows="5" id="desc"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-7"></div>
                        <!--div class="col-lg-2"-->
                        <button type="submit" class="btn btn-default col-lg-1">Enviar</button>
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
        </div>
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2014 yourdomain.com | Design by: <a href="http://binarytheme.com" style="color:#fff;" target="_blank">www.binarytheme.com</a>
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