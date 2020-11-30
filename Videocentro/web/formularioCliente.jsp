<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <li><a href="principal.html">Home</a></li>
                    <li><a href="clientes.jsp">Clientes</a></li>
                    <li><a href="videojuegos.jsp">Videojuegos</a></li>
                    <li><a href="rentas.jsp">Rentas</a></li>
                    <li><a href="inventario.jsp">Inventario</a></li>
                </ul>
            </div>
            <div class="main">
                <header>Cliente</header>
                <div class="contenido">                    
                    <form method="get" action="controladorClientes">
                        <input type="hidden" name="instruccion" value="agregarCliente">
                        <input type="text" placeholder="Num. Credencial" name="numCredencial">
                        <input type="text" placeholder="Nombre" name="nombre">
                        <input type="text" placeholder="Dirección" name="direccion">
                        <input type="text" placeholder="Teléfono" name="telefono">
                        <div>
                            <input type="submit" value="Guardar">
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
</html>