package com.contacts.app;

import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataBase {
    private final Properties properties;
    private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public DataBase() {
        this.properties = new Properties();
        this.properties.setProperty("user", "juan");
        this.properties.setProperty("password", "7Sicut3Cervus1#2");
        this.loadDriver();
    }

    private void loadDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException classNotFoundException) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "JDBC Driver not found", classNotFoundException);
        }
    }

    private void connect() {
        try {
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost/prueba", this.properties);
        } catch (SQLException e) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "Fail to connect to the data base", e);
        }
    }

    private void disconnect() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "Unable to disconnect from db", e);
        }
    }

    public boolean tableExists(String tableName) {
        boolean exists = false;
        try {
            this.connect();
            DatabaseMetaData md = this.connection.getMetaData();
            this.resultSet = md.getTables(null, null, tableName, null);
            if (this.resultSet.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "", e);
        }
        return exists;
    }

    public void printAllContacts(String table) throws SQLException {
        this.connect();
        String query = "SELECT * FROM " + table;
        this.statement = this.connection.createStatement();
        this.resultSet = this.statement.executeQuery(query);

        while (this.resultSet.next()) {
            String nombre = this.resultSet.getString("nombre");
            int edad = this.resultSet.getInt("edad");
            String email = this.resultSet.getString("email");
            System.out.println("name:" + nombre + ", edad=" + edad + ", email=" + email);
        }
        this.disconnect();
    }

    public void saveContact(String tableName, Contact contact) throws SQLException {
        String sql = "INSERT INTO " + tableName + " (nombre, edad, email) VALUES ('" + contact.getName() + "', " + contact.getAge() + ", '" + contact.getEmail() + "')";

        this.connect();
        this.statement = this.connection.createStatement();
        this.statement.execute(sql);
        this.disconnect();
    }

    public void deleteContact(String tableName, Contact contact) throws SQLException {
        String sql = "DELETE FROM " + tableName + " WHERE email = ?";

        this.connect();
        this.preparedStatement = this.connection.prepareStatement(sql);
        this.preparedStatement.setString(1, contact.getEmail());
        this.preparedStatement.executeUpdate();
        this.disconnect();
    }

    public Contact findByEmail(String table, String email) throws SQLException {
        Contact contact = null;
        String query = "SELECT nombre, edad, email FROM " + table + " WHERE email = ?";

        this.connect();
        this.preparedStatement = this.connection.prepareStatement(query);
        this.preparedStatement.setString(1, email);
        this.resultSet = this.preparedStatement.executeQuery();
        if (this.resultSet.next()) {
            String nombre = this.resultSet.getString("nombre");
            int edad = this.resultSet.getInt("edad");
            String mail = this.resultSet.getString("email");
            contact = new Contact(nombre, edad, mail);
        }
        this.disconnect();
        return contact;
    }
}
