package graph;
import java.util.Comparator;
import java.util.Objects;

/**
 * @param <V> Vertex value type
 * @param <E> Edge value type
 * @author DEI-ESINF
 */
public class Edge<V, E>
{
    final private V vOrig;        // vertex origin
    final private V vDest;        // vertex destination
    private E weight;        // Edge weight


    public Edge(V vOrig, V vDest, E weight) {
        if ((vOrig == null) || (vDest == null)) throw new RuntimeException("Edge vertices cannot be null!");
        this.vOrig = vOrig;
        this.vDest = vDest;
        this.weight = weight;
    }

    public V getVOrig() {
        return vOrig;
    }

    public V getVDest() {
        return vDest;
    }

    public E getWeight() {
        return weight;
    }

    public void setWeight(E weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return String.format("%s -> %s Weight: %s\n", vOrig, vDest, weight);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        @SuppressWarnings("unchecked") Edge<V, E> edge = (Edge<V, E>) o;
        return vOrig.equals(edge.vOrig) &&
                vDest.equals(edge.vDest);
    }

    @Override
    public int hashCode() {
        return Objects.hash(vOrig, vDest);
    }

    public static class weightComparator<E extends Comparable<E>> implements Comparator<Edge<?, E>> {
        @Override
        public int compare(Edge<?, E> otherEdge1, Edge<?, E> otherEdge2) {
            return otherEdge1.getWeight().compareTo(otherEdge2.getWeight());
        }
    }
}
