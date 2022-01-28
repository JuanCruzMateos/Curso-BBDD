package com.contacts.app;

import java.sql.SQLException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws SQLException {
        Contact contact = new Contact("Carolina", 29, "caro@gmail.com");
        contact.setAge(15);

        DataBase dataBase = new DataBase();
        dataBase.printAll("personas");
    }
}
