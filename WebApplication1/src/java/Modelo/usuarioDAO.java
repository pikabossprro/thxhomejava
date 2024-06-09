
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class usuarioDAO {
    Connection conexion;
    
    public usuarioDAO() {
        Conexion cn=new Conexion();
        conexion = cn.getConexion();    
    }
    
    public List<usuario> listarusuario(){
        PreparedStatement ps;
        ResultSet rs;
        
        List<usuario> lista =new ArrayList<>();
        
        try{
            
            ps = conexion.prepareStatement("select u.id_usuario , u.Nombre ,u.Apellido, u.correo , u.contraseña, u.id_tipo_usuario ,t.rol_usuario from usuario as u \n" +
                                                          "inner join tipo_usuario as t on t.id_tipo_usuario= u.id_tipo_usuario ;");
            rs=ps.executeQuery();
            while(rs.next()){
                 int  id = rs.getInt("u.id_usuario");
                 String  nombre = rs.getString("u.Nombre");          
                 String  apellido = rs.getString("u.Apellido");           
                 String  correo = rs.getString("u.correo");               
                 String  contraseña = rs.getString("u.contraseña");
                 int  id_tipo = rs.getInt("u.id_tipo_usuario");
                 String  tipo_usuario = rs.getString("t.rol_usuario");
                 
                 usuario users = new usuario(id,nombre,apellido,correo,contraseña,id_tipo,tipo_usuario);
                 lista.add(users);
            }
            return lista;
        
        }catch(SQLException e){
                  System.out.println(e.toString());
                  return null ;
        }
        
    }
    
    public usuario mostrarusuario(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        usuario usuario = null;
        
        try{
            
            ps = conexion.prepareStatement("select u.id_usuario , u.Nombre ,u.Apellido, u.correo , u.contraseña, u.id_tipo_usuario ,t.rol_usuario from usuario as u \n" +
                                                          "inner join tipo_usuario as t on t.id_tipo_usuario= u.id_tipo_usuario WHERE u.id_usuario=? ");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                
                 int  id = rs.getInt("u.id_usuario");
                 String  nombre = rs.getString("u.Nombre");          
                 String  apellido = rs.getString("u.Apellido");           
                 String  correo = rs.getString("u.correo");               
                 String  contraseña = rs.getString("u.contraseña");
                 int  id_tipo = rs.getInt("u.id_tipo_usuario");
                 String  tipo_usuario = rs.getString("t.rol_usuario");
                 
                 usuario  = new usuario(id,nombre,apellido,correo,contraseña,id_tipo,tipo_usuario);
                 
            }
            return usuario;
        
        }catch(SQLException e){
                  System.out.println(e.toString());
                  return null ;
        }
        
    }
    
    public boolean insertar(usuario usuario){
        
        PreparedStatement ps;
        
        try{
            
            ps = conexion.prepareStatement("INSERT INTO  usuario (Nombre , Apellido, correo,contraseña ,id_tipo_usuario) VALUES(?,?,?,?,?)");
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getApellido());
            ps.setString(3,usuario.getCorreo());
            ps.setString(4,usuario.getContraseña());
            ps.setInt(5,usuario.getId_tipo_usuario());
            ps.execute();
           
          return true;
        
        }catch(SQLException e){
                  System.out.println(e.toString());
                  return false ;
        }
        
    }
    
   public boolean actualizar(usuario usuario){
        PreparedStatement ps;
        
        try{
            
            ps = conexion.prepareStatement("UPDATE usuario SET Nombre=?, Apellido=?,correo=?,contraseña=?,id_tipo_usuario=? WHERE id_usuario=?");
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getApellido());
            ps.setString(3,usuario.getCorreo());
            ps.setString(4,usuario.getContraseña());
            ps.setInt(5,usuario.getId_tipo_usuario());
            ps.setInt(6,usuario.getId_usuario());
            ps.execute();
           
          return true;
        
        }catch(SQLException e){
                  System.out.println(e.toString());
                  return false ;
        }
        
    }
  
   public boolean eliminar(int _id){
        PreparedStatement ps;
        
        try{
            
            ps = conexion.prepareStatement("DELETE FROM usuario WHERE id_usuario=? ");
            ps.setInt(1,_id);
            ps.execute();
           
          return true;
        
        }catch(SQLException e){
                  System.out.println(e.toString());
                  return false ;
        }
        
    }
   




}
