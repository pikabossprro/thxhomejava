
<%@page import="Modelo.carrito"%>
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
    <style>
        
/*carrusel*/
            .slide {
                position: relative;
                box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.64);
                margin-top: 26px;
            }
            .slide-inner {
                position: relative;
                overflow: hidden;
                width: 100%;
                height: calc( 400px + 3em);
            }
            .slide-open:checked + .slide-item {
                position: static;
                opacity: 100;
            }
            .slide-item {
                position: absolute;
                opacity: 0;
                -webkit-transition: opacity 0.6s ease-out;
                transition: opacity 0.6s ease-out;
            }
            .slide-item img {
                display: block;
                height: auto;
                max-width: 100%;
            }
            .slide-control {
                background: rgba(0, 0, 0, 0.28);
                border-radius: 50%;
                color: #fff;
                cursor: pointer;
                display: none;
                font-size: 40px;
                height: 40px;
                line-height: 35px;
                position: absolute;
                top: 50%;
                -webkit-transform: translate(0, -50%);
                cursor: pointer;
                -ms-transform: translate(0, -50%);
                transform: translate(0, -50%);
                text-align: center;
                width: 40px;
                z-index: 10;
            }
            .slide-control.prev {
                left: 2%;
            }
            .slide-control.next {
                right: 2%;
            }
            .slide-control:hover {
                background: rgba(0, 0, 0, 0.8);
                color: #aaaaaa;
            }
            #slide-1:checked ~ .control-1,
            #slide-2:checked ~ .control-2,
            #slide-3:checked ~ .control-3 {
                display: block;
            }
            .slide-indicador {
                list-style: none;
                margin: 0;
                padding: 0;
                position: absolute;
                bottom: 2%;
                left: 0;
                right: 0;
                text-align: center;
                z-index: 10;
            }
            .slide-indicador li {
                display: inline-block;
                margin: 0 5px;
            }
            .slide-circulo {
                color: #828282;
                cursor: pointer;
                display: block;
                font-size: 35px;
            }
            .slide-circulo:hover {
                color: #aaaaaa;
            }
            #slide-1:checked ~ .control-1 ~ .slide-indicador 
                 li:nth-child(1) .slide-circulo,
            #slide-2:checked ~ .control-2 ~ .slide-indicador 
                  li:nth-child(2) .slide-circulo,
            #slide-3:checked ~ .control-3 ~ .slide-indicador 
                  li:nth-child(3) .slide-circulo {
                color: #428bca;
            }
            #titulo {
                width: 100%;
                position: absolute;
                padding: 0px;
                margin: 0px auto;
                text-align: center;
                font-size: 27px;
                color: rgba(255, 255, 255, 1);
                font-family: 'Open Sans', sans-serif;
                z-index: 9999;
                text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.33), 
                     -1px 0px 2px rgba(255, 255, 255, 0);
            }

        
        
    </style>
    
    
    <body>
        <!-- HEADER -->
        <header class="d-flex justify-content-center"  >
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
                        <!-- css para el dropdown -->
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
                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div>
                                    <a href="carritoController?accion=carrito">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Carrito</span> 

                                        <div class ='qty'><c:out value="${contador}"/></div>
                                             
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
                                                out.print("<p><a href='tiendapedidosController?accion=index'>Mis pedidos</a></p>");
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
                  <li><a href="tiendacategoriaController?accion=mostrar&id=<c:out  value="${categoria.id_categoria}" />"><c:out value="${categoria.nombre}"  /></a></li>
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
        <div class="section ">
            <div class="slide">
                <div class="slide-inner">
                    <input class="slide-open" type="radio" id="slide-1" 
                           name="slide" aria-hidden="true" hidden="" checked="checked">
                    <div class="slide-item">
                        <img src="https://www.floreriamiraflores.com/img/banner-regalo.jpg">
                    </div>
                    <input class="slide-open" type="radio" id="slide-2" 
                           name="slide" aria-hidden="true" hidden="">
                    <div class="slide-item">
                        <img src="https://www.floreriamiraflores.com/img/linea-tulipanes.jpg" width="100%">
                    </div>
                    <label for="slide-3" class="slide-control prev control-1">‹</label>
                    <label for="slide-2" class="slide-control next control-1">›</label>
                    <label for="slide-1" class="slide-control prev control-2">‹</label>
                    <label for="slide-3" class="slide-control next control-2">›</label>
                    <label for="slide-2" class="slide-control prev control-3">‹</label>
                    <label for="slide-1" class="slide-control next control-3">›</label>
                    <ol class="slide-indicador">
                        <li>
                            <label for="slide-1" class="slide-circulo">•</label>
                        </li>
                        <li>
                            <label for="slide-2" class="slide-circulo">•</label>
                        </li>
                    </ol>
                </div>
            </div>
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
                            <h3 class="title">Productos</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">

                                        <c:forEach var="producto" items="${lista}">
                                        <!-- product -->
                                        <div class="product">
                                            <a href="productodetallesController?accion=detalle&id=<c:out value="${producto.id_producto}"/>"">
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
                                               <a href="carritoController?accion=agregar&id=<c:out  value="${producto.id_producto}" />" class="btn add-to-cart-btn"><i class="fa fa-shopping-cart "></i>Agregar</a>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        <!-- /product -->

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hotdeal"   >
            
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hotdeal">
                            <ul class="hotdeal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Días</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Horas</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Minutos</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Segundos</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">Gran Oferta esta Semana</h2>
                            <a class="primary-btn cta-btn" href="#">Compra ahora</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Favoritos</h3>
 
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
                                            <a href="productodetallesController?accion=detalle&id=<c:out value="${producto.id_producto}"/>">
                                            <div class="product-img">
                                                <img  src="<c:out value="${producto.imagen}"/>" alt="">
                                            </div>
                                            </a>
                                            <div class="product-body">
                                                <p class="product-category"> <c:out value="${producto.categoria}"/> </p>
                                                <h3 class="product-name"> <c:out value="${producto.nombre}"/></h3>
                                                <h4 class="product-price">S/.<c:out value="${producto.precio}"/> </h4>
                                            </div>
                                            <div class="add-to-cart">
                                               <a href="carritoController?accion=agregar&id=<c:out  value="${producto.id_producto}" />" class="btn add-to-cart-btn"><i class="fa fa-shopping-cart "></i>Agregar</a>
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
                                    <li><a href="#"><i class="fa fa-envelope-o"></i> jardindeflores@gmail.com</a></li>
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
