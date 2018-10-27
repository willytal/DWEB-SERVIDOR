/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

public class Conexion {

    //********************* Atributos *************************
    private java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private java.sql.ResultSet cursor;
    //(Cursor) En él están almacenados los datos.
    private String bbdd;
    private String usuario;
    private String clave;

    //********************** Constructores **************************
    //----------------------------------------------------------
    public Conexion() throws ClassNotFoundException,
            InstantiationException, IllegalAccessException, SQLException {
        //Cargar el driver/controlador
        String controlador = "com.mysql.jdbc.Driver";
        //String controlador = "oracle.jdbc.driver.OracleDriver";
        //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver";
        Class.forName(controlador).newInstance();

        Conectar("ejemplo");
    }

    public Conexion(String b, String u, String c) throws ClassNotFoundException,
            InstantiationException, IllegalAccessException, SQLException {
        //Cargar el driver/controlador
        String controlador = "com.mysql.jdbc.Driver";
        //String controlador = "oracle.jdbc.driver.OracleDriver";
        //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver";
        Class.forName(controlador).newInstance();
        bbdd = b;
        usuario = u;
        clave = c;
        Conectar(bbdd);
    }

    //********************** Métodos **************************
    //----------------------------------------------------------
    private void Conectar(String nombre_bbdd) throws SQLException {
        String URL_BD = "jdbc:mysql://localhost/" + nombre_bbdd;
        //String URL_BD = "jdbc:oracle:oci:@REPASO";
        //String URL_BD = "jdbc:oracle:oci:@REPASO";
        //String URL_BD = "jdbc:odbc:REPASO";

        //Realizamos la conexión a una BD con un usuario y una clave.
        try {
            Conex = java.sql.DriverManager.getConnection(URL_BD, usuario, clave);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }

    }

    /**
     * Metodo que devuelve un usuario en caso de existir en la base de datos, o
     * null si no existe ese usuario.
     *
     * @param correo Se le pasa el correo de la caja del login
     * @param pass Se le pasa la contraseña de la caja del login
     * @return
     * @throws SQLException
     */
    public Usuario recuperarUsuario(String correo, String pass) throws SQLException {
        Usuario user = new Usuario();
        String sentencia = "SELECT * FROM USUARIO WHERE EMAIL='" + correo + "' AND PASSWORD='" + pass + "'";
        cursor = Sentencia_SQL.executeQuery(sentencia);
        if (cursor.next()) {
            user.setEmail(cursor.getString("email"));
            user.setId_user(Integer.parseInt(cursor.getString("id_user")));
            user.setId_depart(Integer.parseInt(cursor.getString("id_dep")));
            user.setNombre(cursor.getString("nombre"));
            user.setPassword(cursor.getString("password"));
        } else {
            user = null;
        }

        return user;
    }

    /**
     * Metodo que devuelve una lista enlazada con los roles (descripcion) de
     * cada usuario.
     *
     * @param id_u Se le pasa el id del usuario
     * @return Devuelve una lista enlazada con los roles.
     * @throws SQLException
     */
    public LinkedList obtenerRol(int id_u) throws SQLException {
        LinkedList rol = new LinkedList();
        String sentencia = "SELECT descripcion from ROL join ROL_ASIGNADO on ROL.id_rol=ROL_ASIGNADO.id_rol where id_user=" + id_u + "";
        cursor = Sentencia_SQL.executeQuery(sentencia);

        while (cursor.next()) {
            rol.add(cursor.getString("descripcion"));
        }
        return rol;
    }

    /**
     * Obtiene todas las aulas
     *
     * @return Devuelve una lista enlazada con todas las aulas
     * @throws SQLException
     */
    public LinkedList obtenerAulas() throws SQLException {
        LinkedList aulas = new LinkedList();
        String sentencia = "SELECT ID_AULA FROM AULA";
        cursor = Sentencia_SQL.executeQuery(sentencia);

        while (cursor.next()) {
            aulas.add(cursor.getString("id_aula"));
        }

        return aulas;
    }

    /**
     * Metodo que devuelve las aulas asignadas del usuario
     *
     * @param id_user Se le pasa el ID del Usuario
     * @return Devuelve las aulas que tenga asignadas ese usuario
     * @throws SQLException
     */
    public LinkedList obtenerAulasDepartamento(int id_user) throws SQLException {
        LinkedList aulas = new LinkedList();
        String sentencia = "SELECT ID_AULA FROM AULA JOIN USUARIO ON USUARIO.id_dep=AULA.id_dep WHERE id_user=" + id_user;
        cursor = Sentencia_SQL.executeQuery(sentencia);

        while (cursor.next()) {
            aulas.add(cursor.getString("id_aula"));
        }

        return aulas;
    }

    /**
     * Devuelve el aula asignada al profesor que le pasamos por 
     * parametro. (id_user)
     * @param id_user Se le pasa el id_user del usuario (profesor).
     * @return Devuelve un entero con el numero de aula asignada.
     * @throws SQLException 
     */
    public int obtenerAulaAsignada(int id_user) throws SQLException {
        int aula = 0;

        String sentencia = "SELECT id_aula FROM `AULA_ASIGNADA` WHERE id_user=" + id_user;
        cursor = Sentencia_SQL.executeQuery(sentencia);

        while (cursor.next()) {            
            aula = Integer.parseInt(cursor.getString("id_aula"));
        }
        return aula;
    }

    /**
     * Metodo que devuelve un ArrayList con los items del aula que se le pasa.
     *
     * @param id_aula Se le pasa el id del aula de la que queremos recuperar los
     * items
     * @return Devuelve un ArrayList con items
     * @throws SQLException
     */
    public ArrayList obtenerItemsAula(int id_aula) throws SQLException {
        ArrayList items = new ArrayList();
        String sentencia = "SELECT * FROM `INVENTARIO` WHERE id_aula=" + id_aula + ";";
        cursor = Sentencia_SQL.executeQuery(sentencia);

        while (cursor.next()) {
            Item it = new Item();
            it.setId_aula(Integer.parseInt(cursor.getString("id_aula")));
            it.setId_item(Integer.parseInt(cursor.getString("id_item")));
            it.setUds(Integer.parseInt(cursor.getString("uds")));
            it.setDescripcion(cursor.getString("descripcion"));
            it.setMarca(cursor.getString("marca"));
            it.setModelo(cursor.getString("modelo"));

            items.add(it);
        }

        return items;
    }

    /**
     * Devuelve true si el elemento que le pasamos se elimina
     *
     * @param id_item
     * @return
     * @throws java.sql.SQLException
     */
    public boolean borrarItem(int id_item) throws SQLException {
        boolean borrado = false;
        String sentencia = "DELETE from INVENTARIO WHERE id_item=" + id_item;
        Sentencia_SQL.executeUpdate(sentencia);

        return borrado;
    }
    
    public void actualizarItem(int uds, String desc, String marca, String modelo, int id_item) throws SQLException{
        String sentencia = "UPDATE INVENTARIO SET UDS='" + uds + "', DESCRIPCION='" + desc + "', MARCA='" + marca + "', MODELO='" + modelo + "' WHERE ID_ITEM=" + id_item + ";";
        Sentencia_SQL.executeUpdate(sentencia);
    }
    
    public void addItem(int id_aula, int uds, String desc, String marca, String modelo) throws SQLException{
        String sentencia = "INSERT INTO INVENTARIO (id_item, id_aula, uds, descripcion, marca, modelo) VALUES (NULL, '" + id_aula + "', '" + uds + "', '" + desc + "', '" + marca + "', '" + modelo + "');"; 
        Sentencia_SQL.executeUpdate(sentencia);
    }
}
