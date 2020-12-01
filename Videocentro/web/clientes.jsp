<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
    <%
        List<Cliente> clientes = (List<Cliente>) request.getAttribute("listaClientes");
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
                    <li><a href="inventario.jsp">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Clientes</header>
                <div class="contenido">
                    <div>
                        <input type="submit" value="Agregar Cliente" onclick="window.location.href = 'formularioCliente.jsp'">
                    </div>        
                    <div class="tabla">
                        <table>
                            <thead>
                            <th>Num Credencial</th>
                            <th>Nombre</th>
                            <th>Dirección</th>
                            <th>Teléfono</th>
                            <th></th>
                            <th></th>
                            </thead>                        
                            <%for (Cliente c : clientes) {%>

                            <c:url var="linkModificar" value="controladorClientes">
                                <c:param name="instruccion" value="modificarCliente"></c:param>
                                <c:param name="numCredencial" value="<%= c.getNumCredencial()%>"></c:param>
                            </c:url>
                            <c:url var="linkEliminar" value="controladorClientes">
                                <c:param name="instruccion" value="eliminarCliente"></c:param>
                                <c:param name="numCredencial" value="<%= c.getNumCredencial()%>"></c:param>
                            </c:url>
                            <tr>
                                <td><%= c.getNumCredencial()%></td>
                                <td><%= c.getNombre()%></td>
                                <td><%= c.getDireccion()%></td>
                                <td><%= c.getTelefono()%></td>
                                <td><a href="${linkModificar}">Modificar</a></td>
                                <td><a href="${linkEliminar}">Eliminar</a></td>                                
                            </tr>
                            <%}%>
                        </table>                                  
                    </div>                    
                </div>
            </div>
        </div>
    </body>
</html>

