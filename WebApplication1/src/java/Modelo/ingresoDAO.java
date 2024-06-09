
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class ingresoDAO {
      
     Connection conexion;
        
        public ingresoDAO(){
    
        Conexion cn =new Conexion();
        conexion = cn.getConexion();
    }
        
     public List<ingreso>listaringreso(){
               
         PreparedStatement ps;
         ResultSet rs;
         List<ingreso> lista= new ArrayList<>();
         
         try{
             ps=conexion.prepareStatement("SELECT id_ingreso,fecha,ruc,proveedor , codigo_producto , producto , cantidad , precio_compra ,precio_venta ,sub_total FROM ingreso");
              rs=ps.executeQuery();
              while(rs.next()){
                   
                  int id=rs.getInt("id_ingreso");
                  String fecha=rs.getString("fecha");
                  String ruc = rs.getString("ruc");
                  String proveedor = rs.getString("proveedor");
                  String codigoprod=rs.getString("codigo_producto");
                  String producto = rs.getNString("producto");
                  int cantidad= rs.getInt("cantidad");
                  double precio_compra =rs.getDouble("precio_compra");
                  double precio_venta=rs.getDouble("precio_venta");
                  double sub_total=rs.getDouble("sub_total");
                  ingreso ingreso = new ingreso ( id, fecha,ruc,proveedor,codigoprod,producto,cantidad,precio_compra,precio_venta,sub_total);
                  lista.add(ingreso);
              }
            
         
         return lista;
         
         }catch(SQLException e){
              
             System.out.println(e.toString());
             return null ;
             
         
         }
     
     
     }   
     
      public ingreso mostraringreso(int _id){
               
         PreparedStatement ps;
         ResultSet rs;
         ingreso ingreso = null;
         
         try{
             ps=conexion.prepareStatement("SELECT id_ingreso,fecha,ruc,proveedor , codigo_producto , producto , cantidad , precio_compra ,precio_venta ,sub_total FROM ingreso WHERE id_ingreso=?");
             ps.setInt(1, _id);
             rs=ps.executeQuery();
              
              while(rs.next()){
                   
                  int id=rs.getInt("id_ingreso");
                  String fecha=rs.getString("fecha");
                  String ruc=rs.getString("ruc");
                  String proveedor = rs.getString("proveedor");
                  String codigoprod=rs.getString("codigo_producto");
                  String producto = rs.getNString("producto");
                  int cantidad= rs.getInt("cantidad");
                  double precio_compra =rs.getDouble("precio_compra");
                  double precio_venta=rs.getDouble("precio_venta");
                  double sub_total=rs.getDouble("sub_total");
                  
                  ingreso  = new ingreso ( id, fecha,ruc,proveedor,codigoprod,producto,cantidad,precio_compra,precio_venta,sub_total);
              }
            
         
         return ingreso;
         
         }catch(SQLException e){
              
             System.out.println(e.toString());
             return null ;
             
         
         }
     
     
     } 
        
     public boolean insertar(ingreso ingreso){
               
         PreparedStatement ps;
         
         try{
             ps=conexion.prepareStatement("INSERT INTO ingreso (fecha,ruc, proveedor  , codigo_producto , producto , cantidad , precio_compra ,precio_venta ,sub_total ) VALUES(?,?,?,?,?,?,?,?,?)");
             
             ps.setString(1, ingreso.getFecha());
              ps.setString(2, ingreso.getRuc());
             ps.setString(3, ingreso.getProveedor());
             ps.setString(4, ingreso.getCodigo_producto());
             ps.setString(5, ingreso.getProducto());
             ps.setInt(6, ingreso.getCantidad());
             ps.setDouble(7,ingreso.getPrecio_compra());
             ps.setDouble(8,ingreso.getPrecio_venta());
             ps.setDouble(9,ingreso.getSub_total());            
             ps.execute();

         return true ;
         
         }catch(SQLException e){
              
             System.out.println(e.toString());
             return false ;
                  
         }
     
     }      
     
    public boolean actualizar(ingreso ingreso){
               
         PreparedStatement ps;
         
         try{
             ps=conexion.prepareStatement("UPDATE ingreso SET fecha=?,ruc=?,proveedor=? , codigo_producto=?, producto=?, cantidad =?, precio_compra =?,precio_venta=? ,sub_total=? WHERE id_ingreso=?");
             
             ps.setString(1, ingreso.getFecha());
               ps.setString(2, ingreso.getRuc());
             ps.setString(3, ingreso.getProveedor());
             ps.setString(4, ingreso.getCodigo_producto());
             ps.setString(5, ingreso.getProducto());
             ps.setInt(6, ingreso.getCantidad());
             ps.setDouble(7,ingreso.getPrecio_compra());
             ps.setDouble(8,ingreso.getPrecio_venta());
             ps.setDouble(9,ingreso.getSub_total());         
             ps.setInt(10,ingreso.getId_ingreso());
             ps.execute();

         return true ;
         
         }catch(SQLException e){
              
             System.out.println(e.toString());
             return false ;
                  
         }
     
     }   
     
    public boolean eliminar(int _id){
               
         PreparedStatement ps;
         
         try{
             ps=conexion.prepareStatement("DELETE FROM  ingreso  WHERE id_ingreso=?");
                    
             ps.setInt(1,_id);
             ps.execute();
             return true ;
         
         }catch(SQLException e){
              
             System.out.println(e.toString());
             return false ;
                  
         }
     
     }   
       
     
}
