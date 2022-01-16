package sistema.persistencia;

import java.io.*;

public class PersistenciaBIN implements IPersistencia<Serializable> {
    private FileInputStream fileInputStream;
    private FileOutputStream fileOutputStream;
    private ObjectInputStream objectInputStream;
    private ObjectOutputStream objectOutputStream;

    @Override
    public void openInput(String fileName) throws Exception {
        this.fileInputStream = new FileInputStream(fileName);
        this.objectInputStream = new ObjectInputStream(this.fileInputStream);
    }

    @Override
    public void closeInput() throws Exception {
        if (this.objectInputStream != null)
            this.objectInputStream.close();
    }

    @Override
    public void openOutput(String fileName) throws Exception {
        this.fileOutputStream = new FileOutputStream(fileName);
        this.objectOutputStream = new ObjectOutputStream(this.fileOutputStream);
    }

    @Override
    public void closeOutput() throws Exception {
        if (this.objectOutputStream != null)
            this.objectOutputStream.close();
    }

    @Override
    public void write(Serializable obj) throws Exception {
        if (this.objectOutputStream != null)
            this.objectOutputStream.writeObject(obj);
    }

    @Override
    public Serializable read() throws Exception {
        Serializable serializable = null;

        if (this.objectInputStream != null)
            serializable = (Serializable) this.objectInputStream.readObject();
        return serializable;
    }
}
