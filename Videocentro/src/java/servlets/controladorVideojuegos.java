package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetosNegocio.ArticuloED;
import objetosNegocio.Videojuego;
import persistencia.PersistenciaBD;

/**
 *
 * @author jc
 */
@WebServlet(name = "controladorVideojuegos", urlPatterns = {"/controladorVideojuegos"})
public class controladorVideojuegos extends HttpServlet {

    PersistenciaBD crud;

    @Override
    public void init() throws ServletException {
        super.init();

        crud = new PersistenciaBD();
    }

    protected void listarVideojuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Videojuego> videojuegos;

        videojuegos = crud.consultarVideojuegos();

        request.setAttribute("listaVideojuegos", videojuegos);

        RequestDispatcher rd = request.getRequestDispatcher("videojuegos.jsp");
        rd.forward(request, response);
    }

    protected void agregarVideojuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        String clasificacion = request.getParameter("clasificacion");
        String consola = request.getParameter("consola");
        String fabricante = request.getParameter("fabricante");
        int version = Integer.parseInt(request.getParameter("version"));

        Videojuego vj = new Videojuego(numCatalogo, titulo, genero, clasificacion, consola, fabricante, version);

        crud.agregar(vj);

        listarVideojuegos(request, response);
    }

    protected void eliminarVideojuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");

        Videojuego vj = new Videojuego(numCatalogo);

        crud.eliminar(vj);

        listarVideojuegos(request, response);
    }

    protected void modificarVideojuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");
        Videojuego vj = new Videojuego(numCatalogo);

        Videojuego videojuego = crud.obten(vj);

        request.setAttribute("videojuego", videojuego);

        RequestDispatcher rd = request.getRequestDispatcher("formularioActualizarVideojuego.jsp");
        rd.forward(request, response);
    }

    protected void actualizarVideojuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        String clasificacion = request.getParameter("clasificacion");
        String consola = request.getParameter("consola");
        String fabricante = request.getParameter("fabricante");
        int version = Integer.parseInt(request.getParameter("version"));

        Videojuego vj = new Videojuego(numCatalogo, titulo, genero, clasificacion, consola, fabricante, version);

        crud.actualizar(vj);

        listarVideojuegos(request, response);
    }

    protected void listarInventario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ArticuloED> inventario;

        inventario = crud.consultarInventarioVideojuegos();

        request.setAttribute("inventario", inventario);

        RequestDispatcher rd = request.getRequestDispatcher("inventario.jsp");
        rd.forward(request, response);
    }

    protected void inventariar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titulo = request.getParameter("tituloVideojuego");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String numCatalogo = null;
        List<Videojuego> videojuegos = crud.consultarVideojuegos();

        for (Videojuego vj : videojuegos) {
            if (vj.getTitulo().equalsIgnoreCase(titulo)) {
                numCatalogo = vj.getNumCatalogo();
            }
        }

        Videojuego vj = new Videojuego(numCatalogo);
        crud.inventariar(vj, cantidad);

        listarInventario(request, response);
    }

    protected void formularioInventario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Videojuego> videojuegos;

        videojuegos = crud.consultarVideojuegos();

        request.setAttribute("listaVideojuegos", videojuegos);

        RequestDispatcher rd = request.getRequestDispatcher("formularioInventario.jsp");
        rd.forward(request, response);
    }

    protected void desinventariarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");

        request.setAttribute("numCatalogo", numCatalogo);

        RequestDispatcher rd = request.getRequestDispatcher("formularioDesinventariar.jsp");
        rd.forward(request, response);
    }

    protected void desinventariar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numCatalogo = request.getParameter("numCatalogo");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        
        Videojuego vj = new Videojuego(numCatalogo);
        
        crud.desinventariar(vj, cantidad);
        listarInventario(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String instruccion = request.getParameter("instruccion");
        if (instruccion == null) {
            instruccion = "listarVideojuegos";
        }

        switch (instruccion) {
            case "agregarVideojuego":
                agregarVideojuego(request, response);
                break;
            case "listarVideojuegos":
                listarVideojuegos(request, response);
                break;
            case "modificarVideojuego":
                modificarVideojuego(request, response);
                break;
            case "actualizarVideojuego":
                actualizarVideojuego(request, response);
                break;
            case "eliminarVideojuego":
                eliminarVideojuego(request, response);
                break;
            case "listarInventario":
                listarInventario(request, response);
                break;
            case "inventariar":
                inventariar(request, response);
                break;
            case "formularioInventario":
                formularioInventario(request, response);
                break;
            case "desinventariar":
                desinventariar(request, response);
                break;
            case "desinventariarFormulario":
                desinventariarFormulario(request, response);
                break;
            default:
                listarVideojuegos(request, response);
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
