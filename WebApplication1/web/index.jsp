
<%@page import="Modelo.carrito"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.Conexion" %>
<%@page import="java.sql.*" %>
<head>
        <title>Login</title>
        <link href="tienda/img/logo2.png" rel="icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!--------- cdn bootstrap -->
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">       
      <link rel="stylesheet"  href="css/style.css" />
</head>

<style>
    #info{  
        background: #398439;
    }
</style>

 <body>
  <div class="container text-center">
    <div class="row">
            <div class="col-12 col-xl-6 col-md-6 text-white p-4 mt-5 mb-5" id="info">
        <div class="row">
          <div class="col-12 mt-5">
              <img src="chochox/logont-Photoroom.png" alt="20px"/>
          </div>
          <div class="col-12">     
            <h1 class="" >Bienvenido a THX HOME</h1>
            <br>
            <p>Ingrese los datos solicitados para Iniciar Sesion</p>
            </div>
            
           <div class="col-12 mt-5">     
               <a href="tiendaindexController?accion=index" class="btn text-white" 
                  style="padding: 10px; border-radius: 5px; text-decoration: none; background: #4CAF50;">Visita nuestra tienda</a>
            </div>
        </div>
    </div>    
      <div class="col-12 col-xl-6 col-md-6">
        <div class="card my-5 ">
            <form class="card-body cardbody-color p-lg-5"method="post" >

            <div class="text-center">
                   <h2 class="text-center text-dark mt-5 h4 ">Iniciar Sesion </h2>
                   <img src="IMG/login.png" width="250px"alt="alt"/>
            </div>
            <div class="mb-3">
              <input type="text" name="correo" class="form-control" aria-describedby="emailHelp"
                placeholder="Correo">
            </div>
            <div class="mb-3">
              <input type="password" name="clave" class="form-control" id="password" placeholder="Contraseña">
            </div>
                <div class="text-center"><input type="submit" class="btn   text-white px-5 mb-5 w-100" name="login"  value="Ingresar" style="background: #4CAF50" ></div>
          
                <%
              Connection con= null; 
              Conexion cn=new Conexion();
              Statement st= null;
              ResultSet rs = null;
              String  usuario="root";
              String  clavesql="";

           if(request.getParameter("login")!=null){
           
               String correo=request.getParameter("correo");
               String clave=request.getParameter("clave");
               HttpSession sesion= request.getSession();
           
                try {
                 Class.forName("com.mysql.jdbc.Driver");
                 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_megamarket",usuario,clavesql);
                 st=con.createStatement();
                 rs=st.executeQuery("select u.id_usuario,u.correo,u.Nombre ,u.id_tipo_usuario , t.rol_usuario from usuario as u  \n" +
                                           "INNER JOIN tipo_usuario as t ON t.id_tipo_usuario = u.id_tipo_usuario WHERE u.correo = '" +correo+ "' && u.contraseña='"+clave+"' " );
                
                while(rs.next()){
                
                 sesion.setAttribute("logueado","1");
                 sesion.setAttribute("user",rs.getString("u.correo"));
                 sesion.setAttribute("nombre",rs.getString("u.Nombre"));
                 sesion.setAttribute("usuario",rs.getString("t.rol_usuario"));
                 response.sendRedirect("principal.jsp");
                      
        }
          out.print("<div class='alert alert-danger' role='alert' >Datos incorrectos</div>");
        
        }catch(Exception e){
        
           System.out.print(e);
    
        }       
        }
    %>       
            </form>
        </div>
      </div>
    </div>
  </div>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>  

    
    
</html>
  