<%@page import="java.util.List"%>
<%@page import="objetosNegocio.ArticuloED"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
        <link rel="stylesheet" href="estilo/estilo.css"/>
    </head>
    <%
        List<ArticuloED> inventario = (List<ArticuloED>) request.getAttribute("inventario");
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
                <header>Inventario</header>
                <div class="contenido">
                    <div>
                        <input type="submit" value="Inventariar" onclick="window.location.href = 'controladorVideojuegos?instruccion=formularioInventario'">
                    </div>      
                    <div class="tabla">
                        <table>
                            <thead>
                            <th>Num Catálogo</th>
                            <th>Título</th>
                            <th>Existencia</th>
                            <th>Disponibles</th>
                            <th></th>
                            </thead>                               
                            <%for (ArticuloED a : inventario) {%> 
                            <c:url var="linkDesinventariar" value="controladorVideojuegos">
                                <c:param name="instruccion" value="desinventariarFormulario"></c:param>
                                <c:param name="numCatalogo" value="<%= a.getArticulo().getNumCatalogo()%>"></c:param>
                            </c:url>
                            <tr>
                                <td><%= a.getArticulo().getNumCatalogo()%></td>
                                <td><%= a.getArticulo().getTitulo()%></td>
                                <td><%= a.getExistencia()%></td>     
                                <td><%= a.getDisponibilidad()%></td>     
                                <td><a href="${linkDesinventariar}">Desinventariar</a></td>                          
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
