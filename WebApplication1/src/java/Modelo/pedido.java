
package Modelo;

public class pedido {
    
    private int id_venta ,id_cliente;
    private String forma_pago,estado_pedido,metodo_entrega ,nombre,apellido,productos,codigo,direccion,telefono ;
    private Double total;

    public pedido(int id_venta, int id_cliente, String forma_pago, String estado_pedido, String metodo_entrega, String nombre, String apellido,String telefono,String direccion,String productos, String codigo, Double total) {
        this.id_venta = id_venta;
        this.id_cliente = id_cliente;
        this.forma_pago = forma_pago;
        this.estado_pedido = estado_pedido;
        this.metodo_entrega = metodo_entrega;
        this.nombre = nombre;
        this.apellido = apellido;
        this.productos = productos;
        this.codigo = codigo;
        this.total = total;
         this.direccion = direccion;
        this.telefono = telefono;
         this.telefono = telefono; 
         
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    
        public String getDireccion() {
        return direccion;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String getTelefono() {
        return telefono;
    }
        
        
        
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String getForma_pago() {
        return forma_pago;
    }

    public void setForma_pago(String forma_pago) {
        this.forma_pago = forma_pago;
    }

    public String getEstado_pedido() {
        return estado_pedido;
    }

    public void setEstado_pedido(String estado_pedido) {
        this.estado_pedido = estado_pedido;
    }

    public String getMetodo_entrega() {
        return metodo_entrega;
    }

    public void setMetodo_entrega(String metodo_entrega) {
        this.metodo_entrega = metodo_entrega;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getProductos() {
        return productos;
    }

    public void setProductos(String productos) {
        this.productos = productos;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
    
}
