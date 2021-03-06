<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cliente</title>
        <link rel="stylesheet" href="estilo/estilo.css" >
    </head>
    <body>     
        <div class="contenedor">
            <div class="menu">
                <h2>MENU</h2>
                <ul>
                    <li><a href="principal.html">Inicio</a></li>
                    <li><a href="controladorClientes?instruccion=listarClientes">Clientes</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarVideojuegos">Videojuegos</a></li>
                    <li><a href="controladorRentas?instruccion=listarRentas">Rentas</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarInventario">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Actualizar Cliente</header>
                <div class="contenido">                    
                    <form method="get" action="controladorClientes">
                        <input type="hidden" name="instruccion" value="actualizarCliente"> 
                        <input type="hidden" name="numCredencial" value="${cliente.numCredencial}">
                        <input type="text" name="nombre" autocomplete="off" value="${cliente.nombre}">
                        <input type="text" name="direccion" autocomplete="off" value="${cliente.direccion}">
                        <input type="text" name="telefono" autocomplete="off" value="${cliente.telefono}">
                        <div>
                            <input type="submit" value="Actualizar">
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
</html>

