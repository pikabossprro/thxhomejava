
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class productoDAO {
    
    Connection conexion;
    
    public productoDAO(){
    
        Conexion cn =new Conexion();
        conexion = cn.getConexion();
    }
    
     public List<producto>listarproducto(){
       
        PreparedStatement ps;
        ResultSet rs;
        List<producto> lista= new ArrayList<>();
       
        try{
         
            ps=conexion.prepareStatement("SELECT p.id_producto,p.nombre,p.codigo,p.descripcion,p.stock,p.precio,p.id_categoria,p.imagen,c.nombre FROM producto as p \n"
                    + "inner join categoria as c ON p.id_categoria = c.id_categoria");
            rs=ps.executeQuery();
            while(rs.next()){
            
                int id=rs.getInt("p.id_producto");
                String nombre=rs.getString("p.nombre");
                String codigo=rs.getString("p.codigo");
                String descripcion=rs.getString("p.descripcion");
                int stock=rs.getInt("p.stock");
                int id_categoria=rs.getInt("p.id_categoria");
                double precio=rs.getDouble("p.precio");
                String imagen=rs.getString("p.imagen");
                String categoria=rs.getString("c.nombre");
                
                producto producto=new producto(id,nombre,codigo,descripcion,stock,precio,id_categoria,imagen,categoria);
                lista.add(producto);
            
            }
            return lista;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
        
    }
        
        
  }
    //actualizar solo stock por id_producto;
     
        public boolean actualizarstock(producto producto){
       
        PreparedStatement ps;
        
        try{
         
            ps=conexion.prepareStatement("UPDATE producto SET stock=? WHERE id_producto=?");

            ps.setInt(1, producto.getStock());
            ps.setInt(2,producto.getId_producto());
            ps.execute();
            return true;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return false;   
        
    }
        
    }
     
     
    
    public producto mostrarproducto(int _id){
       
        PreparedStatement ps;
        ResultSet rs;
        
        producto producto=null;
        
        try{
         
            ps=conexion.prepareStatement("SELECT p.id_producto,p.nombre,p.codigo,p.descripcion,p.stock,p.precio,p.id_categoria,p.imagen,c.nombre FROM producto as p \n"
                    + "inner join categoria as c ON p.id_categoria = c.id_categoria WHERE p.id_producto=? " );
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            
            while(rs.next()){
            
                int id=rs.getInt("p.id_producto");
                String nombre=rs.getString("p.nombre");
                String codigo=rs.getString("p.codigo");
                String descripcion=rs.getString("p.descripcion");
                int stock=rs.getInt("p.stock");
                int id_categoria=rs.getInt("p.id_categoria");
                double precio=rs.getDouble("p.precio");
                String imagen=rs.getString("p.imagen");
                String categoria=rs.getString("c.nombre");
                
                producto =new producto(id,nombre,codigo,descripcion,stock,precio,id_categoria,imagen,categoria);
            
            }
            
            return producto;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
    }
  }     
    
    public boolean insertar(producto producto){
       
        PreparedStatement ps;
        
        try{
         
            ps=conexion.prepareStatement("INSERT INTO producto (nombre,codigo,descripcion,stock,precio,id_categoria,imagen) VALUES(?,?,?,?,?,?,?)");
 
            ps.setString(1,producto.getNombre());
            ps.setString(2, producto.getCodigo());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getStock());
            ps.setDouble(5, producto.getPrecio());
            ps.setInt(6, producto.getId_categoria());
            
            ps.setString(7, producto.getImagen());
            ps.execute();
            
            return true;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return false;   
        
    }
    
        
    }
    
    
   public boolean actualizar(producto producto){
       
        PreparedStatement ps;
        
        try{
         
            ps=conexion.prepareStatement("UPDATE producto SET nombre=?,codigo=?,descripcion=?,stock=?,precio=?,id_categoria=?,imagen=? WHERE id_producto=?");
 
            ps.setString(1,producto.getNombre());
            ps.setString(2, producto.getCodigo());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getStock());
            ps.setDouble(5, producto.getPrecio());
            ps.setInt(6, producto.getId_categoria());

            ps.setString(7, producto.getImagen());
            ps.setInt(8,producto.getId_producto());
            ps.execute();
            return true;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return false;   
        
    }
        
    }
   
   public boolean  eliminar(int _id){
       
        PreparedStatement ps;
        
        try{
         
            ps=conexion.prepareStatement("DELETE FROM producto WHERE id_producto=?");
            ps.setInt(1,_id);
            ps.execute();
            return true;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return false;   
        
    }
        
    }
   
   /////mostrar por categoria los productos para la tienda online
   
       public List<producto>mostrarcategoria(int _id){
       
        PreparedStatement ps;
        ResultSet rs;
        List<producto> listacat= new ArrayList<>();
        try{
         
            ps=conexion.prepareStatement("SELECT p.id_producto,p.nombre,p.codigo,p.descripcion,p.stock,p.precio,p.id_categoria,p.imagen,c.nombre FROM producto as p \n"
                     +"inner join categoria as c ON p.id_categoria = c.id_categoria WHERE p.id_categoria=?; " );
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            
            while(rs.next()){
            
                int id=rs.getInt("p.id_producto");
                String nombre=rs.getString("p.nombre");
                String codigo=rs.getString("p.codigo");
                String descripcion=rs.getString("p.descripcion");
                int stock=rs.getInt("p.stock");
                int id_categoria=rs.getInt("p.id_categoria");
                double precio=rs.getDouble("p.precio");
                String imagen=rs.getString("p.imagen");
                String categoria=rs.getString("c.nombre");
               producto producto =new producto(id,nombre,codigo,descripcion,stock,precio,id_categoria,imagen,categoria);
               listacat.add(producto);
            }
            
            return listacat;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
    }
  }  
   
   
   
}