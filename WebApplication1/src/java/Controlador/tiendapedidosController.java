
package Controlador;

import Modelo.pedido;
import Modelo.pedidoDAO;
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


@WebServlet(name = "tiendapedidosController", urlPatterns = {"/tiendapedidosController"})
public class tiendapedidosController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesiontienda = request.getSession();
        String accion;
        RequestDispatcher dispatcher = null;
        accion =request.getParameter("accion");
        pedidoDAO pedidoDAO=new pedidoDAO();
               
        if("index".equals(accion)){
             dispatcher=request.getRequestDispatcher("tienda/pedidos.jsp"); 
             String id=sesiontienda.getAttribute("id_cliente").toString();
             int _id=Integer.parseInt(id);
             List<pedido> listarpedido = pedidoDAO.listarpedidoxcliente(_id);
             request.setAttribute("lista",listarpedido);
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
