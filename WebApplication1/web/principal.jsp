<%@page import="Modelo.pedido"%>
<%@page import="Modelo.pedidoDAO"%>
<%@page import="Modelo.producto"%>
<%@page import="Modelo.productoDAO"%>
<%@page import="Modelo.clienteDAO"%>
<%@page import="Modelo.cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
        <title>Panel de Administración</title>
        <link href="tienda/img/logo2.png" rel="icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!--------- cdn bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
                <link rel="stylesheet" href="css/style.css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
       
        <script src="https://kit.fontawesome.com/677389c586.js" crossorigin="anonymous"></script>
     
        
               <!--CDN PARA DATATABLE -->
        
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.4/css/buttons.dataTables.min.css">
                
       <!--cdns para tabla responsive -->
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.3.1/css/fixedHeader.bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap.min.css">
        
</head>
 <body>
     
     <%
          HttpSession sesion = request.getSession();
          if (sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
             response.sendRedirect("index.jsp");
     }
          
     %>
     
        <div class="main-container d-flex">
            <div class="sidebar" id="side_nav" style="background-color: #398439" >
                <div class="header-box px-2 pt-3 pb-4 d-flex justify-content-between">
                    <img src="IMG/logo2.png" width="150px">
                    <button class="btn d-md-none d-block close-btn px-1 py-0 text-white"><i class="fa-solid fa-bars"></i></button>
                </div>
                
            
                <ul class="list-unstyled px-2 mt-5 ">
                    <li class="active " ><a class="text-decoration-none px-3 py-2 d-block mb-2 "href="dashboardController?accion=index">Dashboard</a> </li>
                    <li data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2 " href="#" >Mantenimiento</a>

                    </li>
                                                            
                    <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent1">
                        <li class="active nav-item" ><a class="text-decoration-none px-5 py-2 d-block" href="empleadoController?accion=index">Empleados</a></li>
                        <li class=" nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="usuarioController?accion=index">Usuarios</a> </li>
                        
                    </ul>
                    
                    <li data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2">Compras</a>
                    

                        
                    </li>
                    <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent2">
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="ingresoController?accion=index">Ingreso</a> </li>
                        <li class="nav-item" ><a class="text-decoration-none px-5 py-2 d-block" href="proveedorController?accion=index">Proveedores</a></li>
                    </ul>
                    
                    <li   data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent3" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2">Almacen</a>
                    
                    </li>
                    
                    <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent3"  >
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="productoController?accion=index">Productos</a> </li>
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="categoriaController?accion=index">Categorias</a></li>
                    </ul>
                    
                    <li data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent4" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2">Ventas</a>
                       
                    
                    </li>
                    
                     <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent4" >
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="pedidoController?accion=index">Ventas</a> </li>
                        <li  class="nav-item"> <a class="text-decoration-none px-5 py-2 d-block" href="clienteController?accion=index">Clientes</a></li>
                    </ul>
                    
                </ul>
                <hr class="h-color mx-2"/>
            </div>
            <div class="content " >
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <div class="d-flex  justify-content-between d-md-none d-block"  >
                            <a class="navbar-brand fs-4" href="#">Mega Market</a>
                            <button class="btn px-1 py-0 open-btn"><span class="navbar-toggler-icon"></button>
                        </div>
                        <button class="navbar-toggler p-0 border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                            <ul class="navbar-nav  mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="tiendaindexController?accion=index">Ir a tienda</a>
                                </li>
                                <li class="nav-item">
                                    <div  class="dropdown">
                                    <a class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false"><%=session.getAttribute("nombre")%> <i class="fa-solid fa-user fs-4"></i> </a>
                                    <ul  class="dropdown-menu dropdown-menu-lg-end ">
                                    <form  class="text-center " action="logout.jsp" >
                                        <li><h1 class="fs-6 text-black"><%=session.getAttribute("usuario")%></h1></li>
                                            <li><a class="btn p-3  text-black " href="#">Configurar</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><input type="submit" class=" btn btn-danger text-white" value="Cerrar Sesion"></li>
                                    </form>
                                    </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
           <div class="container-fluid px-4">
            <div class="row bg-dark">
                <div class="col">
                    <h1 class="text-white" >Dashboard </h1>
                    <h1 class="text-white fs-6" >Bienvenido al Sistema de Administración de Jardín de Flores</h1>
                </div>
            </div>
               <div class="row py-4 ">
                   
                   <div class="col-xl-3 col-12 col-md-6 d-flex  justify-content-center  ">       
                       
                       <div class="card text-bg-primary  text-white mb-3" style="width:90%;">
                           <div class="card-body py-5">
                                <div class="row">
                                    <div class="col">
                                      <h1 class="fs-5" >Productos</h1>
                                  </div>
                                  <div class="col">
                                      
                                   <h1 class="fs-5" ><%
                                       
                                        productoDAO productoDAO=new productoDAO();
                                        List<producto> listaproducto=productoDAO.listarproducto();  
                                        int nroproductos= listaproducto.size();
                                         out.print(nroproductos);    
                                       
                                 %></h1>
                                  </div>  
                                 <div class="col">  
                                      <i class=" fs-2 fa-solid fa-box"></i>
                                   </div>
                                 </div>
                           </div>
                           <div class="card-footer ">
                             <div class="row" >
                                 <div class="col-10">
                                  <a  class="text-white"  href="productoController?accion=index" >Ver mas </a>
                                 </div>
                                  <div class="col-2">
                                  <i class="fa-solid fa-chevron-right"></i>
                                 </div>
                               </div>                          
                           </div>
                       </div>

                   </div>
                   
                   <div class="col-xl-3 col-12 col-md-6 d-flex justify-content-center ">                           
                       <div class="card text-bg-warning  text-white mb-3 " style="width:90% ;">
                           <div class="card-body py-5">
                                <div class="row">
                                    <div class="col">
                                      <h1 class="fs-5" >Clientes</h1>
                                  </div>
                                  <div class="col">  
                                      <h1 class="fs-5" ><%
                                         clienteDAO clienteDAO=new clienteDAO();
                                        List<cliente> listacliente=clienteDAO.listarcliente();  
                                       

                                        int nroclientes= listacliente.size();
                                         out.print(nroclientes);
                                          
                                          
                                          %></h1>
                                  </div>  
                                 <div class="col">  
                                      <i class=" fs-2 fa-solid fa-user"></i>
                                   </div>
                                 </div>
                           </div>
                           <div class="card-footer ">
                             <div class="row" >
                                 <div class="col-10">
                                  <a   href="clienteController?accion=index" class="text-white"  >Ver mas</a>
                                 </div>
                                  <div class="col-2">
                                  <i class="fa-solid fa-chevron-right"></i>
                                 </div>
                               </div>                          
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-12 col-md-6 d-flex justify-content-center">
                                                 
                       <div class="card text-bg-success  text-white  mb-3" style="width:90%;">
                           <div class="card-body py-5">
                                <div class="row">
                                    <div class="col">
                                      <h1 class="fs-5" >Ventas</h1>
                                  </div>
                                  <div class="col">  
                                      
                                      <h1 class="fs-5" >
                                          <% 
                                              pedidoDAO pedidoDAO = new pedidoDAO();
                                              List<pedido> listapedido = pedidoDAO.listarpedido();

                                              int nropedidos = listapedido.size();
                                              out.print(nropedidos);


                                          %>
                                      </h1>
                                  </div>  
                                 <div class="col">  
                                      <i class=" fs-2 fa-solid fa-bag-shopping"></i>
                                   </div>
                                 </div>
                           </div>
                         <div class="card-footer ">
                             <div class="row" >
                                 <div class="col-10">
                                  <a  href="pedidoController?accion=index" class="text-white">Ver mas</a>
                                 </div>
                                  <div class="col-2">
                                  <i class="fa-solid fa-chevron-right"></i>
                                 </div>
                               </div>
                           </div>
                           
                       </div>

                   </div>
                   <div class="col-xl-3 col-12 col-md-6 d-flex justify-content-center">
                                                 
                       <div class="card text-bg-danger  text-white mb-3"  style="width:90%;">
                           <div class="card-body py-5">
                                <div class="row">
                                    <div class="col">
                                      <h1 class="fs-5" >Ganancias</h1>
                                  </div>
                                  <div class="col">  
                                      <h1 class="fs-6" ><%
                                          double ganancias =0;
                                          for (int i = 0 ; i<listapedido.size() ; i ++ ){
                                                 ganancias= listapedido.get(i).getTotal() + ganancias;
                                                 
                                          }
                                         out.print( "S/"+ganancias);
                                          
                                          %></h1>
                                  </div>  
                                 <div class="col">  
                                      <i class="fs-2 fa-solid fa-chart-line"></i>
                                   </div>
                                 </div>
                           </div>
                           <div class="card-footer ">
                              <div class="row" >
                           </div>
 
                       </div>
                   </div>
                   
               </div>

            </div>
         <div class="container">
            <div class="row  px-4 ">
                <div class="col">
                    <h1 class="fs-5"  >Nuevos Clientes</h1>
                </div>
            </div>
               <div class="row bg-white p-4 ">
                   <div class="col">
                         <table id="datatable" class="table table-striped table-bordered nowrap py-2" style="width:100%"  >
                             <thead class="bg-danger text-white">
                                 <tr>
                                     <th scope="col">Id</th>
                                     <th scope="col">Apellido</th>
                                     <th scope="col">Nombre</th>                                  
                                     <th scope="col">Email</th>
                                     <th scope="col">Contraseña</th>
                                     <th scope="col" >Telefono</th>
                                 </tr>
                             </thead>
                             <tbody>

                                 <c:forEach var="cliente" items="${lista}">
                                     <tr>
                                         <td><c:out value="${cliente.id_cliente}"/></td>
                                         <td><c:out value="${cliente.apellido}" /></td>
                                         <td><c:out value="${cliente.nombre}" /></td>
                                         <td><c:out value="${cliente.email}" /></td>
                                         <td><c:out value="${cliente.contraseña}" /></td>
                                         <td><c:out value="${cliente.telefono}" /></td>
                                     </tr>
                                 </c:forEach>   
                             </tbody>
                         </table>
                   </div>
               </div>
            </div>                                                                   
          </div>                                      
                                            
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<!-- cdn jquery -->
        <script src="https://code.jquery.com/jquery-3.5.3.js"
                   integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
            crossorigin="anonymous"></script>  
            
       <!-- cdn datatable -->
    
          <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
          
        <!-- cdns para los botones de exportacion -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.4/js/dataTables.buttons.min.js"></script>
         <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
         <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
         <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
         <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.html5.min.js"></script>
         <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.print.min.js"></script>
         
        <!--CDNS PARA tabla responsive-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/fixedheader/3.3.1/js/dataTables.fixedHeader.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap.min.js"></script>
    
        <script src="js/main.js"></script>
 
 </body>        
</html>