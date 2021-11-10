<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Clientes</title>
    </head>
    <body>
        <table class="table table-hover">
                <tr>
                    <th>SEGUNDO PARCIAL TEM-742 </th><br>
                    <th>NOMBRE: ERWIN ESPINOZA MAMANI </th><br>
                    <th>CARNET: 3528497 </th><br>
                </tr>
                </table>
        <div class="container">
         <table class="table table-hover"> 
            <h1>Seminarios</h1>
            
            <br/>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="seminarios" />
            </jsp:include>
            <br />
            <a href="SeminarioControlador?action=add" class="btn btn-primary btn-sm mt-10">+ Adicionar Seminarios</a>
            <br/>
            <br/>
            
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Expositor</th>
                    <th>Fecha</th>
                    <th>Horas</th>
                    <th>Cupos</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${seminarios}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.expositor}</td>
                        <td>${item.fecha}</td>
                        <td>${item.hora}</td>
                        <td>${item.cupo}</td>
                        <td><a href="SeminarioControlador?action=edit&id=${item.id}"><i class="fas fa-edit"></a></td>
                        <td><a href="SeminarioControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro'))"><i class="fas fa-trash-alt"></a></td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    </body>
</html>