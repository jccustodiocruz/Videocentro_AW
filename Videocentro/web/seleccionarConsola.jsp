<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccionar consola</title>
        <link rel="stylesheet" href="estilo/estilo.css"/>
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
                <header>Seleccionar consola</header>
                <div class="contenido">                    
                    <div>
                        <input type="submit" value="Buscar" onclick="window.location.href = 'controladorVideojuegos?instruccion=listarVideojuegosConsola.jsp'">
                    </div>
                    <div class="tabla">                        
                            <input type="text" list="videojuegos" name="consola" placeholder="Consola"> 
                            <datalist id="videojuegos">                           
                                <option value="Xbox"></option>
                                <option value="Playstation"></option>
                                <option value="Mobile"></option>
                                <option value="PC"></option>
                            </datalist>                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>