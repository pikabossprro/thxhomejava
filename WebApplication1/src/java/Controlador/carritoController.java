
package Controlador;

import Modelo.carrito;
import Modelo.pedido;
import Modelo.pedidoDAO;
import Modelo.producto;
import Modelo.productoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "carritoController", urlPatterns = {"/carritoController"})
public class carritoController extends HttpServlet {
        
        int item;
        double total_pagar=0.0;
        int cantidad=1;
       
        

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        
        
        pedidoDAO pedidoDAO=new pedidoDAO();
        productoDAO productoDAO = new productoDAO();
        String accion;
        
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
                
        HttpSession sesion =request.getSession(true);
       ArrayList<carrito> listacarrito=null ;
       
        if(sesion.getAttribute("carrito") != null) {
             listacarrito=(ArrayList<carrito>) sesion.getAttribute("carrito") ;

       } 
        else{
            listacarrito=new ArrayList<carrito>();
        
        }
        
        boolean flag = false ;
        
        
        if("agregar".equals(accion)){
            int pos=0;
            cantidad=1;
            int id=Integer.parseInt(request.getParameter("id"));
            producto producto =productoDAO.mostrarproducto(id);
            
            if(listacarrito.size()>0){
                for (int i =0 ; i<listacarrito.size() ; i ++ ){
                     if(id==listacarrito.get(i).getId_producto()){
                         pos=i;
                     
                     }
                }
                if(id==listacarrito.get(pos).getId_producto()){
                
                       cantidad=listacarrito.get(pos).getCantidad()+cantidad;
                       double sub_total=listacarrito.get(pos).getPrecio_compra()*cantidad;
                       listacarrito.get(pos).setCantidad(cantidad);
                       listacarrito.get(pos).setSub_total(sub_total);
                }else{
                   item = item + 1 ;
                   carrito car= new carrito(item,producto.getId_producto(),cantidad,producto.getNombre(),producto.getCodigo(),producto.getDescripcion(),producto.getImagen(),producto.getPrecio(),cantidad*producto.getPrecio());
                   listacarrito.add(car);
                
                }
            
            
            }else{
            
              item = item + 1 ;
              carrito car= new carrito(item,producto.getId_producto(),cantidad,producto.getNombre(),producto.getCodigo(),producto.getDescripcion(),producto.getImagen(),producto.getPrecio(),cantidad*producto.getPrecio());
              listacarrito.add(car);       
            }
            

            dispatcher=request.getRequestDispatcher("tiendaindexController?accion=index");             
             sesion.setAttribute("contador",listacarrito.size());
             sesion.setAttribute("carrito", listacarrito);
        }    
        

        
        
        else if ("eliminar".equals(accion)) {
            int pos = 0;
            int id = Integer.parseInt(request.getParameter("id"));

            if (listacarrito.size() > 0) {
                for (int i = 0; i <listacarrito.size(); i++) {
                    if (id == listacarrito.get(i).getId_producto()) {
                        pos = i;
                    }
                }if(id==listacarrito.get(pos).getId_producto()){
                      listacarrito.remove(pos);       
        
                }

            }
             dispatcher=request.getRequestDispatcher("carritoController?accion=carrito");      
        
        }
        else if("carrito".equals(accion)){
            
              total_pagar=0;
              request.setAttribute("carrito", listacarrito);
              dispatcher=request.getRequestDispatcher("tienda/carrito.jsp");
              
              for (int i = 0 ; i <listacarrito.size() ; i++ ){
                     total_pagar=total_pagar+listacarrito.get(i).getSub_total();
              }
              request.setAttribute("totalpagar", total_pagar);
             
        
        }else if("rcompra".equals(accion)){
            response.setContentType("text/html;charset=UTF-8");
            
           if (listacarrito.size() > 0) {
               if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
                     dispatcher = request.getRequestDispatcher("tiendaloginController?accion=login");
            
                } else{  
               total_pagar=0;
                dispatcher=request.getRequestDispatcher("tienda/checkout.jsp");
                request.setAttribute("carrito", listacarrito);
                              
              for (int i = 0 ; i <listacarrito.size() ; i++ ){
                     total_pagar=total_pagar+listacarrito.get(i).getSub_total();
                       }}
                request.setAttribute("totalpagar", total_pagar);
             
           
           
           }

           else{

              dispatcher=request.getRequestDispatcher("carritoController?accion=carrito");    
                    
           }            
         
           }else if("gcompra".equals(accion)){
                      
             int id_cliente=Integer.parseInt(request.getParameter("id_cliente"));
             String forma_pago=request.getParameter("tipopago");
             
             if (forma_pago.equals("1")){
             
                     forma_pago="tarjeta";            
             }
             else{
                 
                   forma_pago="contra entrega";
             
             }
             ArrayList productos = new ArrayList();
             ArrayList codigos = new ArrayList(); 
             
              for (int i = 0 ; i<listacarrito.size() ; i ++ ){
                  productos.add(listacarrito.get(i).getCantidad()+"x"+listacarrito.get(i).getNombre());
                  codigos.add(listacarrito.get(i).getCodigo());
              }
              
             String products = productos.toString();
             String cods = codigos.toString();
             String estado_pedido="por entregar";
             String metodo_entrega="delivery";
             String nombre=request.getParameter("nombre");
             String apellido=request.getParameter("apellido");
             String telefono=request.getParameter("telefono");
             String direccion=request.getParameter("direccion");
             double total_pa = Double.parseDouble(request.getParameter("total"));            
             pedido pedido = new pedido (0,id_cliente,forma_pago,estado_pedido,metodo_entrega,nombre,apellido,telefono,direccion,products ,cods,total_pa);
             pedidoDAO.insertar(pedido);  
             
              for (int i = 0 ; i<listacarrito.size() ; i ++ ){
                  int ids=listacarrito.get(i).getId_producto();
                  producto stocks=  productoDAO.mostrarproducto(ids);
                  int stock=stocks.getStock()-listacarrito.get(i).getCantidad();
                  producto producto= new producto(ids,null,null,null,stock,0,0,null,null);
                  productoDAO.actualizarstock(producto);
              }
             dispatcher = request.getRequestDispatcher("tienda/info2.jsp");
             
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
