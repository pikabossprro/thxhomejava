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
import javax.servlet.http.HttpSession;


@WebServlet(name = "productodetallesController", urlPatterns = {"/productodetallesController"})
public class productodetallesController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        productoDAO productoDAO= new productoDAO();
        categoriaDAO categoriaDAO= new categoriaDAO();
        HttpSession sesion = request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        
       if("detalle".equals(accion)){
             
           dispatcher=request.getRequestDispatcher("tienda/detalleproducto.jsp");
           int id=Integer.parseInt(request.getParameter("id"));
           
           producto producto =productoDAO.mostrarproducto(id);
           request.setAttribute("producto",producto);
           
           List<producto> listarproducto=productoDAO.listarproducto();
           request.setAttribute("lista" , listarproducto);
           
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
