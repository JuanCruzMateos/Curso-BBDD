package com.contacts.app;

import java.sql.SQLException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws SQLException {
        final String TABLE_NAME = "personas";
        Contact contact = new Contact("Carolina", 19, "caro@gmail.com");
        contact.setAge(29);

        DataBase dataBase = new DataBase();
        dataBase.printAllContacts(TABLE_NAME);
        Contact c = dataBase.findByEmail(TABLE_NAME, "juanczmt@gmail.com");
        System.out.println(c);
        dataBase.deleteContact(TABLE_NAME, c);
        System.out.println("-----");
        dataBase.printAllContacts(TABLE_NAME);
    }
}
