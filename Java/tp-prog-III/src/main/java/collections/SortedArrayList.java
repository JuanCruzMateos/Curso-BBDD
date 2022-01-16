package collections;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Clase que especializa ArrayList en un arreglo cuyas inserciones son ordenadas.<br>
 */
public class SortedArrayList<E extends Comparable<E>> extends ArrayList<E> implements Serializable {
    private final ArrayList<E> arr = new ArrayList<>();

    public SortedArrayList() {

    }

    /**
     * Insercion ordenada en el ArrayList.<br>
     */
    @Override
    public boolean add(E e) {
        int i = 0;

        if (this.arr.isEmpty()) {
            return this.arr.add(e);
        } else {
            while (i < this.arr.size() && this.arr.get(i).compareTo(e) < 0) {
                i += 1;
            }
            if (i == this.arr.size())
                return this.arr.add(e);
            else {
                try {
                    this.arr.add(i, e);
                    return true;
                } catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                    return false;
                }
            }
        }
    }

    @Override
    public Iterator<E> iterator() {
        return this.arr.iterator();
    }
}
