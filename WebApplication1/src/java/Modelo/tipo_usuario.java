
package Modelo;
public class tipo_usuario {
    
    private int id_tipo;
    private String rol;

    public tipo_usuario(int id_tipo, String rol) {
        this.id_tipo = id_tipo;
        this.rol = rol;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    
}
