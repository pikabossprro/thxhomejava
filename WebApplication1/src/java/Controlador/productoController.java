
package Controlador;

import Modelo.categoria;
import Modelo.categoriaDAO;
import Modelo.producto;
import Modelo.productoDAO;
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


@WebServlet(name = "productoController", urlPatterns = {"/productoController"})
public class productoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        categoriaDAO categoriaDAO=new categoriaDAO();
        productoDAO productoDAO= new productoDAO();
        HttpSession sesion = request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
            
        }else if("nuevo".equals(accion)){
            
                dispatcher=request.getRequestDispatcher("producto/nuevo.jsp");
                List<categoria> listarcategoria=categoriaDAO.listarcategoria();
                 request.setAttribute("lista" , listarcategoria);
                
        }else if("insertar".equals(accion)){
            
            String nombre=request.getParameter("nombre");
            String codigo =request.getParameter("codigo");
            String descripcion=request.getParameter("descripcion");
            int cantidad=Integer.parseInt(request.getParameter("stock"));
            double precio=Double.parseDouble(request.getParameter("precio"));
            int id_cat=Integer.parseInt(request.getParameter("categoria"));
            String imagen=request.getParameter("imagen");
            
            producto producto = new producto(0, nombre,codigo,descripcion,cantidad,precio,id_cat,imagen,null);
            productoDAO.insertar(producto);
            dispatcher=request.getRequestDispatcher("producto/index.jsp");
            List<producto> listaproducto =productoDAO.listarproducto();
            request.setAttribute("lista",listaproducto);

        }else if("modificar".equals(accion)){
             
           dispatcher=request.getRequestDispatcher("producto/modificar.jsp");
           int id=Integer.parseInt(request.getParameter("id"));
           
           producto producto =productoDAO.mostrarproducto(id);
           request.setAttribute("producto",producto);
           List<categoria> listarcategoria=categoriaDAO.listarcategoria();
           request.setAttribute("lista" , listarcategoria);
        
        }else if("actualizar".equals(accion)){
            
            int id=Integer.parseInt(request.getParameter("id"));
            String nombre=request.getParameter("nombre");
            String codigo =request.getParameter("codigo");
            String descripcion=request.getParameter("descripcion");
            int stock=Integer.parseInt(request.getParameter("stock"));
           double precio=Double.parseDouble(request.getParameter("precio"));
            int id_cat=Integer.parseInt(request.getParameter("categoria"));
            String imagen=request.getParameter("imagen");
            
            producto producto = new producto(id,nombre,codigo,descripcion,stock,precio,id_cat,imagen,null);
            productoDAO.actualizar(producto);
            
            dispatcher=request.getRequestDispatcher("producto/index.jsp");
            List<producto> listaproducto =productoDAO.listarproducto();
            request.setAttribute("lista",listaproducto);

        }else if("eliminar".equals(accion)){
               
              int id=Integer.parseInt(request.getParameter("id"));
              productoDAO.eliminar(id); 
              dispatcher=request.getRequestDispatcher("producto/index.jsp");
              List<producto> listaproducto =productoDAO.listarproducto();
              request.setAttribute("lista",listaproducto);
        
        }else if("ver".equals(accion)){
             
              dispatcher=request.getRequestDispatcher("producto/ver.jsp");
              int id=Integer.parseInt(request.getParameter("id"));
              
             producto producto =productoDAO.mostrarproducto(id);
             request.setAttribute("producto",producto);
        }else{
              
            dispatcher=request.getRequestDispatcher("producto/index.jsp");
            List<producto> listaproducto =productoDAO.listarproducto();
            request.setAttribute("lista",listaproducto);
            
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
