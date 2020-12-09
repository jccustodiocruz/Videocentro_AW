<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
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
                <header>Cliente</header>
                <div class="contenido">                    
                    <form method="get" action="controladorClientes">
                        <input type="hidden" name="instruccion" value="agregarCliente">
                        <input type="text" placeholder="Num. Credencial" name="numCredencial" autocomplete="off">
                        <input type="text" placeholder="Nombre" name="nombre" autocomplete="off">
                        <input type="text" placeholder="Dirección" name="direccion" autocomplete="off">
                        <input type="text" placeholder="Teléfono" name="telefono" autocomplete="off">
                        <div>
                            <input type="submit" value="Guardar">
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
</html>
