<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
        <link rel="stylesheet" href="estilo/estilo.css"/>
    </head>
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
                <header>Inventario</header>
                <div class="contenido">
                    <div class="tabla">
                        <table>
                            <thead>
                            <th>Num Catálogo</th>
                            <th>Título</th>
                            <th>Ejemplares</th>
                            <th>Disponibles</th>
                            </thead>                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
