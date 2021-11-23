package com.mycompany.persistencia;

import com.mycompany.model.Persona;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BaseDeDatos {
    private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public BaseDeDatos() {
    }

    public void cargarDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void conectar() {
        try {
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "juan", "7Sicut3Cervus1#2");
            System.out.println("Agenda conectada");
        } catch (SQLException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Persona> listar() {
        Persona persona;
        ArrayList<Persona> contactos = null;

        try {
            this.conectar();
            contactos = new ArrayList<>();
            String sql = "select * from personas";
            this.statement = connection.createStatement();
            ResultSet rows = this.statement.executeQuery(sql);

            while (rows.next()) {
                persona = new Persona(rows.getString("nombre"), Integer.parseInt(rows.getString("edad")), rows.getString("email"));
                contactos.add(persona);
            }
        } catch (SQLException sqlSyntaxErrorException) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, sqlSyntaxErrorException);
        } finally {
            this.desconectar();
        }
        return contactos;
    }

    private void desconectar() {
        try {
            this.connection.close();
            System.out.println("Desconetando BBDD");

        } catch (SQLException sqlException) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, sqlException);
        }
    }

    public void guardarContacto(Persona persona) throws SQLException {
        this.conectar();
        String sql = "insert into personas (nombre, edad, email) values ('" + persona.getNombre() + "'," + persona.getEdad() + ",'" + persona.getEmail() + "')";
        System.out.println(sql);
        this.statement = this.connection.createStatement();
        this.statement.execute(sql);
        this.desconectar();
        System.out.println("se agrego a " + persona);
    }

    public void eliminarContacto(String nombre) throws SQLException {
        this.conectar();
        String consulta = "delete from personas where nombre = '" + nombre + "'";
        this.statement = this.connection.createStatement();
        this.statement.execute(consulta);
        this.desconectar();
    }
}
