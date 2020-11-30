package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Videojuego> videojuegos;         
        
        videojuegos = crud.consultarVideojuegos();
        
        request.setAttribute("listaVideojuegos", videojuegos);
        
        RequestDispatcher rd = request.getRequestDispatcher("/videojuegos.jsp");
        rd.forward(request, response);
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
