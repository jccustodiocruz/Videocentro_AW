<%@page import="objetosNegocio.Renta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rentas</title>
        <link rel="stylesheet" href="estilo/estilo.css"/>
    </head>
    <%
        List<Renta> rentas = (List<Renta>) request.getAttribute("rentas");
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
                <header>Rentas</header>
                <div class="contenido">                     
                    <div class="tabla">
                        <table>
                            <thead>
                            <th>Cliente</th>
                            <th>Videojuego</th>                            
                            <th>Fecha</th>
                            <th>Tiempo de renta</th>
                            <th></th>
                            </thead>                        
                            <%for (Renta r : rentas) {%>     
                            <c:url var="linkDevolver" value="controladorRentas">
                                <c:param name="instruccion" value="devolverRenta"></c:param>
                                <c:param name="cliente" value="<%= r.getCliente().getNumCredencial()%>"></c:param>
                                <c:param name="videojuego" value="<%= r.getArticulo().getNumCatalogo()%>"></c:param>
                            </c:url>
                            <tr>
                                <td><%= r.getCliente().getNombre()%></td>
                                <td><%= r.getArticulo().getTitulo()%></td>
                                <td><%= r.getFechaRenta()%></td>
                                <td><%= r.getTiempoRenta()%></td>
                                <td><a href="${linkDevolver}">Devolver</a></td>                                                           
                            </tr>
                            <%}%>
                        </table>        
                    </div>
                    <div>
                        <input type="submit" value="Rentar" onclick="window.location.href = 'controladorRentas?instruccion=formularioRenta'">                                                
                    </div>       
                </div>
            </div>
    </body>
</html>
