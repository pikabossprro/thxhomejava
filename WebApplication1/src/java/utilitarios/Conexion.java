
package utilitarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion{    
    public  Connection getConexion(){
        String  user="root";
        String  clave="";

            try {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_megamarket",user,clave);
                 System.out.println("conexion exitosa");
                 return conexion;
                
            } catch (SQLException e) {
                System.out.println(e.toString());
                return null;
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
          
            
    }  


}
