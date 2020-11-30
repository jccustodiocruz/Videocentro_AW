/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Cliente> clientes;         
        
        clientes = crud.consultarClientes();               
        
        request.setAttribute("listaClientes", clientes);
        
        RequestDispatcher rd = request.getRequestDispatcher("/clientes.jsp");
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
