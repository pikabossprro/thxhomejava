
package Controlador;

import Modelo.cliente;
import Modelo.clienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "tiendaloginController", urlPatterns = {"/tiendaloginController"})
public class tiendaloginController extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          clienteDAO clienteDAO = new clienteDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        
        if("login".equals(accion)){
            dispatcher=request.getRequestDispatcher("tienda/login.jsp");
             
        
        }
        
        
        else if ("create".equals(accion)){
               
        String apellido = request.getParameter("apellido");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        String telefono = request.getParameter("telefono");
        cliente cliente = new cliente(0, nombre, apellido, correo, clave, telefono);
        clienteDAO.insertar(cliente);

        dispatcher = request.getRequestDispatcher("tienda/info.jsp");

            
            
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
