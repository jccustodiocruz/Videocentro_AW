<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videojuego</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
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
                <header>Videojuego</header>
                <div class="contenido">
                    <form>
                        <input type="text" placeholder="Num. Catálogo" name="numCatalogo">
                        <input type="text" placeholder="Título" name="titulo">
                        <input type="text" placeholder="Género" name="genero">
                        <input type="text" placeholder="Clasificación" name="clasificacion">
                        <input type="text" placeholder="Consola" name="consola">
                        <input type="text" placeholder="Fabricante" name="fabricante">
                        <input type="text" placeholder="Versión" name="version">
                        <div>
                            <input type="submit" value="Guardar">
                        </div>
                        </form>        
                </div>
            </div>
        </div>
    </body>
</html>


