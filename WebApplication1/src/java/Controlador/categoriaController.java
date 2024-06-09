
package Controlador;

import Modelo.categoria;
import Modelo.categoriaDAO;
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

@WebServlet(name = "categoriaController", urlPatterns = {"/categoriaController"})
public class categoriaController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        categoriaDAO categoriaDAO =new categoriaDAO();
        HttpSession sesion = request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
            
        }else if("nuevo".equals(accion)){
            
              dispatcher=request.getRequestDispatcher("categoria/nuevo.jsp");        
        
        }else if("insertar".equals(accion)){
               
            String nombre=request.getParameter("nombre");
            String descripcion=request.getParameter("descripcion");
            
            categoria categoria=new categoria(0,nombre,descripcion);
            categoriaDAO.insertar(categoria);
            
            dispatcher = request.getRequestDispatcher("categoria/index.jsp");
            List<categoria> listarcategoria=categoriaDAO.listarcategoria();
            request.setAttribute("lista" , listarcategoria);

        }else if("modificar".equals(accion)){
             
             dispatcher=request.getRequestDispatcher("categoria/modificar.jsp");
             int id=Integer.parseInt(request.getParameter("id"));
             
             categoria categoria=categoriaDAO.mostrarcategoria(id);
             request.setAttribute("categoria",categoria);
        
        }
        
        else if("actualizar".equals(accion)){
             
            int id=Integer.parseInt(request.getParameter("id"));
            String nombre=request.getParameter("nombre");
            String descripcion=request.getParameter("descripcion");
            
            categoria categoria = new categoria(id,nombre,descripcion);
            categoriaDAO.actualizar(categoria);
            
            dispatcher = request.getRequestDispatcher("categoria/index.jsp");
            List<categoria> listarcategoria=categoriaDAO.listarcategoria();
            request.setAttribute("lista" , listarcategoria);
            
        
        }else if("eliminar".equals(accion)){
        
              int id=Integer.parseInt(request.getParameter("id"));
              categoriaDAO.eliminar(id);
             
             dispatcher = request.getRequestDispatcher("categoria/index.jsp");
             List<categoria> listarcategoria=categoriaDAO.listarcategoria();
             request.setAttribute("lista" , listarcategoria);
            
        }else if("ver".equals(accion)){
            
             dispatcher=request.getRequestDispatcher("categoria/ver.jsp");
             int id=Integer.parseInt(request.getParameter("id"));
             
             categoria categoria=categoriaDAO.mostrarcategoria(id);
             request.setAttribute("categoria",categoria);
             
             
            
        }else{
              
            dispatcher=request.getRequestDispatcher("categoria/index.jsp");
            List<categoria> listarcategoria=categoriaDAO.listarcategoria();
            request.setAttribute("lista",listarcategoria);
              
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
