
package Modelo;
public class proveedor {
    private int id_proveedor;
    private String direccion , email , telefono , nombre ,ruc;

    public proveedor(int id_proveedor, String direccion, String email, String telefono, String nombre , String ruc) {
        this.id_proveedor = id_proveedor;
        this.direccion = direccion;
        this.email = email;
        this.telefono = telefono;
        this.nombre = nombre;
        this.ruc = ruc;
    }

    
    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    
    
    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
}
