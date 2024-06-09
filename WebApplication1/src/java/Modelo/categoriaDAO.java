package Modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class categoriaDAO {
    Connection conexion;
    
    public categoriaDAO(){
        Conexion cn=new Conexion();
        conexion=cn.getConexion();
    }
    public List<categoria>listarcategoria(){
        
        PreparedStatement ps;
        ResultSet rs;
        List<categoria> lista = new ArrayList<>();
        
        try{
            ps=conexion.prepareStatement("SELECT id_categoria,nombre,descripcion FROM categoria");
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id_categoria");
                String nombre=rs.getString("nombre");
                String apellido=rs.getString("descripcion");
                categoria categoria=new categoria(id,nombre,apellido);
                lista.add(categoria);
                
            }
            return lista;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;        
        }
        
    }
    
    public categoria mostrarcategoria(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        categoria categoria=null;
        
        try{
            
            ps=conexion.prepareStatement("SELECT id_categoria , nombre, descripcion From categoria WHERE id_categoria=?");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id_categoria");
                String nombre=rs.getString("nombre");
                String descripcion=rs.getString("descripcion");
                
                categoria=new categoria(id,nombre,descripcion);
            
            }
            return categoria;
            
        
        }catch(SQLException e){
               System.out.println(e.toString());
                return null;
        }
        
    }
    
    public boolean insertar(categoria categoria){
    
        PreparedStatement ps;
        try{
             
            ps=conexion.prepareStatement("INSERT INTO categoria (nombre, descripcion) VALUES(?,?)");
            
            ps.setString(1, categoria.getNombre());
            ps.setString(2, categoria.getDescripcion());
            ps.execute();
            return true;
        
        }catch(SQLException e){
                
             System.out.println(e.toString());
             return false;
        
        }
    
    }
    
    public boolean actualizar(categoria categoria){
        PreparedStatement ps;
        
        try{
             
            ps=conexion.prepareStatement("UPDATE categoria SET nombre=? , descripcion=? WHERE id_categoria=?");
            ps.setString(1, categoria.getNombre());
            ps.setString(2, categoria.getDescripcion());
            ps.setInt(3,categoria.getId_categoria());
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
            
             ps=conexion.prepareStatement("DELETE FROM categoria WHERE id_categoria=?");
             ps.setInt(1,_id);
             ps.execute();
             return true;
         
         }catch(SQLException e){
            System.out.println(e.toString());
            return false;
                 
         }
    
    }
     
}
