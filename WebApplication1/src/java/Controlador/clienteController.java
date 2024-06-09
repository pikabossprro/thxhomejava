
package Controlador;

import Modelo.cliente;
import Modelo.clienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "clienteController", urlPatterns = {"/clienteController"})
public class clienteController extends HttpServlet {
   
    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        clienteDAO clienteDAO = new clienteDAO();
        String accion;
        HttpSession sesion = request.getSession();
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");     
        
   if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");         
        }
   
   else if("nuevo".equals(accion)){
        String apellido =request.getParameter("apellido");
        String nombre =request.getParameter("nombre");
        String correo =request.getParameter("correo");
        String clave =request.getParameter("clave");
        String telefono =request.getParameter("telefono");
        cliente cliente =new cliente(0,nombre,apellido,correo,clave,telefono);
        clienteDAO.actualizar(cliente);
            
        dispatcher=request.getRequestDispatcher("tiendaindexController?accion=index");
        
    }else if("modificar".equals(accion)){
         dispatcher=request.getRequestDispatcher("cliente/modificar.jsp");  
         int id=Integer.parseInt(request.getParameter("id"));
         cliente cliente = clienteDAO.mostrarcliente(id);
         request.setAttribute("cliente",cliente);
            
    }else if("actualizar".equals(accion)){
        
        int id=Integer.parseInt(request.getParameter("id"));
        String apellido =request.getParameter("apellido");
        String nombre =request.getParameter("nombre");
        String correo =request.getParameter("correo");
        String clave =request.getParameter("clave");
        String telefono =request.getParameter("telefono");
        cliente cliente =new cliente(id,nombre,apellido,correo,clave,telefono);
        clienteDAO.actualizar(cliente);
        
          dispatcher=request.getRequestDispatcher("cliente/index.jsp");
          List<cliente> listacliente=clienteDAO.listarcliente();
          request.setAttribute("lista" , listacliente);
        
    
    }else if("ver".equals(accion)){
        dispatcher=request.getRequestDispatcher("cliente/ver.jsp");  
        int id=Integer.parseInt(request.getParameter("id"));
         cliente cliente = clienteDAO.mostrarcliente(id);
        request.setAttribute("cliente",cliente);  
    
    }
    
    
    else if("eliminar".equals(accion)){
         
         int id=Integer.parseInt(request.getParameter("id"));
              clienteDAO.eliminar(id);
              
           dispatcher=request.getRequestDispatcher("cliente/index.jsp");
          List<cliente> listacliente=clienteDAO.listarcliente();
          request.setAttribute("lista" , listacliente);
            
    }
   
   else{
       
          dispatcher=request.getRequestDispatcher("cliente/index.jsp");
          List<cliente> listacliente=clienteDAO.listarcliente();
          request.setAttribute("lista" , listacliente);
       
       
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
