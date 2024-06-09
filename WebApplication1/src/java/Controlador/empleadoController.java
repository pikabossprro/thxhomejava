
package Controlador;


import Modelo.cargos;
import Modelo.cargosDAO;
import Modelo.empleado;
import Modelo.empleadoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "empleadoController", urlPatterns = {"/empleadoController"})
public class empleadoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        empleadoDAO empleadoDAO=new empleadoDAO();
        cargosDAO cargosDAO= new cargosDAO();
        
        String accion;
        HttpSession sesion = request.getSession();
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(sesion.getAttribute("logueado")== null || sesion.getAttribute("logueado").equals("0")){
            
            dispatcher = request.getRequestDispatcher("index.jsp");
        
            
        }else if("nuevo".equals(accion)){
            
                dispatcher=request.getRequestDispatcher("empleado/nuevo.jsp");
                List<cargos> listacargos=cargosDAO.listarcargos();
                request.setAttribute("lista" , listacargos);
                
        }else if("Registrar".equals(accion)){
                         
            String apellido=request.getParameter("apellido");
            String nombre=request.getParameter("nombre");
            String dni =request.getParameter("dni");
            String correo=request.getParameter("correo");
            String telefono=request.getParameter("telefono");
            String fecha_nac=request.getParameter("fecha_nacimiento");
            String direccion=request.getParameter("direccion");
            int id_cargo=Integer.parseInt(request.getParameter("id_cargo"));
                        
            empleado empleado=new empleado(0,apellido,nombre, dni,correo,telefono,fecha_nac,direccion,id_cargo,null);
            empleadoDAO.insertar(empleado);
            dispatcher = request.getRequestDispatcher("empleado/index.jsp");               
            List<empleado> listaempleado=empleadoDAO.listarempleado();
            request.setAttribute("lista",listaempleado);
                
       }else if("modificar".equals(accion)){
              
           dispatcher=request.getRequestDispatcher("empleado/modificar.jsp");
           
           int id=Integer.parseInt(request.getParameter("id"));
           empleado empleado=empleadoDAO.mostrarempleado(id);
           request.setAttribute("empleado",empleado);
           
           List<cargos> listacargos=cargosDAO.listarcargos();
           request.setAttribute("lista" , listacargos);
           
       }else if("actualizar".equals(accion)){
           
            int id=Integer.parseInt(request.getParameter("id"));
            String apellido=request.getParameter("apellido");
            String nombre=request.getParameter("nombre");
            String dni =request.getParameter("dni");
            String correo=request.getParameter("correo");
            String telefono=request.getParameter("telefono");
            String fecha_nac=request.getParameter("fecha_nacimiento");
            String direccion=request.getParameter("direccion");
            int id_cargo=Integer.parseInt(request.getParameter("cargo"));
                        
            empleado empleado=new empleado(id,apellido,nombre, dni,correo,telefono,fecha_nac,direccion,id_cargo,null);
            empleadoDAO.actualizar(empleado);
            dispatcher = request.getRequestDispatcher("empleado/index.jsp");               
            List<empleado> listaempleado=empleadoDAO.listarempleado();
            request.setAttribute("lista",listaempleado);
       
       }else if("eliminar".equals(accion)){
             
            int id=Integer.parseInt(request.getParameter("id"));
            empleadoDAO.eliminar(id);
            dispatcher = request.getRequestDispatcher("empleado/index.jsp");               
            List<empleado> listaempleado=empleadoDAO.listarempleado();
            request.setAttribute("lista",listaempleado);
       
       }else if("ver".equals(accion)){
              
           dispatcher=request.getRequestDispatcher("empleado/ver.jsp");
           int id=Integer.parseInt(request.getParameter("id"));
           
           empleado empleado=empleadoDAO.mostrarempleado(id);
           request.setAttribute("empleado",empleado);

       }
        
        else{
            dispatcher =request.getRequestDispatcher("empleado/index.jsp");
            List<empleado> listaempleado=empleadoDAO.listarempleado();
            request.setAttribute("lista",listaempleado);
        
        }
        
        dispatcher.forward(request,response);
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
