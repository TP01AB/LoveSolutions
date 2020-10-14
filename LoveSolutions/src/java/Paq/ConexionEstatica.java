package Paq;

import Auxiliar.Constantes;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author isra9
 */
public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            String controlador = "com.mysql.jdbc.Driver";
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");

        } catch (Exception e) {

            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static int Login(String correo, String pass) {
        int existe = -1;
        try {
            String sentencia = "SELECT * FROM personas WHERE correo = '" + correo + "' AND pass='" + pass + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {

                existe = ConexionEstatica.Conj_Registros.getInt("rol");

            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;
    }

    public static void Insertar_Persona(String correo, String nombre, String pass, int rol, int edad, String sexo, int partidasJugadas, int partidasGanadas) {
        try {
            // INSERT INTO `personas` (`correo`, `nombre`, `pass`, `rol`, `edad`, `sexo`, `partidasJugadas`, `partidasGanadas`) VALUES ('isra9movil@hotmail.com', 'israel', 'israel', '1', '28', 'Hombre', '10', '9');

            String sentencia = "INSERT INTO " + Constantes.usuarios + " VALUES ('" + correo + "', '" + nombre + "', '" + pass + "', '" + rol + "', '" + edad + "', '" + sexo + "'," + partidasJugadas + "," + partidasGanadas + ")";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            System.out.println("Insertado correctamente");
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }

    }
    //----------------------------------------------------------

    public void Modificar_Dato(String tabla, String DNI, String Nuevo_Nombre) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET Nombre = '" + Nuevo_Nombre + "' WHERE DNI = '" + DNI + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public void Insertar_Dato(String tabla, String DNI, String Nombre, int Tfno) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + DNI + "'," + "'" + Nombre + "','" + Tfno + "')";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public void Borrar_Dato(String tabla, String DNI) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE DNI = '" + DNI + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

}
