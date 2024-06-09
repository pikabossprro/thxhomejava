
package Modelo;

public class empleado {
    
    private int id_empleado ,id_cargo;
    private String Apellido, Nombre, dni, email , telefono, fecha_nacimiento,direccion , cargo;

    public empleado(int id_empleado, String Apellido, String Nombre, String dni, String email, String telefono, String fecha_nacimiento, String direccion, int id_cargo , String cargo) {
        this.id_empleado = id_empleado;
        this.id_cargo = id_cargo;
        this.Apellido = Apellido;
        this.Nombre = Nombre;
        this.dni = dni;
        this.email = email;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
        this.direccion = direccion;
        this.cargo=cargo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    
    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
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

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
}
