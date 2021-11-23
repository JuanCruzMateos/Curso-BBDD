package com.mycompany.app;

import com.mycompany.model.Persona;
import com.mycompany.persistencia.BaseDeDatos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class App {
    public static void main(String[] args) {
        ArrayList<Persona> personas;
        BaseDeDatos bd = new BaseDeDatos();

        bd.cargarDriver();
        personas = bd.listar();

        for (Persona persona : personas) {
            System.out.println(persona);
        }

        try {
            Persona persona = new Persona("Lourdes", 58, "mlourdes@gmail.com");
//            bd.guardarContacto(persona);
            bd.eliminarContacto("Lourdes");
        } catch (SQLException sqlException) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, sqlException);
        }
    }
}
