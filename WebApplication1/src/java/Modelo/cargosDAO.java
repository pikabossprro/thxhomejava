
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class cargosDAO {
    Connection conexion;
    
    public cargosDAO(){
        Conexion cn=new Conexion();
        conexion=cn.getConexion();
    }
    public List<cargos>listarcargos(){
        
        PreparedStatement ps;
        ResultSet rs;
        List<cargos> lista = new ArrayList<>();
        
        try{
            ps=conexion.prepareStatement("SELECT id_cargo,nombre_cargo FROM cargo_empleado");
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id_cargo");
                String nombre=rs.getString("nombre_cargo");
                
                cargos cargos=new cargos(id,nombre);
                lista.add(cargos);
                
            }
            return lista;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;        
        }
        
    }
        public cargos mostrarcargos(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        cargos cargo=null;
        
        try{
            
            ps=conexion.prepareStatement("SELECT id_cargo , nombre_cargo From cargo_empleado WHERE id_cargo=?");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id_cargo");
                String nombre=rs.getString("nombre_cargo");
                
                cargo=new cargos(id,nombre);
            
            }
            return cargo;
            
        
        }catch(SQLException e){
               System.out.println(e.toString());
                return null;
        }
        
    }
    
    
}
