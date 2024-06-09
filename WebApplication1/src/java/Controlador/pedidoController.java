/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.pedido;
import Modelo.pedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "pedidoController", urlPatterns = {"/pedidoController"})
public class pedidoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion;
        pedidoDAO pedidoDAO =new pedidoDAO();
        HttpSession sesion = request.getSession();
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
                
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
            
        }

       else if("eliminar".equals(accion)){
            int id=Integer.parseInt(request.getParameter("id"));
             pedidoDAO.eliminar(id);
             
             dispatcher=request.getRequestDispatcher("pedido/index.jsp");
            List<pedido> listarpedido=pedidoDAO.listarpedido();
            request.setAttribute("lista",listarpedido);     
        
        
        
        }
        else if ("guardar".equals(accion)) {

            int id = Integer.parseInt(request.getParameter("id"));
            String estado_pedido = request.getParameter("estado_pedido");
            if (estado_pedido.equals("1")){
                estado_pedido = "Por entregar";

            }else{
            
              estado_pedido = "Entregado";
            
            }
            pedido pedido = new pedido(id, 0, null, estado_pedido, null, null, null, null, null, null, null, 0.0);
            pedidoDAO.actualizar(pedido);
            dispatcher = request.getRequestDispatcher("pedido/index.jsp");
            List<pedido> listarpedido = pedidoDAO.listarpedido();
            request.setAttribute("lista", listarpedido);
        }
        
        else if("ver".equals(accion)){
               dispatcher=request.getRequestDispatcher("pedido/ver.jsp");
            int id=Integer.parseInt(request.getParameter("id"));
            pedido pedido= pedidoDAO.mostrarpedido(id);
            
            request.setAttribute("pedido",pedido);  

        }
        else{
              
            dispatcher=request.getRequestDispatcher("pedido/index.jsp");
            List<pedido> listarpedido=pedidoDAO.listarpedido();
            request.setAttribute("lista",listarpedido);
              
        }
              
        dispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
 
        doGet(request,response);

        
    }


    public String getServletInfo() {
        return "Short description";
    
    }
}
