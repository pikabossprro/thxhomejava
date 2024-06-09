<%@page import="utilitarios.Conexion"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Jardin de Flores</title>
        <link href="tienda/img/logo2.png" rel="icon">


        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- CDN Bootstrap -->
        <link type="text/css" rel="stylesheet" href="tienda/css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="tienda/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="tienda/css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="tienda/css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <script src="https://kit.fontawesome.com/677389c586.js" crossorigin="anonymous"></script>

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="tienda/css/style.css"/>



    </head>

    <body>
        <!-- HEADER -->
        <header class="d-flex justify-content-center" >
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +51 123456789</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> jardindeflores@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> Lima-Perú</a></li>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="tiendaindexController?accion=index" class="logo">
                                    <img src="tienda/img/logo2.png" width="110px" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form>
                                    <input class="input" placeholder="Buscar aqui">
                                    <button class="search-btn">Buscar</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div>
                                    <a href="#">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Carrito</span>
                                        <div class="qty"></div>
                                    </a>
                                </div>
                                <!-- /Cart -->
                              <div class="dropdown" >
                                     <i class="fa-solid fa-user" ></i><i class="fa-solid fa-circle-chevron-down"></i>
                                    <% 
                                        HttpSession sesiontienda = request.getSession();
                                        if (sesiontienda.getAttribute("logueado")== null || sesiontienda.getAttribute("logueado").equals("0")){
                                                                    
                                         
                                        }
                                        else{
                                                out.print("<p><b>" + session.getAttribute("nombre_cliente"));
                                        
                                            }
                                        %>   
                                        
                                        <div class="dropdown-content">
                                        <% 
                                        if (sesiontienda.getAttribute("logueado")== null || sesiontienda.getAttribute("logueado").equals("0")){
                                             out.print("<a href='tiendaloginController?accion=login' class='btn btn-success'> Iniciar Sesion </a>");                                 
                                        }
                                        else{
                                                out.print("<p><a href='#' class=''  >Configurar </a></p>");
                                                out.print("<p><a href='tiendapedidosController?accion=index'>Mis pedidos</a></p> ");
                                                out.print(""
                                                + "<form method='post' >"
                                                + "<input type='submit' name='log-out' class='btn btn-danger'  value='Cerrar sesion'> "
                                                +"</form>"
                                                );

                                                if(request.getParameter("log-out")!=null){
                                                     sesiontienda.invalidate();
                                                     response.sendRedirect("tiendaindexController?accion=index");
                                            }
                                            }
                                        %>      
                                         </div>
                                        
                                </div>
                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a >Inicio</a> </li>
                        <li  class="active"><a >Iniciar Sesion</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
<style>
        




.tab-group a {
  text-decoration:none;
  transition:.5s ease;
}

.tab-group a:hover {

    color:red;
}
 .form {
  padding: 40px;
  max-width:600px;
  margin:40px auto;
  border-radius:$br;
  box-shadow:0 4px 10px 4px rgba($form-bg,.3);
}

.tab-group {
    
  list-style:none;
  padding:0;
  margin:0 0 40px 0;

  &:after {
    content: "";
    display: table;
    clear: both;
  }
 
}

.tab-group  li a {
    display:block;
    text-decoration:none;
    padding:15px;
    font-size:20px;
    float:left;
    width:50%;
    text-align:center;
    cursor:pointer;
    transition:.5s ease;
    &:hover {
      background:$main-dark;
      color:$white;
    }
  }


.tab-content > div:last-child {
  display:none;
}


h1 {
  text-align:center;
  color:$white;
  font-weight:$thin;
  margin:0 0 40px;
}

label {
  position:absolute;
  transform:translateY(6px);
  left:13px;
  transition:all 0.25s ease;
  -webkit-backface-visibility: hidden;
  pointer-events: none;
  font-size:22px;
  .req {
  	margin:2px;
  	color:$main;
  }
}

label.active {
  transform:translateY(50px);
  left:2px;
  font-size:14px;
  .req {
    opacity:0;
  }
}

label.highlight {
	color:$white;
}

.div-form input , textarea {
  font-size:22px;
  display:block;
  width:100%;
  height:100%;
  padding:5px 10px;
  border:1px solid $gray-light;
  color:$white;
  border-radius:0;
  transition:border-color .25s ease, box-shadow .25s ease;
}

textarea {
  border:2px solid $gray-light;
  resize: vertical;
}

.field-wrap {
  position:relative;
  margin-bottom:40px;
}

.top-row {
  &:after {
    content: "";
    display: table;
    clear: both;
  }

  > div {
    float:left;
    width:48%;
    margin-right:4%;
    &:last-child { 
      margin:0;
    }
  }
}

.button {
  border:0;
  outline:none;
  border-radius:0;
  padding:15px 0;
  font-size:2rem;
  font-weight:$bold;
  text-transform:uppercase;
  letter-spacing:.1em;
  color:white;
  background:#ff1717;
  transition:all.5s ease;
  -webkit-appearance: none;
  &:hover, &:focus {
   background:$main-dark;
   
  }
}
 .button-block {
  display:block;
  width:100%;
}

.forgot {
  margin-top:-20px;
  text-align:right;
}

                        .dropdown {
                         position: relative;
                          display: inline-block;
                          color: white;
                          text-align: center;
                         
                        }
                        .dropdown i{
                            
                            font-size: 20px;
                            
                            
                        }

                        .dropdown-content {
                            color: black;
                          display: none;
                          position: absolute;
                          background-color: #f9f9f9;
                          min-width: 160px;
                          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                          padding: 12px 16px;
                          z-index: 1;
                          text-align: center;
                        }

                        .dropdown:hover .dropdown-content {
                          display: block;
                        }
              
        
    </style>
    <div class="div-form">
            <div class="form">

                <ul class="tab-group">
                    <li class="tab"><a href="#login">Iniciar Sesion</a></li>
                     <li class="tab active"><a href="#signup">Crear Cuenta</a></li>
                </ul>

                <div class="tab-content">
                    
                    <div id="login">   
                        <h1>Iniciar Sesion</h1>

                        <form method="post">

                            <div class="field-wrap">
                                <label>
                                   Correo<span class="req">*</span>
                                </label>
                                <input name="correo" type="email"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Contraseña<span class="req">*</span>
                                </label>
                                <input name="clave" type="password"required autocomplete="off"/>
                            </div>

                            <p class="forgot"><a href="#">Forgot Password?</a></p>

                            <input type="submit" class="button button-block" name="login" value="Iniciar Sesion"   />                           
               <%
                           Connection con = null;
                           Conexion cn = new Conexion();
                           Statement st = null;
                           ResultSet rs = null;
                           String usuario = "root";
                           String clavesql = "";                                
                         if (request.getParameter("login") != null) {
                               
                               String correo = request.getParameter("correo");
                               String clave = request.getParameter("clave");

                               try {
                                   Class.forName("com.mysql.jdbc.Driver");
                                   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_megamarket", usuario, clavesql);
                                   st = con.createStatement();
                                   rs = st.executeQuery("select id_cliente,Nombre,Apellido,Email,telefono ,contraseña FROM cliente  \n"
                                           + " WHERE Email = '" + correo + "' && contraseña='" + clave + "' ");
                                           
                                   while (rs.next()) {
                                               
                                             sesiontienda.setAttribute("logueado", "1");
                                                sesiontienda.setAttribute("user_cliente", rs.getString("Email"));
                                               sesiontienda.setAttribute("id_cliente", rs.getInt("id_cliente"));
                                               sesiontienda.setAttribute("nombre_cliente", rs.getString("Nombre"));
                                               sesiontienda.setAttribute("apellido_cliente", rs.getString("Apellido"));
                                               sesiontienda.setAttribute("telefono_cliente", rs.getString("telefono"));
                                               response.sendRedirect("tiendaindexController?accion=index");
                                               out.print("<div class='alert alert-danger' role='alert' >" + correo + "</div>");

                                           }


                                   out.print("<div class='alert alert-danger' role='alert' >Datos no registrados</div>");

                               } catch (Exception e) {

                                   System.out.print(e);

                               }
                           }
               %>
                        </form>

                    </div>
                    
                    
                    <div id="signup">   
                        <h1>Crear Cuenta</h1>

                        <form action="tiendaloginController?accion=create" method="post">
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label>
                                        Nombre<span class="req">*</span>
                                    </label>
                                    <input name="nombre" type="text" >
                                </div>
                                <div class="field-wrap">
                                    <label>
                                        Apellidos<span class="req">*</span>
                                    </label>
                                    <input name="apellido" type="text" />
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Correo<span class="req">*</span>
                                </label>
                                <input name="correo" type="email"required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                   Crear Contraseña<span class="req">*</span>
                                </label>
                                <input name="clave" type="password"required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Telefono<span class="req">*</span>
                                </label>
                                <input name="telefono" type="text"required autocomplete="off"/>
                            </div>

                            <button type="submit" class="button button-block "/>Crear Cuenta</button>

                        </form>

                    </div>


                </div><!-- tab-content -->

            </div> <!-- /form -->
</div>
        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">

                            <img src="tienda/img/logo2.png" width="150px">
                        </div>
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Sobre Nosotros</h3>
                                <p>Somos una empresa que vende arreglos florales</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>Lima-Peru</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+51 123456789</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>jardindeflores@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>


                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Informacion</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Nosotros</a></li>
                                    <li><a href="#">Politicas de Provacidad</a></li>
                                    <li><a href="#">Terminos y condiciones</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Servicios</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Delivery</a></li>
                                    <li><a href="#">Pedidos contra entrega</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> Derechos Reservados Jardin de Flores
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->
        <!-- jQuery Plugins -->
        <script src="tienda/js/jquery.min.js"></script>
        <script src="tienda/js/bootstrap.min.js"></script>
        <script src="tienda/js/slick.min.js"></script>
        <script src="tienda/js/nouislider.min.js"></script>
        <script src="tienda/js/jquery.zoom.min.js"></script>
        <script src="tienda/js/main.js"></script>
        
        <script>
            
            $('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});
            
            
            
        </script>

    </body>
</html>

