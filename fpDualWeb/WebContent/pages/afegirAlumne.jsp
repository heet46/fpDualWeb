<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registre d'hores</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
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
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../index.html">
                        <img src="../assets/img/logo.png" height="50px" />
                    </a>
                </div>
              
                 <span class="logout-spn" >
                  <a href="#" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 
                    <li>
                        <a href="../index.html" ><i class="fa fa-desktop "></i>Inici </a>
                    </li>

                    <li class="active-link">
                        <a href="#"><i class="fa fa-graduation-cap "></i>Alumnes</a>
                    </li>
                    <li>
                        <a href="tutors.html"><i class="fa fa-book"></i>Tutors</a>
                    </li>

                    <li>
                        <a href="centre.html"><i class="fa fa-university "></i>Centres </a>
                    </li>
                    <li>
                        <a href="activitats.html"><i class="fa fa-list "></i>Activitats</a>
                    </li>
                </ul>
            </div>


        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                
                <div class="row">
                    <div class="col-md-12">
                     <h2>Alta d'alumnes </h2>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  
                <div class="row">
                    <div class="col-md-12">
                     <h4>Formulari d'alta alumnes </h4>
                    </div>
                </div>  
                <form>
                <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="D.N.I." />
                        </div>
                        <div class="col-md-6">
                            <input type="password" class="form-control" placeholder="Contrassenya" />
                        </div>
                </div>
                <br>
                <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Nom" />
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Cognoms" />
                        </div>
                </div>
                <br>
                <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Correu electrònic" />
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="Cognoms" />
                        </div>
                </div>
                <hr>
                <div class="row">
                        <div class="col-md-6">
                            <h5>Data inicial</h5>
                            <input type="date" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5>Data finalització</h5>
                            <input type="date" class="form-control" />
                        </div>
                </div>
                <hr>
                <div class="row">
                        <div class="col-md-6">
                            <h5>Tutor</h5>
                            <select class="form-control" name="size">
                                <option value="">Selecciona el tutor</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <h5>Centre</h5>
                            <select class="form-control" name="size">
                                <option value="">Selecciona el centre</option>
                            </select>
                        </div>
                </div>
                
                </form>
                
            
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>