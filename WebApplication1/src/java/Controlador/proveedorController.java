package Controlador;
import Modelo.proveedor;
import Modelo.proveedorDAO;
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

@WebServlet(name = "proveedorController", urlPatterns = {"/proveedorController"})
public class proveedorController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        proveedorDAO proveedorDAO = new proveedorDAO();
        HttpSession sesion =request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
            
        }else if("nuevo".equals(accion)){
            
                dispatcher=request.getRequestDispatcher("proveedor/nuevo.jsp");
                
        }else if("insertar".equals(accion)){
               String nombre=request.getParameter("nombre");
               String ruc=request.getParameter("ruc");
               String correo=request.getParameter("correo");
               String direccion=request.getParameter("direccion");
               String telefono=request.getParameter("telefono");
               
               proveedor proveedor = new proveedor(0,direccion,correo,telefono,nombre,ruc);
               proveedorDAO.insertar(proveedor);
               dispatcher=request.getRequestDispatcher("proveedor/index.jsp");
               List<proveedor> listarproveedor=proveedorDAO.listarproveedor();
               request.setAttribute("lista" , listarproveedor);
        
        }else if("modificar".equals(accion)){
                dispatcher=request.getRequestDispatcher("proveedor/modificar.jsp");
                int id=Integer.parseInt(request.getParameter("id"));
                
                proveedor proveedor = proveedorDAO.mostrarproveedor(id);
                request.setAttribute("proveedor",proveedor);

        
        }else if("actualizar".equals(accion)){
               int id=Integer.parseInt(request.getParameter("id"));
               String nombre=request.getParameter("nombre");
               String ruc=request.getParameter("ruc");
               String correo=request.getParameter("correo");
               String direccion=request.getParameter("direccion");
               String telefono=request.getParameter("telefono");
               
               proveedor proveedor = new proveedor(id,direccion,correo,telefono,nombre,ruc);
               proveedorDAO.actualizar(proveedor);
               dispatcher=request.getRequestDispatcher("proveedor/index.jsp");
               List<proveedor> listarproveedor=proveedorDAO.listarproveedor();
               request.setAttribute("lista" , listarproveedor);
               
        }else if("eliminar".equals(accion)){
                 int id=Integer.parseInt(request.getParameter("id"));
                 proveedorDAO.eliminar(id);
                 
                 dispatcher=request.getRequestDispatcher("proveedor/index.jsp");
                 List<proveedor> listarproveedor=proveedorDAO.listarproveedor();
                 request.setAttribute("lista" , listarproveedor);
        
        }else if("ver".equals(accion)){
               dispatcher=request.getRequestDispatcher("proveedor/ver.jsp");
               int id=Integer.parseInt(request.getParameter("id"));
               
               proveedor proveedor = proveedorDAO.mostrarproveedor(id);
               request.setAttribute("proveedor",proveedor);   
        
        }
                
        else{
            
             dispatcher=request.getRequestDispatcher("proveedor/index.jsp");
             List<proveedor> listarproveedor=proveedorDAO.listarproveedor();
             request.setAttribute("lista" , listarproveedor);
          
        
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
