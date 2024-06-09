
package Modelo;

public class usuario {
    private int id_usuario , id_tipo_usuario ;


    private String Nombre , Apellido , correo  ,contraseña ,tipo_usuario ;

    public usuario(int id_usuario, String Nombre, String Apellido, String correo, String contraseña ,int id_tipo_usuario,String tipo_usuario) {
        this.id_usuario = id_usuario;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.correo = correo;
        this.contraseña = contraseña;
        this.id_tipo_usuario=id_tipo_usuario;
        this.tipo_usuario=tipo_usuario;
        
    }
     public String getTipo_usuario(){
     
           return tipo_usuario;
     
     }
     public void setTipo_usuario(String tipo_usuario){
               this.tipo_usuario=tipo_usuario;
     }

     public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }
    
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
     
    public String getNombre() {
        return Nombre;
    }
     
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    public String getApellido() {
        return Apellido;
    }
    
    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public String getContraseña() {
        return contraseña;
    }
    
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    

}
    
 