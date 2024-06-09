package Modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Conexion;

public class empleadoDAO {
    
    Connection conexion;

    public empleadoDAO(){
        Conexion cn=new Conexion();
        conexion=cn.getConexion();
    
    
    }
    
    public List<empleado>listarempleado(){
        PreparedStatement ps;
        ResultSet rs;
        List<empleado> lista=new ArrayList<>();
        
        try{
           ps =conexion.prepareStatement("SELECT e.id_empleado , e.Apellido,e.Nombre,e.dni,e.email,e.telefono,e.fecha_nacimiento,e.direccion,e.id_cargo,c.nombre_Cargo  FROM empleados as e\n" +
"Inner join cargo_empleado as c On e.id_cargo = c.id_Cargo;");
           rs=ps.executeQuery();
           while(rs.next()){
                  
                int id=rs.getInt("e.id_empleado");
                String apellido=rs.getString("e.Apellido");
                String nombre=rs.getString("e.Nombre");
                String dni=rs.getString("e.dni");
                String email=rs.getString("e.email");
                String telefono=rs.getString("e.telefono");
                String date=rs.getString("e.fecha_nacimiento");
                String direccion=rs.getString("e.direccion");
                int id_cargo=rs.getInt("e.id_cargo");
                String cargo=rs.getString("c.nombre_cargo");
                empleado empleado= new empleado(id,apellido,nombre,dni,email,telefono,date,direccion,id_cargo,cargo);
                lista.add(empleado);
               
           }
           return lista;
        
        }catch(SQLException e){ 
               System.out.println(e.toString());
                return null;
        
        
        }
    
    }
    
    public empleado mostrarempleado(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        empleado empleado = null;
        
        try{
            ps=conexion.prepareStatement("SELECT e.id_empleado , e.Apellido,e.Nombre,e.dni,e.email,e.telefono,e.fecha_nacimiento,e.direccion,e.id_Cargo,c.nombre_Cargo  FROM empleados as e\n" +
"Inner join cargo_empleado as c On e.id_cargo = c.id_Cargo WHERE e.id_empleado=? ");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                
                 int id=rs.getInt("e.id_empleado");
                String apellido=rs.getString("e.Apellido");
                String nombre=rs.getString("e.Nombre");
                String dni=rs.getString("e.dni");
                String email=rs.getString("e.email");
                String telefono=rs.getString("e.telefono");
                String date=rs.getString("e.fecha_nacimiento");
                String direccion=rs.getString("e.direccion");
                int id_cargo=rs.getInt("e.id_cargo");
                String cargo=rs.getString("c.nombre_cargo");
                
                empleado= new empleado(id,apellido,nombre,dni,email,telefono,date,direccion,id_cargo,cargo);
               
            }
            
            return empleado;
            
        }catch(SQLException e){
                System.out.println(e.toString());
                return null;
        
        }
    }
    
    public boolean insertar(empleado empleado){
        PreparedStatement ps;
        
        try{
             
            ps=conexion.prepareStatement("INSERT INTO empleados ( Apellido,Nombre,dni,email,telefono,fecha_nacimiento,direccion,id_cargo) VALUES (?,?,?,?,?,?,?,?) ");
            
            ps.setString(1,empleado.getApellido());
            ps.setString(2,empleado.getNombre());
            ps.setString(3,empleado.getDni());
            ps.setString(4,empleado.getEmail());
            ps.setString(5,empleado.getTelefono());
            ps.setString(6,empleado.getFecha_nacimiento());
            ps.setString(7, empleado.getDireccion());
            ps.setInt(8,empleado.getId_cargo());
             ps.execute();    
            return true;
             
        }catch(SQLException e){
               
                System.out.println(e.toString());
                return false;
              
        }
    
    }
    
     public boolean actualizar(empleado empleado){
        PreparedStatement ps;
        
        try{
             
            ps=conexion.prepareStatement("UPDATE empleados SET Apellido=?,Nombre=?,dni=?,email=?,telefono=?,fecha_nacimiento=?,direccion=?,id_cargo=? WHERE id_empleado=? ");
            
            ps.setString(1,empleado.getApellido());
            ps.setString(2,empleado.getNombre());
            ps.setString(3,empleado.getDni());
            ps.setString(4,empleado.getEmail());
            ps.setString(5,empleado.getTelefono());
            ps.setString(6,empleado.getFecha_nacimiento());
            ps.setString(7, empleado.getDireccion());
            ps.setInt(8,empleado.getId_cargo());
            ps.setInt(9,empleado.getId_empleado());  
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
             ps=conexion.prepareStatement("DELETE FROM empleados WHERE id_empleado=?");
             ps.setInt(1,_id);
             ps.execute();
             
             return true;
        
        }catch(SQLException e){
            System.out.println(e.toString());
            return false;
        
        }
    
    }
    
}
