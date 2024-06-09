package Controlador;

import Modelo.empleado;
import Modelo.empleadoDAO;
import Modelo.tipo_usuario;
import Modelo.tipo_usuarioDAO;
import Modelo.usuario;
import Modelo.usuarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "usuarioController", urlPatterns = {"/usuarioController"})
public class usuarioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             
        usuarioDAO usuarioDAO=new usuarioDAO();
        empleadoDAO empleadoDAO=new empleadoDAO();
        tipo_usuarioDAO tipo_usuarioDAO=new tipo_usuarioDAO();
        
        
        String accion;
        RequestDispatcher dispatcher =null;
        HttpSession sesion = request.getSession();
        accion = request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
            
        }else if("nuevo".equals(accion)){
              dispatcher =request.getRequestDispatcher("usuario/nuevo.jsp");

             List<empleado> listaempleado=empleadoDAO.listarempleado();
             request.setAttribute("lista",listaempleado);
        
        }else if("insertar".equals(accion)){
        
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            String correo=request.getParameter("correo");
            String clave=request.getParameter("clave");
            int id_tipo=Integer.parseInt(request.getParameter("id_tipo"));
            
            
            usuario usuario=new usuario(0,nombre,apellido,correo,clave,id_tipo,null);
            usuarioDAO.insertar(usuario);
            dispatcher =request.getRequestDispatcher("usuario/index.jsp");
            
            List<usuario> listausuario=usuarioDAO.listarusuario();
            request.setAttribute("lista",listausuario);
   
        }else if("modificar".equals(accion)){
         dispatcher =request.getRequestDispatcher("usuario/modificar.jsp");
         int id=Integer.parseInt(request.getParameter("id"));
         
         usuario usuario=usuarioDAO.mostrarusuario(id);
         request.setAttribute("usuario",usuario);

         List<tipo_usuario> listartipousuario=tipo_usuarioDAO.listartipousuario();
          request.setAttribute("lista",listartipousuario);
         
        }else if("actualizar".equals(accion)){
            
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            String correo=request.getParameter("correo");
            String clave=request.getParameter("clave");
            int id_tipo=Integer.parseInt(request.getParameter("tipo"));
            
            
            usuario usuario=new usuario(id,nombre,apellido,correo,clave,id_tipo,null);
            usuarioDAO.actualizar(usuario);
            dispatcher =request.getRequestDispatcher("usuario/index.jsp");

            List<usuario> listausuario=usuarioDAO.listarusuario();
            request.setAttribute("lista",listausuario);
            
        }else if("eliminar".equals(accion)){
            int id=Integer.parseInt(request.getParameter("id"));
            usuarioDAO.eliminar(id);
            dispatcher =request.getRequestDispatcher("usuario/index.jsp");
            List<usuario> listausuario=usuarioDAO.listarusuario();
            request.setAttribute("lista",listausuario);
        
        }else if("ver".equals(accion)){
         dispatcher =request.getRequestDispatcher("usuario/ver.jsp");
         int id=Integer.parseInt(request.getParameter("id"));
         
         usuario usuario=usuarioDAO.mostrarusuario(id);
         request.setAttribute("usuario",usuario);

         
        }else if("act_datos".equals(accion)){
               
               dispatcher =request.getRequestDispatcher("usuario/act_datos.jsp");
               int id=Integer.parseInt(request.getParameter("id"));
               empleado empleado=empleadoDAO.mostrarempleado(id);
               request.setAttribute("empleado",empleado);
               
               List<tipo_usuario> listartipousuario=tipo_usuarioDAO.listartipousuario();
               request.setAttribute("lista",listartipousuario);
        
        }
        
        else{
            dispatcher =request.getRequestDispatcher("usuario/index.jsp");
            List<usuario> listausuario=usuarioDAO.listarusuario();
            request.setAttribute("lista",listausuario);
        
        }
        
        
        
            
            dispatcher.forward(request,response);
       
        
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        doGet(request,response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
