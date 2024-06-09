/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

@WebServlet(name = "tiendacategoriaController", urlPatterns = {"/tiendacategoriaController"})
public class tiendacategoriaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        productoDAO productoDAO= new productoDAO();
        categoriaDAO categoriaDAO= new categoriaDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        
        if("mostrar".equals(accion)){
               
              dispatcher=request.getRequestDispatcher("tienda/categoria.jsp"); 
              int id=Integer.parseInt(request.getParameter("id"));   
              
              List<producto> listaxcat=productoDAO.mostrarcategoria(id);
              request.setAttribute("lista",listaxcat);
              
              List<categoria> lista=categoriaDAO.listarcategoria();
              request.setAttribute("lista_cat",lista);
        
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
