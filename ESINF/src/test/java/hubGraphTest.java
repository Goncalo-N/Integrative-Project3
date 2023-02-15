import utils.Graph;
import graph.MatrixGraph;
import model.Company;
import model.Hub;
import model.Particular;
import model.Producer;
import org.junit.Test;
import utils.hubGraph;

import static org.junit.Assert.assertEquals;

/**
 * Classe para realizar testes à classe hubGraph.
 */
public class hubGraphTest {

    /**
     * Método para verificar se os dados de um dado ficheiro
     * cliente-produtores foram adicionados aos vértices do grafo.
     */
    @Test
    public void fileToVertexTest1() {
        String filePathTest = "grafos/Small/clientes-produtores_test1.csv";

        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToVertex(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);
        expectedResult.addVertex(new Particular("CT1", 40.6389, -8.6553, "C1"));
        expectedResult.addVertex(new Particular("CT2", 38.0333, -7.8833, "C2"));
        expectedResult.addVertex(new Particular("CT3", 41.5333, -8.4167, "C3"));

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);

    }

    /**
     * Método para verificar se os dados duplicados de um dado ficheiro
     * cliente-produtores foram adicionados aos vértices do grafo.
     */
    @Test
    public void fileToVertexTest2() {
        String filePathTest = "grafos/Small/clientes-produtores_test2.csv";
        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToVertex(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);
        expectedResult.addVertex(new Particular("CT1", 40.6389, -8.6553, "C1"));
        expectedResult.addVertex(new Particular("CT2", 38.0333, -7.8833, "C2"));
        expectedResult.addVertex(new Particular("CT3", 41.5333, -8.4167, "C3"));
        expectedResult.addVertex(new Company("CT14", 38.5243, -8.8926, "E1"));
        expectedResult.addVertex(new Company("CT11", 39.3167, -7.4167, "E2"));
        expectedResult.addVertex(new Company("CT5", 39.823, -7.4931, "E3"));
        expectedResult.addVertex(new Producer("CT17", 40.6667, -7.9167, "P1"));
        expectedResult.addVertex(new Producer("CT6", 40.2111, -8.4291, "P2"));
        expectedResult.addVertex(new Producer("CT10", 39.7444, -8.8072, "P3"));

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método readFileToVertex para verificar se dado um ficheiro
     * cliente-produtores vazio, os vértices de um determinado grafo continuam vazios.
     */
    @Test
    public void fileToVertexTestEmpty() {
        String filePathTest = "grafos/Small/clientes-produtores_test3.csv";

        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToVertex(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método readFileToEdge para verificar se os dados de um ficheiro
     * de distâncias foram adicionados corretamente às arestas de um determinado grafo.
     */
    @Test
    public void fileToEdgeTest1() {
        String filePathTest = "grafos/Small/distancias_test1.csv";

        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToEdge(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 62448);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 66584);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 100848);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT5"), 115041);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT3"), 50467);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT1"), 61877);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT10"), 70717);
        expectedResult.addEdge(new Hub("CT11"), new Hub("CT5"), 61655);
        expectedResult.addEdge(new Hub("CT14"), new Hub("CT1"), 111584);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método readFileToEdge para verificar se os dados duplicados de um dado ficheiro
     * de distâncias foram adicionados corretamente às arestas de um determinado grafo.
     */
    @Test
    public void fileToEdgeTest2() {
        String filePathTest = "grafos/Small/distancias_test2.csv";

        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToEdge(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 12345);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 54321);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 110848);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método readFileToEdge para verificar se dado um ficheiro de
     * distâncias vazio, as arestas de um determinado grafo continuam iguais.
     */
    @Test
    public void fileToEdgeTestEmpty() {
        String filePathTest = "grafos/Small/distancias_test3.csv";

        Graph<Hub, Integer> result = new MatrixGraph<>(true);
        hubGraph.readFileToEdge(result, filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(true);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }
}
