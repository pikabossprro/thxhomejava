<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.Conexion" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
        <title>Panel de Administración</title>
        <link href="tienda/img/logo2.png" rel="icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!--------- cdn bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet"  href="css/style.css" />
        <script src="https://kit.fontawesome.com/677389c586.js" crossorigin="anonymous"></script>
</head>
    
 <body>
          <%
          HttpSession sesion = request.getSession();
          if (sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
             response.sendRedirect("index.jsp");
             
                
     }
          
     %>

        <div class="main-container d-flex">
            <div class="sidebar" id="side_nav" style="background-color: #398439">
                <div class="header-box px-2 pt-3 pb-4 d-flex justify-content-between">
                    <img src="IMG/logo2.png" width="150px">
                    <button class="btn d-md-none d-block close-btn px-1 py-0 text-white"><i class="fa-solid fa-bars"></i></button>
                </div>
            
                <ul class="list-unstyled px-2 mt-5 ">
                    <li><a class="text-decoration-none px-3 py-2 d-block mb-2 " href="dashboardController?accion=index">Dashboard</a> </li>
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
                    
                    <li data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent3" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2">Almacen</a>
                    
                    </li>
                    
                    <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent3"  >
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="productoController?accion=index">Productos</a> </li>
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="categoriaController?accion=index">Categorias</a></li>
                    </ul>
                    
                    <li class="active "  data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent4" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" ><a class="text-decoration-none px-3 py-2 d-block mb-2">Ventas</a>
                       
                    
                    </li>
                    
                     <ul class=" list-unstyled collapse navbar-collaps" id="navbarSupportedContent4" >
                        <li class="nav-item" > <a class="text-decoration-none px-5 py-2 d-block" href="pedidoController?accion=index">Ventas</a> </li>
                        <li  class="nav-item"> <a class="text-decoration-none px-5 py-2 d-block" href="clienteController?accion=index">Clientes</a></li>
                    </ul>
                    
                </ul>
                <hr class="h-color mx-2">
                
            </div>
            <div class="content" >
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
                
           <div class="container">
            <div class="row bg-dark">
                <div class="col">
                    <h1 class="text-white" >Modificar Datos del Cliente</h1>
                </div>
            </div>
            
            <div class="row mt-3  mb-3 mx-2">
                <div class="col">
                    <a href="clienteController?accion=index" ><button type="button" class="btn btn-outline-primary" >Volver</button></a>
                </div>
            </div>
               <div class="row d-flex justify-content-center  bg-white mx-2 py-5">
                   <div class="  col-xl-10 col-12 col-lg-6 col-md-6 " >
                    <form action="clienteController?accion=actualizar" method="POST">
                        <div class="row" >
                            <input type="hidden" name="id" class="form-control" value="<c:out  value="${cliente.id_cliente}" />" id="id" >
                           <div class="col-xl-6 mb-3">
                               <label for="apellido" class="form-label">Apellido</label>
                               <input type="text" name="apellido" class="form-control" id="apellido" value="<c:out  value="${cliente.apellido}" />"   readonly  >
                           </div>
                          <div class="col-xl-6 mb-3">
                               <label for="nombre" class="form-label">Nombre</label>
                               <input type="text" name="nombre" class="form-control" id="nombre" value="<c:out  value="${cliente.nombre}" />" readonly  >
                           </div> 
                            <div class="col-xl-6 mb-3 ">
                               <label for="correo" class="form-label">Correo</label>
                               <input type="text" name="correo" class="form-control" id="correo" value="<c:out  value="${cliente.email}" />" readonly  >
                           </div>                               
                           <div class="mb-3 col-xl-6">                       
                   
                               <label for="clave" class="form-label text-danger" >Contraseña</label>
                               <input type="text"name="clave" class="form-control" id="clave" value="<c:out  value="${cliente.contraseña}" />" >
                           </div>
                              
                           <div class="mb-3 col-xl-6">
                               <label for="telefono" class="form-label">Telefono</label>
                               <input type="telefono"name="telefono" class="form-control" id="telefono" value="<c:out  value="${cliente.telefono}" />" readonly  >
                           </div>               
                        </div>
                           <input type="submit" class="btn btn-success my-4" name="accion"value="actualizar" >
                           <a class="btn btn-danger" href="clienteController?accion=index">Cancelar</a>
                       </form>
                   </div>
               </div>                    
            </div>               
        </div> 
         <!--------- links cdn javascrips -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="js/main.js"></script>
    </body>        
</html>