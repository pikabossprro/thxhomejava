
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class proveedorDAO {
    
        Connection conexion;
    
    public proveedorDAO(){
    
        Conexion cn =new Conexion();
        conexion = cn.getConexion();
    }
    
    
    public List<proveedor>listarproveedor(){
        PreparedStatement ps;
        ResultSet rs;
        List<proveedor> lista = new ArrayList<>();
        try {
            ps = conexion.prepareStatement("SELECT id_proveedor , direccion , email,telefono, nombre_proveedor,ruc FROM proveedor ");
            rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id_proveedor");
                String direccion=rs.getString("direccion");
                String correo=rs.getString("email");
                String telefono=rs.getString("telefono");
                String nombre=rs.getString("nombre_proveedor");    
                String ruc=rs.getString("ruc");    
                proveedor proveedor =new proveedor(id,direccion,correo,telefono,nombre,ruc);
                lista.add(proveedor);
            
            }
            
        
         return lista;
        
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;   
        
        
        }
    
    
    }
    
    public proveedor mostrarproveedor(int _id){
        PreparedStatement ps ;
        ResultSet rs;
        
        proveedor proveedor= null;
        
        try{
            ps=conexion.prepareStatement("SELECT id_proveedor , direccion , email,telefono, nombre_proveedor ,ruc FROM proveedor WHERE id_proveedor =? ");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                int id =rs.getInt("id_proveedor");
                String direccion=rs.getString("direccion");
                String correo=rs.getString("email");
                String telefono=rs.getString("telefono");
                String nombre=rs.getString("nombre_proveedor");    
                String ruc=rs.getString("ruc");    
                 proveedor  =new proveedor(id,direccion,correo,telefono,nombre,ruc);    
            
            }
        
        return proveedor;
        
        
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;
        
        }
                     
                    

}
    
    public boolean insertar(proveedor proveedor){
        
        PreparedStatement ps;
        
        try{
              ps=conexion.prepareStatement("INSERT INTO proveedor(direccion , email,telefono, nombre_proveedor,ruc) VALUES(?,?,?,?,?)");
              
              ps.setString(1, proveedor.getDireccion());
              ps.setString(2, proveedor.getEmail());
              ps.setString(3,proveedor.getTelefono());
              ps.setString(4,proveedor.getNombre());
              ps.setString(5,proveedor.getRuc());

              
             ps.execute();
            
            return true;
              
           
        
        }catch(SQLException e){
                System.out.println(e.toString());
                 return false;   

        }
    
    
    
    }
    
        public boolean actualizar(proveedor proveedor){
        
        PreparedStatement ps;
        
        try{
              ps=conexion.prepareStatement("UPDATE proveedor SET direccion=? , email=?, telefono=?, nombre_proveedor=?, ruc=? WHERE id_proveedor=?");
              
              ps.setString(1, proveedor.getDireccion());
              ps.setString(2, proveedor.getEmail());
              ps.setString(3,proveedor.getTelefono());
              ps.setString(4,proveedor.getNombre());
              ps.setString(5,proveedor.getRuc());
              ps.setInt(6,proveedor.getId_proveedor());
              
              
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
              ps=conexion.prepareStatement("DELETE FROM proveedor WHERE id_proveedor=?");
    
              ps.setInt(1,_id);
              
             ps.execute();
            
            return true;
              
           
        
        }catch(SQLException e){
                System.out.println(e.toString());
                 return false;   

        }
    
    
    
    }
        
        
}
