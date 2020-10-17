package Paq;

import Auxiliar.Constantes;
import java.sql.Date;
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
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

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

    public static String prueba() {
        String dni = null;
        try {
            String sentencia = "SELECT * FROM asig_rol WHERE DNI='06280822M'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next()) //Si devuelve true es que existe.
            {
                dni = Conj_Registros.getString("DNI");

            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }

        return dni;
    }

    public static int ObtenerRol(String DNI) {
        int rol = 0;
        try {
            String sentencia = "SELECT * FROM " + Constantes.rol + " WHERE DNI = '" + DNI + "'";

            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);

            if (ConexionEstatica.Conj_Registros.next()) //Si devuelve true es que existe.
            {

                rol = ConexionEstatica.Conj_Registros.getInt("ID_R");
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return rol;
    }

    public static Usuario Login(String correo, String pass) {
        Usuario u = null;
        try {
            String sentencia = "SELECT * FROM " + Constantes.usuarios + " WHERE Email = '" + correo + "' AND Pass= '" + pass + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.getString("DNI") != null) //Si devuelve true es que existe.
            {
                String DNI = Conj_Registros.getString("DNI");
                String email = Conj_Registros.getString("Email");

                String sexo = Conj_Registros.getString("Sexo");
                Date fecha_nacimiento = Conj_Registros.getDate("FechaNac");
                u = new Usuario();

                System.out.println("Consulta de Login Correcta"); //BITACORA

            } else {
                System.out.println("falla algo");
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return u;
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
