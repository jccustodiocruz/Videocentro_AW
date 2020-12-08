<%@page import="objetosNegocio.Cliente"%>
<%@page import="objetosNegocio.Videojuego"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Renta</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
    <%
        List<Videojuego> videojuegos = (List<Videojuego>) request.getAttribute("listaVideojuegos");
        List<Cliente> clientes = (List<Cliente>) request.getAttribute("listaClientes");
    %>
    <body>     
        <div class="contenedor">
            <div class="menu">
                <h2>MENU</h2>
                <ul>
                    <li><a href="principal.html">Home</a></li>
                    <li><a href="controladorClientes?instruccion=listarClientes">Clientes</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarVideojuegos">Videojuegos</a></li>
                    <li><a href="controladorRentas?instruccion=listarRentas">Rentas</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarInventario">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Renta</header>
                <div class="contenido">
                    <form method="get" action="controladorRentas">
                        <input type="hidden" name="instruccion" value="rentar">                        
                        <input type="text" list="clientes" name="nombreCliente" placeholder="Cliente"> 
                        <datalist id="clientes">
                            <%for (Cliente c : clientes) {%>                           
                            <option value="<%= c.getNombre()%>"></option>
                            <%}%>     
                        </datalist>                        
                        <input type="text" list="videojuegos" name="tituloVideojuego" placeholder="Videojuego"> 
                        <datalist id="videojuegos">
                            <%for (Videojuego vj : videojuegos) {%>                           
                            <option value="<%= vj.getTitulo()%>"></option>
                            <%}%>     
                        </datalist>
                        <input type="text" placeholder="Tiempo de renta" name="tiempoRenta" autocomplete="off">                        
                        <div>
                            <input type="submit" value="Rentar">
                        </div>
                    </form>         
                </div>
            </div>
        </div>
    </body>
</html>
