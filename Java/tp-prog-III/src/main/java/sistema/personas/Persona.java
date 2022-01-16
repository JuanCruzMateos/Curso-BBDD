package sistema.personas;

import java.io.Serializable;

/**
 * Clase que modela a una persona con su informacion de contacto basica.<br>
 */
public abstract class Persona implements Serializable {
    protected String nombre;
    protected String apellido;
    protected String direccion;
    protected String ciudad;
    protected Long telefono;
    protected int dni;

    /**
     * Para persistencia XML
     */
    public Persona() {

    }

    /**
     * Constructor. <br>
     * <b>Pre: </b> nombre, apellido, direccion distintos de null; telenofo y dni enteros positivos.<br>
     *
     * @param nombre    Nombre de la persona. Debe ser distinto de null.<br>
     * @param apellido  Apellido de la persona. Debe ser distinto de null.<br>
     * @param direccion Direccion de la persona. Debe ser distinto de null.<br>
     * @param telefono  Telefono de contacto de la persona. Numero entero positivo.<br>
     * @param dni       DNI de la persona. Numero entero positivo.<br>
     */
    public Persona(String nombre, String apellido, String direccion, Long telefono, int dni) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telefono = telefono;
        this.dni = dni;
    }

    /**
     * Constructor. <br>
     * <b>Pre: </b> nombre, apellido, direccion, ciudad distintos de null; telenofo y dni enteros positivos.<br>
     *
     * @param nombre    Nombre de la persona. Debe ser distinto de null.<br>
     * @param apellido  Apellido de la persona. Debe ser distinto de null.<br>
     * @param direccion Direccion de la persona. Debe ser distinto de null.<br>
     * @param ciudad    Ciudad de residencia de la persona. Debe ser distinto de null.<br>
     * @param telefono  Telefono de contacto de la persona. Numero entero positivo.<br>
     * @param dni       DNI de la persona. Numero entero positivo.<br>
     */
    public Persona(String nombre, String apellido, String direccion, String ciudad, Long telefono, int dni) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.telefono = telefono;
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Long getTelefono() {
        return telefono;
    }

    public void setTelefono(Long telefono) {
        this.telefono = telefono;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    @Override
    public String toString() {
        return "[nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", direccion='" + direccion + '\'' +
                ", ciudad='" + ciudad + '\'' +
                ", telefono=" + telefono +
                ", dni=" + dni + ']';
    }
}
