<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccionar genero</title>
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
                    <script>
                        function makeURL(){
                            var valor = document.getElementById("valor").value;
                            var string = "controladorVideojuegos?instruccion=listarVideojuegosGenero&genero=";
                            var url = string + valor;
                            window.location.href = url;
                        }
                        
                        function getURL(){
                            document.getElementById("submit").addEventListener("click", makeURL());
                        }
                    </script>
                    <div>
                        <input type="submit" value="Buscar" id="submit" onclick="getURL()">
                    </div>
                    <div class="tabla">
                        <input type="text" list="generos" name="genero" id="valor" placeholder="Genero"> 
                        <datalist id="generos">                           
                            <option value="Aventura"></option>
                            <option value="Disparos"></option>
                            <option value="Educativos"></option>
                            <option value="Estrategia"></option>
                            <option value="Lucha"></option>
                            <option value="Horror"></option>
                            <option value="Plataformas"></option>
                            <option value="Rol"></option>
                            <option value="Musicales"></option>
                            <option value="Simulación"></option>
                            <option value="Deportivo"></option>
                            <option value="Carreras"></option>
                            <option value="MOBA"></option>
                        </datalist>                                         
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
