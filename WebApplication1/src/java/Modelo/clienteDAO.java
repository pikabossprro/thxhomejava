
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class clienteDAO {
    
     Connection conexion;
     
       public clienteDAO(){
       Conexion cn=new Conexion();
       conexion=cn.getConexion();
    
    } 
   
      public List<cliente>listarcliente(){
          PreparedStatement ps;
          ResultSet rs;
          List<cliente> lista=new ArrayList<>();
          
          try{
              ps=conexion.prepareStatement("SELECT * FROM cliente");
              rs=ps.executeQuery();
              while(rs.next()){
                  int id=rs.getInt("id_cliente");
                  String nombre=rs.getString("Nombre");
                  String apellido=rs.getString("Apellido");
                  String email=rs.getString("email");
                  String contraseña=rs.getString("contraseña");
                  String telefono=rs.getString("telefono");
                  
                  cliente cliente = new cliente(id,nombre,apellido,email,contraseña,telefono);
                  lista.add(cliente);
              
              }
              return lista;
          
          }catch(SQLException e ){
                System.out.println(e.toString());
                return null;
                 
          }
      
      
      }
      
      public cliente mostrarcliente(int _id){
          
        PreparedStatement ps ;
        ResultSet rs;
        
        cliente cliente =null;
        try{
            ps=conexion.prepareStatement("SELECT id_cliente , Nombre ,Apellido,Email,contraseña,telefono FROM cliente WHERE id_cliente=? ");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                  int id=rs.getInt("id_cliente");
                  String nombre=rs.getString("Nombre");
                  String apellido=rs.getString("Apellido");
  
                  String email=rs.getString("email");
                  String contraseña=rs.getString("contraseña");
                  String telefono=rs.getString("telefono");
                  
                 cliente = new cliente(id,nombre,apellido,email,contraseña,telefono);
            
            }
        
                  return cliente;
         }catch(SQLException e){
                System.out.println(e.toString());
                return null;
        
        
        }
        
        }
       public boolean insertar(cliente cliente){
          
        PreparedStatement ps ;
        
        try{
            ps=conexion.prepareStatement("INSERT INTO cliente  (Nombre,Apellido,Email,contraseña,telefono) values(?,?,?,?,?) ");
            
            ps.setString(1,cliente.getNombre());
            ps.setString(2,cliente.getApellido());
            ps.setString(3,cliente.getEmail());
            ps.setString(4,cliente.getContraseña());
            ps.setString(5,cliente.getTelefono());
            
                   ps.execute();        
                  return true;
         }catch(SQLException e){
                System.out.println(e.toString());
                return false;
        
        
        }
        
        }
        public boolean actualizar(cliente cliente){
          
        PreparedStatement ps ;
        
        try{
            ps=conexion.prepareStatement("UPDATE cliente SET Nombre =?,Apellido=?,,Email=?,contraseña=?,telefono=?  WHERE id_cliente=? ");
            
            ps.setString(1,cliente.getNombre());
            ps.setString(2,cliente.getApellido());
            ps.setString(3,cliente.getEmail());
            ps.setString(4,cliente.getContraseña());
            ps.setString(5,cliente.getTelefono());
            ps.setInt(6,cliente.getId_cliente());
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
                  ps=conexion.prepareStatement("DELETE FROM cliente WHERE id_cliente =? ");
                  ps.setInt(1,_id);
                  ps.execute();
                  return true;
                          
              
               }catch(SQLException e){
                   System.out.println(e.toString());
                   return false;
              }
        
        
        }
             
      
      }
      
       
   
