<%-- 
    Document   : controlador
    Created on : 19-oct-2018, 13:51:19
    Author     : willy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Item"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);

            //*********************** MOSTRAR ******************************
            if (request.getParameter("enviardatos").equals("Mostrar")) {
                if (!request.getParameter("aulalista").equals("Selecciona el Aula")) { //Si hay un aula seleccionada
                    int aula = Integer.parseInt(request.getParameter("aulalista")); //Se recupera el valor de la lista en "aula"
                    ArrayList items = co.obtenerItemsAula(Integer.parseInt(request.getParameter("aulalista"))); //Se obtienen los items de ese aula en el arralist "items"
                    session.setAttribute("items", items); //Se mete en la sesion 
                    session.setAttribute("aula", aula);
                    response.sendRedirect("../roles/director.jsp");
                } else {
                    response.sendRedirect("../roles/director.jsp");
                }
            }

            //*********************** BORRAR *******************************
            if (request.getParameter("enviardatos").equals("Borrar")) {
                ArrayList items = (ArrayList) session.getAttribute("items");
                Item it = new Item();

                for (Object item : items) {
                    it = (Item) item;
                    if (it.getId_item() == Integer.parseInt(request.getParameter("cajaitem"))) {
                        co.borrarItem(it.getId_item());
                    }
                }

                items.remove(it);
                session.removeAttribute("item");
                response.sendRedirect("../roles/director.jsp");
            }

            //*********************** EDITAR ******************************* 
            if (request.getParameter("enviardatos").equals("Editar")) {
                ArrayList items = (ArrayList) session.getAttribute("items"); //Recupero la arraylist de la sesi

                for (Object item : items) {
                    Item it = (Item) item;
                    if (it.getId_item() == Integer.parseInt(request.getParameter("cajaitem"))) {
                        it.setDescripcion(request.getParameter("cajadesc"));
                        it.setUds(Integer.parseInt(request.getParameter("cajaunds")));
                        it.setMarca(request.getParameter("cajamarca"));
                        it.setModelo(request.getParameter("cajamod"));
                        co.actualizarItem(it.getUds(), it.getDescripcion(), it.getMarca(), it.getModelo(), it.getId_item());
                    }
                    item = it;
                }

                session.setAttribute("items", items);

                response.sendRedirect("../roles/director.jsp");
            }

            //********************* AÑADIR ITEM ****************************
            if (request.getParameter("enviardatos").equals("Introducir Item")) {

                int id_aula = Integer.parseInt(session.getAttribute("aula").toString());
                int uds = Integer.parseInt(request.getParameter("caja_uds"));
                String desc = request.getParameter("caja_desc");
                String marca = request.getParameter("caja_marca");
                String modelo = request.getParameter("caja_mod");

                co.addItem(id_aula, uds, desc, marca, modelo); //El ID Item se genera automaticamente

                response.sendRedirect("../anadiritem.jsp");
            }

            //******************** ASIGNAR AULA ****************************
            if (request.getParameter("enviardatos").equals("Asignar")) {

                co.asignarAula(Integer.parseInt(request.getParameter("aulalista")), Integer.parseInt(request.getParameter("listaprofes")));

                response.sendRedirect("../aulas.jsp");
            }

            //******************* QUITAR AULA ASIGNADA *********************
            if (request.getParameter("enviardatos").equals("Quitar")) {
                //Crear metodo que elimine el campo de la tabla aula_asignada
            }

            //******************** AÑADIR USUARIO **************************
            if (request.getParameter("enviardatos").equals("Registrar Usuario")) {

                //Falta controlar cajas en blanco
                co.addUsuario(request.getParameter("cajanombre"), request.getParameter("cajaemail"), request.getParameter("cajapass"), Integer.parseInt(request.getParameter("cajaid")));

                response.sendRedirect("../adduser.jsp");
            }

            //******************* ELIMINAR USUARIO ************************
            if (request.getParameter("enviardatos").equals("Eliminar Usuario")) {
                co.eliminarUsuario(request.getParameter("selectuser"));

                response.sendRedirect("../adduser.jsp");
            }
            
            //******************** CERRAR SESION ***************************
            if (request.getParameter("enviardatos").equals("Cerrar Sesion")) {
                session.removeAttribute("usuario");
                session.removeAttribute("items");
                session.removeAttribute("item");
                session.removeAttribute("rolelegido");
                response.sendRedirect("../index.jsp");
            }
        %>
    </body>
</html>
