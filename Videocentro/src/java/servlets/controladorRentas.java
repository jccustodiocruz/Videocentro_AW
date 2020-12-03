package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetosNegocio.Cliente;
import objetosNegocio.Renta;
import objetosNegocio.Videojuego;
import objetosServicio.Fecha;
import persistencia.PersistenciaBD;

/**
 *
 * @author jc
 */
@WebServlet(name = "controladorRentas", urlPatterns = {"/controladorRentas"})
public class controladorRentas extends HttpServlet {

    private PersistenciaBD crud;

    @Override
    public void init() throws ServletException {
        super.init();

        crud = new PersistenciaBD();

    }

    protected void listarRentas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Renta> rentas = crud.consultarRentasVideojuegos();

        request.setAttribute("rentas", rentas);

        RequestDispatcher rd = request.getRequestDispatcher("rentas.jsp");
        rd.forward(request, response);
    }

    protected void devolverRenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String numCredencial = request.getParameter("cliente");
        String numCatalogo = request.getParameter("videojuego");

        Cliente c = new Cliente(numCredencial);
        Videojuego vj = new Videojuego(numCatalogo);

        Renta renta = new Renta(c, vj);

        crud.devolverVideojuego(renta);

        listarRentas(request, response);
    }

    protected void formularioRenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Videojuego> videojuegos;
        videojuegos = crud.consultarVideojuegos();

        List<Cliente> clientes;
        clientes = crud.consultarClientes();
        
        request.setAttribute("listaVideojuegos", videojuegos);
        request.setAttribute("listaClientes", clientes);
        
        RequestDispatcher rd = request.getRequestDispatcher("formularioRenta.jsp");
        rd.forward(request, response);

    }

    protected void rentar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tiempoRenta = Integer.parseInt(request.getParameter("tiempoRenta"));
        
        String nombreCliente = request.getParameter("nombreCliente");
        String numCredencial = null;
        List<Cliente> clientes = crud.consultarClientes();
        for(Cliente c : clientes){
            if(c.getNombre().equalsIgnoreCase(nombreCliente)){
                numCredencial = c.getNumCredencial();
            }
        }
        
        String tituloVideojuego = request.getParameter("tituloVideojuego");
        String numCatalogo = null;
        List<Videojuego> videojuegos = crud.consultarVideojuegos();
        for (Videojuego vj : videojuegos) {
            if (vj.getTitulo().equalsIgnoreCase(tituloVideojuego)) {
                numCatalogo = vj.getNumCatalogo();
            }
        }
        
        Cliente c = new Cliente(numCredencial);
        Videojuego vj = new Videojuego(numCatalogo);
        
        Date date = new Date();int day = date.getDay();int month = date.getMonth()+1;int year = date.getYear()+1900;
        Fecha fecha = new Fecha(day, month, year);
        
        Renta renta = new Renta(c, vj, fecha, tiempoRenta);
        
        crud.rentarVideojuego(renta);
        
        listarRentas(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String instruccion = request.getParameter("instruccion");

        if (instruccion == null) {
            instruccion = "listarRentas";
        }

        switch (instruccion) {
            case "listarRentas":
                listarRentas(request, response);
                break;
            case "devolverRenta":
                devolverRenta(request, response);
                break;
            case "formularioRenta":
                formularioRenta(request, response);
                break;
            case "rentar":
                rentar(request, response);
                break;
            default:
                listarRentas(request, response);
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
