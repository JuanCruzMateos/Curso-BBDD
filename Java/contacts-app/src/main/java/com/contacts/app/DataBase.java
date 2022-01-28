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
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost/prueba", this.properties.getProperty("user"), this.properties.getProperty("password"));
        } catch (SQLException e) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "Fail to connect to the data base", e);
        }
    }

    private void disconnect() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, "Unable to disconnect db", e);
        }
    }

    public void printAll(String table) throws SQLException {
        this.connect();
        String query = "SELECT * FROM " + table;
        this.statement = this.connection.createStatement();
        this.resultSet = this.statement.executeQuery(query);

        while (this.resultSet.next()) {
            System.out.println(this.resultSet.getString("nombre"));
            System.out.println(this.resultSet.getString("edad"));
            System.out.println(this.resultSet.getString("email"));
        }
        this.disconnect();
    }
}
