<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desinventariar</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
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
                <header>Desinventariar</header>
                <div class="contenido">                    
                    <form method="get" action="controladorVideojuegos">
                        <input type="hidden" name="instruccion" value="desinventariar">
                        <input type="hidden" name="numCatalogo" value="${numCatalogo}">
                        <input type="text" placeholder="Cantidad" name="cantidad" autocomplete="off">                        
                        <div>
                            <input type="submit" value="Actualizar">
                        </div>
                        </form>              
                </div>
            </div>
        </div>
    </body>
</html>


