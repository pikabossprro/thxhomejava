
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
<style>
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
                                 <a href="carritoController?accion=carrito">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Carrito</span>
                                  <div class ='qty'><c:out value="${contador}"  /></div>

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
                        <li class="active"><a href="#">Inicio</a></li>
                        <li><a href="tiendaproductosController?accion=index">Productos</a></li>
                  <c:forEach  var="categoria" items="${lista_cat}">
                        <li><a <a href="tiendacategoriaController?accion=mostrar&id=<c:out  value="${categoria.id_categoria}" />"><c:out value="${categoria.nombre}"  /></a> </li>
                 </c:forEach>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->


        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                 <img src="<c:out  value="${producto.imagen}" />" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                 <img src="<c:out  value="${producto.imagen}" />" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name"><c:out  value="${producto.nombre}" /></h2>

                            <div>
                                <h3 class="product-price"><c:out  value="${producto.precio}" /> </h3>
                            </div>
                            <p><c:out  value="${producto.descripcion}" /></p>
     
                            <div class="add-to-cart">
                             <a href="carritoController?accion=agregar&id=<c:out  value="${producto.id_producto}" />" class="btn add-to-cart-btn"><i class="fa fa-shopping-cart "></i>Agregar</a>
                            </div>


                            <ul class="product-links">
                                <li>Compartir</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                            </ul>
                            <!-- /product tab nav -->
                            <!-- product tab content -->
                          
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <p><c:out  value="${producto.descripcion}" /></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Productos Parecidos</h3>
 
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <c:forEach var="producto" items="${lista}">
                                        <!-- product -->
                                       
                                        <div class="product">
                                          <a href="productodetallesController?accion=detalle&id=<c:out value="${producto.id_producto}"/>" >
                                            <div class="product-img">
                                                <img  src="<c:out value="${producto.imagen}"/>" alt="">
                                            </div>
                                         </a>
                                            <div class="product-body">
                                                <p class="product-category"><c:out value="${producto.categoria}"/></p>
                                                <h3 class="product-name"><c:out value="${producto.nombre}"/></h3>
                                                <h4 class="product-price">S/.<c:out value="${producto.precio}"/> </h4>
                                                <div class="product-rating">
                                                </div>

                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

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

    </body>
</html>
