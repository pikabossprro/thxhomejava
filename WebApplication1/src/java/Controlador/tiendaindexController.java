
package Controlador;

import Modelo.carrito;
import Modelo.categoria;
import Modelo.categoriaDAO;
import Modelo.producto;
import Modelo.productoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "tiendaindexController", urlPatterns = {"/tiendaindexController"})
public class tiendaindexController extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        productoDAO productoDAO= new productoDAO();
        categoriaDAO categoriaDAO= new categoriaDAO();
        
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion =request.getParameter("accion");
        
        if("index".equals(accion)){
              
            dispatcher=request.getRequestDispatcher("tienda/index.jsp");
            List<producto> listaproducto =productoDAO.listarproducto();
            request.setAttribute("lista",listaproducto);

            
            List<categoria> listacategoria =categoriaDAO.listarcategoria();
            request.setAttribute("lista_cat",listacategoria);


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
