package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetosNegocio.Cliente;
import persistencia.PersistenciaBD;

/**
 *
 * @author jc
 */
@WebServlet(name = "controladorClientes", urlPatterns = {"/controladorClientes"})
public class controladorClientes extends HttpServlet {

    private PersistenciaBD crud;

    @Override
    public void init() throws ServletException {
        super.init();

        crud = new PersistenciaBD();

    }

    protected void listarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> clientes;

        clientes = crud.consultarClientes();

        request.setAttribute("listaClientes", clientes);

        RequestDispatcher rd = request.getRequestDispatcher("clientes.jsp");
        rd.forward(request, response);
    }

    protected void agregarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCredencial = request.getParameter("numCredencial");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Cliente c = new Cliente(numCredencial, nombre, direccion, telefono);

        crud.agregar(c);

        listarClientes(request, response);
    }

    protected void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void modificarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCredencial = request.getParameter("numCredencial");
        Cliente c = new Cliente(numCredencial);

        Cliente cliente = crud.obten(c);

        request.setAttribute("cliente", cliente);

        RequestDispatcher rd = request.getRequestDispatcher("formularioActualizarCliente.jsp");
        rd.forward(request, response);
    }

    protected void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCredencial = request.getParameter("numCredencial");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        
        Cliente cliente = new Cliente(numCredencial, nombre, direccion, telefono);
        
        crud.actualizar(cliente);
        
        listarClientes(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String instruccion = request.getParameter("instruccion");
        if (instruccion == null) {
            instruccion = "listarClientes";
        }

        switch (instruccion) {
            case "agregarCliente":
                agregarCliente(request, response);
                break;
            case "listarClientes":
                listarClientes(request, response);
                break;
            case "modificarCliente":
                modificarCliente(request, response);
                break;
            case "actualizarCliente":
                actualizarCliente(request, response);
                break;
            default:
                listarClientes(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
