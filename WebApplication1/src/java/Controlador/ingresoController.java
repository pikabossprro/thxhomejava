package Controlador;
import Modelo.ingreso;
import Modelo.ingresoDAO;
import Modelo.producto;
import Modelo.productoDAO;
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


@WebServlet(name = "ingresoController", urlPatterns = {"/ingresoController"})
public class ingresoController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ingresoDAO ingresoDAO = new ingresoDAO();
        productoDAO productoDAO = new productoDAO();
        proveedorDAO proveedorDAO=new proveedorDAO();
        
        HttpSession sesion = request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");  
        
 
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
        }else if("nuevo".equals(accion)){
        
               dispatcher=request.getRequestDispatcher("ingreso/nuevo.jsp");
               
                         
               List<proveedor> listarproveedor =proveedorDAO.listarproveedor();
               request.setAttribute("lista",listarproveedor);
               
                           

        }
        

        else if("seleccionar".equals(accion)){
                                 
                 
                 dispatcher=request.getRequestDispatcher("ingreso/obtenerdatos.jsp");
 
                 int id=Integer.parseInt(request.getParameter("id")) ;
                 proveedor proveedor =proveedorDAO.mostrarproveedor(id);
                 request.setAttribute("proveedor",proveedor);  
                 
                 List<producto>listarproducto=productoDAO.listarproducto();
                 request.setAttribute("lista", listarproducto);
                 
                 
         
        }

         else if("seleccionarprod".equals(accion)){
                                  
                 dispatcher=request.getRequestDispatcher("ingreso/obtenerdatos.jsp");
                 
                 int _id=Integer.parseInt(request.getParameter("id"));
                 producto producto =productoDAO.mostrarproducto(_id);
                 request.setAttribute("producto",producto);  
                 
         
        }
        
        
                
        else if("insertar".equals(accion)){
            
            String fecha=request.getParameter("fecha");
            String ruc=request.getParameter("ruc");
            String proveedor =request.getParameter("nombrepro");
            String codigo=request.getParameter("codigo");
            String producto=request.getParameter("nombre");
 
            int cantidad=Integer.parseInt(request.getParameter("cantidad"));
            double precio_com=Double.parseDouble(request.getParameter("pcompra"));
            double precio_ven=Double.parseDouble(request.getParameter("pventa"));
            double subtotal=precio_com*cantidad;
            
            ingreso ingreso = new ingreso(0, fecha,ruc,proveedor,codigo,producto,cantidad,precio_com,precio_ven,subtotal);
            ingresoDAO.insertar(ingreso);
            
            dispatcher=request.getRequestDispatcher("ingreso/index.jsp");
            List<ingreso> listaringreso  = ingresoDAO.listaringreso();
            request.setAttribute("lista",listaringreso); 
        
        }else if("eliminar".equals(accion)){
                int id = Integer.parseInt(request.getParameter("id"));
                ingresoDAO.eliminar(id);
                dispatcher=request.getRequestDispatcher("ingreso/index.jsp");
                List<ingreso> listaringreso  = ingresoDAO.listaringreso();
                request.setAttribute("lista",listaringreso); 
               
        
        }else if("modificar".equals(accion)){
            
                dispatcher=request.getRequestDispatcher("ingreso/modificar.jsp");
                int id = Integer.parseInt(request.getParameter("id"));
                ingreso ingreso =ingresoDAO.mostraringreso(id);
                request.setAttribute("ingreso",ingreso); 
        }
        
        else if("actualizar".equals(accion)){
            
                int id = Integer.parseInt(request.getParameter("id"));
               String fecha=request.getParameter("fecha");
               String ruc=request.getParameter("ruc");
               String proveedor =request.getParameter("nombrepro");
               String codigo=request.getParameter("codigo");
               String producto=request.getParameter("nombre");
 
                int cantidad=Integer.parseInt(request.getParameter("cantidad"));
               double precio_com=Double.parseDouble(request.getParameter("pcompra"));
               double precio_ven=Double.parseDouble(request.getParameter("pventa"));
               double subtotal=precio_com*cantidad;
               
               ingreso ingreso = new ingreso(id, fecha,ruc,proveedor,codigo,producto,cantidad,precio_com,precio_ven,subtotal);
               ingresoDAO.actualizar(ingreso);
               
               dispatcher=request.getRequestDispatcher("ingreso/index.jsp");
               List<ingreso> listaringreso  = ingresoDAO.listaringreso();
               request.setAttribute("lista",listaringreso); 
               
        }
        
        else{
              
             dispatcher=request.getRequestDispatcher("ingreso/index.jsp");
             List<ingreso>listaringreso=ingresoDAO.listaringreso();
             request.setAttribute("lista",listaringreso);
        
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
