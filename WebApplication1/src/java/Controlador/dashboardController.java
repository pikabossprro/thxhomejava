
package Controlador;

import Modelo.cliente;
import Modelo.clienteDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "dashboardController", urlPatterns = {"/dashboardController"})
public class dashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        clienteDAO clienteDAO=new clienteDAO();
        
        String accion;
        HttpSession sesion = request.getSession();
        

        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
           dispatcher = request.getRequestDispatcher("index.jsp");

        
        }
        
         else{
            dispatcher =request.getRequestDispatcher("principal.jsp");
                      
            List<cliente> listacliente=clienteDAO.listarcliente();        

            int nroclientes= listacliente.size();
            request.setAttribute("total",nroclientes);
            request.setAttribute("lista",listacliente);
            
        
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
