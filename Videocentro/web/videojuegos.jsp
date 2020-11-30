<%@page import="objetosNegocio.Videojuego"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videojuegos</title>
        <link rel="stylesheet" href="estilo/estilo.css"/>
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
                    <li><a href="clientes.jsp">Clientes</a></li>
                    <li><a href="videojuegos.jsp">Videojuegos</a></li>
                    <li><a href="rentas.jsp">Rentas</a></li>
                    <li><a href="inventario.jsp">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Videojuegos</header>
                <div class="contenido">
                    <div>
                        <input type="submit" value="Agregar Videojuego" onclick="window.location.href= 'formularioVideojuego.jsp'">
                    </div>
                    <div class="tabla">
                        <table>
                            <thead>
                            <th>Num Catálogo</th>
                            <th>Título</th>
                            <th>Género</th>
                            <th>Clasificación</th>
                            <th>Consola</th>
                            <th>Fabricante</th>
                            <th>Versión</th>
                            <th></th>
                            <th></th>
                            </thead>  
                            <%for (Videojuego vj : videojuegos) {%>
                            <tr>
                                <td><%= vj.getNumCatalogo()%></td>
                                <td><%= vj.getTitulo()%></td>
                                <td><%= vj.getGenero()%></td>
                                <td><%= vj.getClasificacion()%></td>
                                <td><%= vj.getConsola()%></td>
                                <td><%= vj.getFabricante()%></td>
                                <td><%= vj.getVersion()%></td>
                                <td>Modificar</td>
                                <td>Eliminar</td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>