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
                    <li><a href="controladorClientes?instruccion=listarClientes">Clientes</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarVideojuegos">Videojuegos</a></li>
                    <li><a href="controladorRentas?instruccion=listarRentas">Rentas</a></li>
                    <li><a href="controladorVideojuegos?instruccion=listarInventario">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Videojuego</header>
                <div class="contenido">
                    <form method="get" action="controladorVideojuegos">
                        <input type="hidden" name="instruccion" value="agregarVideojuego">
                        <input type="text" placeholder="Num. Catálogo" name="numCatalogo" autocomplete="off">
                        <input type="text" placeholder="Título" name="titulo" autocomplete="off">
                        <input type="text" placeholder="Género" name="genero" autocomplete="off">
                        
                        <input type="text" list="clasificaciones" name="clasificacion" placeholder="Clasificacion"> 
                        <datalist id="clasificaciones">                           
                            <option value="EC"></option>
                            <option value="E"></option>
                            <option value="E 10+"></option>
                            <option value="T"></option>
                            <option value="M"></option>
                            <option value="AO"></option>
                        </datalist>                                                                                              
                        
                        <input type="text" list="videojuegos" name="consola" placeholder="Consola"> 
                        <datalist id="videojuegos">                           
                            <option value="Xbox"></option>
                            <option value="Playstation"></option>
                            <option value="Mobile"></option>
                            <option value="PC"></option>
                        </datalist>
                        
                        <input type="text" placeholder="Fabricante" name="fabricante" autocomplete="off">
                        <input type="text" placeholder="Versión" name="version" autocomplete="off">
                        <div>
                            <input type="submit" value="Guardar">
                        </div>
                        </form>        
                </div>
            </div>
        </div>
    </body>
</html>


