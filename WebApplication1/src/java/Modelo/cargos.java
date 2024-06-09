
package Modelo;
       
public class cargos {
    private int id_cargo;
    private String nombre;

    public cargos(int id_cargo, String nombre) {
        this.id_cargo = id_cargo;
        this.nombre = nombre;
    }

    public int getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
