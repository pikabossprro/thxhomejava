
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class pedidoDAO {
        Connection conexion;
    
    public pedidoDAO(){
    
        Conexion cn =new Conexion();
        conexion = cn.getConexion();
    }
    
    public List<pedido>listarpedido(){
       
        PreparedStatement ps;
        ResultSet rs;
        List<pedido> lista= new ArrayList<>();
       
        try{
         
            ps=conexion.prepareStatement("SELECT id_venta,forma_pago,estado_pedido,metodo_entrega ,total ,id_cliente,nombre , apellido,telefono,direccion,productos ,codigo FROM pedido");
            rs=ps.executeQuery();
            while(rs.next()){
            
                int id=rs.getInt("id_venta");
                String forma_pago=rs.getString("forma_pago");
                String estado_pedido=rs.getString("estado_pedido");
                String metodo_entrega=rs.getString("metodo_entrega");
                double total=rs.getInt("total");
                int id_cliente=rs.getInt("id_cliente");
                String nombre=rs.getString("nombre");
                String apellido=rs.getString("apellido");
                String telefono=rs.getString("telefono");
                String direccion=rs.getString("direccion");
                String productos=rs.getString("productos");
                String codigo=rs.getString("codigo");
                
                pedido pedido=new pedido(id,id_cliente,forma_pago,estado_pedido,metodo_entrega,nombre,apellido,telefono,direccion,productos,codigo,total);
                lista.add(pedido);
            
            }
            return lista;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
        
    }

  }
      
    public pedido mostrarpedido(int _id){
         PreparedStatement ps;
        ResultSet rs;
        
        pedido pedido=null;
               
        try{
         
            ps=conexion.prepareStatement("SELECT id_venta,forma_pago,estado_pedido,metodo_entrega ,total ,id_cliente,nombre , apellido,telefono,direccion,productos ,codigo FROM pedido WHERE id_venta=?");
            ps.setInt(1, _id);
            rs=ps.executeQuery();
            while(rs.next()){
            
                int id=rs.getInt("id_venta");
                String forma_pago=rs.getString("forma_pago");
                String estado_pedido=rs.getString("estado_pedido");
                String metodo_entrega=rs.getString("metodo_entrega");
                double total=rs.getInt("total");
                int id_cliente=rs.getInt("id_cliente");
                String nombre=rs.getString("nombre");
                String apellido=rs.getString("apellido");
                String telefono=rs.getString("telefono");
                String direccion=rs.getString("direccion");
                String productos=rs.getString("productos");
                String codigo=rs.getString("codigo");
                
                pedido=new pedido(id,id_cliente,forma_pago,estado_pedido,metodo_entrega,nombre,apellido,telefono,direccion,productos,codigo,total);
            
            }
            return pedido;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
        
    }
    
    }
     //actualizar estado del pedido
    public boolean actualizar(pedido pedido){
        PreparedStatement ps;
        try{
            ps=conexion.prepareStatement("UPDATE pedido SET estado_pedido=? WHERE id_venta=?");
           ps.setString(1, pedido.getEstado_pedido());
           ps.setInt(2, pedido.getId_venta());
           ps.execute();
           return true;
        
        
        }catch(SQLException e){
        
                   System.out.println(e.toString());
            return false;
        
        }
         
    
    
    
    }
    
  
    public List<pedido> listarpedidoxcliente(int _id){
        PreparedStatement ps;
        ResultSet rs;
        List<pedido> lista= new ArrayList<>();
               
        try{
         
            ps=conexion.prepareStatement("SELECT id_venta,forma_pago,estado_pedido,metodo_entrega ,total ,id_cliente,nombre , apellido,telefono,direccion,productos ,codigo FROM pedido WHERE id_cliente=?");
            ps.setInt(1, _id);
            rs=ps.executeQuery();
            while(rs.next()){
            
                int id=rs.getInt("id_venta");
                String forma_pago=rs.getString("forma_pago");
                String estado_pedido=rs.getString("estado_pedido");
                String metodo_entrega=rs.getString("metodo_entrega");
                double total=rs.getInt("total");
                int id_cliente=rs.getInt("id_cliente");
                String nombre=rs.getString("nombre");
                String apellido=rs.getString("apellido");
                String telefono=rs.getString("telefono");
                String direccion=rs.getString("direccion");
                String productos=rs.getString("productos");
                String codigo=rs.getString("codigo");
                
                pedido pedido=new pedido(id,id_cliente,forma_pago,estado_pedido,metodo_entrega,nombre,apellido,telefono,direccion,productos,codigo,total);
                lista.add(pedido);
            }
            return lista;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
        
    }
    
    }
    
    public boolean insertar(pedido pedido){
    PreparedStatement ps;
    try{
       ps =conexion.prepareStatement("INSERT INTO pedido (forma_pago,estado_pedido,metodo_entrega ,total ,id_cliente,nombre , apellido,telefono,Direccion,productos ,codigo) VALUES (?,?,?,?,?,?,?,?,?,?,?) ");
        ps.setString(1, pedido.getForma_pago());
        ps.setString(2, pedido.getEstado_pedido());
        ps.setString(3, pedido.getMetodo_entrega());
        ps.setDouble(4, pedido.getTotal());
        ps.setInt(5, pedido.getId_cliente());
        ps.setString(6, pedido.getNombre());
        ps.setString(7, pedido.getApellido());
        ps.setString(8, pedido.getTelefono());
         ps.setString(9, pedido.getApellido());
        ps.setString(10, pedido.getProductos());
        ps.setString(11, pedido.getCodigo());
       ps.execute();          
       return true;
    }catch(SQLException e){
        System.out.println(e.toString());
        return false;
    
    
    }
    
    
    
    
    }
    
    public boolean eliminar(int _id){
        PreparedStatement ps;
        try{
         ps=conexion.prepareStatement("DELETE FROM pedido  Where id_venta=?");
         ps.setInt(1, _id);
         ps.execute();
         return true;
        
               
        }catch(SQLException e){
              
             System.out.println(e.toString());
             return false ;
                  
         }
    
    
    
    }
    
}
