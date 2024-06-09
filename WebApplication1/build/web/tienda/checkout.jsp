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
                        <li><a href="tiendaindexController?accion=index" >Inicio</a> </li>
                        <li  class="active"><a >Checkout</a></li>
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

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <div class="section-title">
          <form action="carritoController?accion=gcompra" method="POST"  >
                                <h3 class="title">Datos Adicionales</h3>
                            </div>
                            <input class="input" type="hidden" name="id_cliente" value="<%=session.getAttribute("id_cliente")%>" readonly >
                            <div class="form-group">
                                <input class="input" type="text" name="nombre" value ="<%=session.getAttribute("nombre_cliente")%>" readonly  >
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="apellido" value ="<%=session.getAttribute("apellido_cliente")%>" readonly>
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="correo" value ="<%=session.getAttribute("user_cliente")%>" readonly >
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="direccion" placeholder="Direccion" required  >
                            </div>
                            <div class="form-group">
                                <input class="input" type="tel" name="telefono"value ="<%=session.getAttribute("telefono_cliente")%>"  placeholder="Telefono" required >
                            </div>
                        </div>
                        <!-- /Billing Details -->

                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Tu orden</h3>
                        </div>
                        <div class="order-summary">
                            <div class="order-col">
                                <div><strong>PRODUCTOS</strong></div>
                                <div><strong>TOTAL</strong></div>
                            </div>
                            <div class="order-products">
                                <c:forEach var="car" items="${carrito}">
      
                                    <div class="order-col">

                                        <div><c:out  value="${car.cantidad}x ${car.nombre}"  /></div>
                                        <div><c:out  value="${car.precio_compra}"  /></div>
                                        
                                    </div>
                                </c:forEach>
                            </div>
                            
                               <input type="hidden" name="total" value="<c:out value="${totalpagar}" />">

                            <div class="order-col">
                                <div>Envio</div>
                                <div><strong>Gratis</strong></div>
                            </div>
                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total">S./<c:out value="${totalpagar}" /></strong></div>
                            </div>
                        </div>
                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio"  value="1" name="tipopago"  id="payment-1">
                                <label for="payment-1">
                                    <span></span>
                                    Tarjeta de Debito o Credito
                                </label>
                                <div class="caption">
                                    <p>Ingresar Datos de Tarjeta</p>
                                    <label for="tarjeta" class="form-label" >Numero de Tarjeta :</label>
                                    <input type="type"  id="tarjeta" name="tarjeta"class="form-control"  placeholder="xxx-xxx-xxx-xxx"  >
                                    <label for="fecha" class="form-label">Fecha de vencimiento:</label>
                                    <input type="date" id="fecha" class="form-control" name="fecha"  >
                                    <label for="ccv" class="form-label">CCV</label>
                                    <input type="text" id="ccv" class="form-control" name="ccv"  >
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" value="2" name="tipopago" id="payment-3">
                                <label for="payment-3">
                                    <span></span>
                                    Pago Contra entrega
                                </label>
                                <div class="caption">
                                    <p>Usted pagara la compra cuando los productos haya llegado como delivery.</p>
                                </div>
                            </div>
                        </div>
                        <input type="submit"class="btn  primary-btn order-submit" name="comprar" value="Generar Compra"  >
                    </div>

                    <!-- /Order Details -->
                    </form>
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

