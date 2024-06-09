
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;


public class tipo_usuarioDAO {
    Connection conexion;
    
    public tipo_usuarioDAO(){
          
        Conexion cn=new Conexion();
        conexion =cn.getConexion();

    }
    
    public List<tipo_usuario> listartipousuario(){
        
        PreparedStatement ps;
        ResultSet rs;
        List<tipo_usuario> lista = new ArrayList<>();
        
       try{
            ps=conexion.prepareStatement("SELECT id_tipo_usuario,rol_usuario FROM tipo_usuario");
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id_tipo_usuario");
                String rol=rs.getString("rol_usuario");
                tipo_usuario tipo_usuario=new tipo_usuario(id,rol);
                lista.add(tipo_usuario);
                
            }
            return lista;

    }catch(SQLException e){
                System.out.println(e.toString());
                return null;    
    }
       
}    public tipo_usuario mostrartipousuario(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        tipo_usuario tipo_usuario=null;
        
        try{
            
            ps=conexion.prepareStatement("SELECT id_tipo_usuario, rol_usuario From  tipo_usuario WHERE id_tipo_usuario=?");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id_usuario");
                String nombre=rs.getString("rol_usuario");
                
                tipo_usuario=new tipo_usuario(id,nombre);
            
            }
            return tipo_usuario;
            
        
        }catch(SQLException e){
               System.out.println(e.toString());
                return null;
        }
        
    }
    
}