package sistema.persistencia.basededatos;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase encargada de gestionar la coneccion con la bbdd.<br>
 */
public class BaseDeDatos {
    private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public void loadDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void connect() {
        try {
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "7SoloDios3asta1#2");
            System.out.println("Succesful conection to db...");
        } catch (SQLException sqlException) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, sqlException);
        }
    }

    public void disconnect() {
        try {
            this.connection.close();
            System.out.println("Db disconnected...");
        } catch (SQLException sqlException) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, sqlException);
        }
    }

    public void init() {

    }



}
