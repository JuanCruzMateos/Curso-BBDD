package com.contacts.app;

import java.sql.SQLException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws SQLException {
        final String TABLE_NAME = "personas";
        Contact caro = new Contact("Carolina", 29, "caro@gmail.com");
        Contact juan = new Contact("Juan Cruz", 27, "juanczmt@gmail.com");

        DataBase dataBase = new DataBase();
        dataBase.printAllContacts(TABLE_NAME);
        Contact c = dataBase.findByEmail(TABLE_NAME, juan.getEmail());
        System.out.println(c);
        if (c != null) {
            dataBase.deleteContact(TABLE_NAME, c);
        } else {
            dataBase.saveContact(TABLE_NAME, juan);
        }
        System.out.println("-----");
        dataBase.printAllContacts(TABLE_NAME);

        System.out.println("-----");
        dataBase.updateEmail(TABLE_NAME, juan, "juan@gmail.com");
        dataBase.printAllContacts(TABLE_NAME);
    }
}
