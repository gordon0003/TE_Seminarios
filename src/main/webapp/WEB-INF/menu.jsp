<%
    String opcion = request.getParameter("opcion");
%>            

            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("seminario") ? "active" : "" ) %>" href="SeminarioControlador">Mostrar lista de seminarios</a>

            </ul>