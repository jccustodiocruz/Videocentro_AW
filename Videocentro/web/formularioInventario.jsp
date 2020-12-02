<%@page import="java.util.List"%>
<%@page import="objetosNegocio.Videojuego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventariar</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
    <%
        List<Videojuego> videojuegos = (List<Videojuego>) request.getAttribute("listaVideojuegos");
    %>
    <body>     
        <div class="contenedor">
            <div class="menu">
                <h2>MENU</h2>
                <ul>
                    <li><a href="principal.html">Home</a></li>
                    <li><a href="controladorClientes?instruccion=listar">Clientes</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listar">Videojuegos</a></li>
                    <li><a href="rentas.jsp">Rentas</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarInventario">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Inventariar</header>
                <div class="contenido">                    
                    <form method="get" action="controladorVideojuegos">
                        <input type="hidden" name="instruccion" value="inventariar">
                        <label>Videojuego</label>
                        <input type="text" list="videojuegos" name="tituloVideojuego"> 
                        <datalist id="videojuegos">
                            <%for (Videojuego vj : videojuegos) {%>                           
                            <option value="<%= vj.getTitulo()%>"></option>
                            <%}%>     
                        </datalist>
                        <input type="text" placeholder="Cantidad" name="cantidad" autocomplete="off">                        
                        <div>
                            <input type="submit" value="Inventariar">
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
</html>

