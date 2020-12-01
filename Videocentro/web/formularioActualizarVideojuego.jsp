<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Videojuego</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
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
                <header>Actualizar Videojuego</header>
                <div class="contenido">                    
                    <form method="get" action="controladorVideojuegos">
                        <input type="hidden" name="instruccion" value="actualizarVideojuego">
                        <input type="hidden" name="numCatalogo" value="${videojuego.numCatalogo}">
                        <input type="text" placeholder="Título" name="titulo" autocomplete="off" value="${videojuego.titulo}">
                        <input type="text" placeholder="Género" name="genero" autocomplete="off" value="${videojuego.genero}">
                        <input type="text" placeholder="Clasificación" name="clasificacion" autocomplete="off" value="${videojuego.clasificacion}">
                        <input type="text" placeholder="Consola" name="consola" autocomplete="off" value="${videojuego.consola}">
                        <input type="text" placeholder="Fabricante" name="fabricante" autocomplete="off" value="${videojuego.fabricante}">
                        <input type="text" placeholder="Versión" name="version" autocomplete="off" value="${videojuego.version}">
                        <div>
                            <input type="submit" value="Actualizar">
                        </div>
                        </form>                        
                </div>
            </div>
        </div>
    </body>
</html>

