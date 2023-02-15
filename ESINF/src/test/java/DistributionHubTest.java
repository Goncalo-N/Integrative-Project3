
import TestHelper.TestMapsHelper;
import org.junit.*;
import utils.Exceptions.HubNotFoundException;
import utils.Exceptions.InvalidFileLineException;
import utils.Graph;
import graph.MatrixGraph;
import model.*;

import java.util.*;

import static org.junit.Assert.*;

import org.junit.rules.ExpectedException;
/**
 * Classe para realizar testes à classe DistributionHub.
 */
public class DistributionHubTest {
    private final static String FILE_PATH_DISTANCE = "grafos/Small/distancias_small.csv";
    private final static String FILE_PATH_PRODCOST_SMALL = "grafos/Small/clientes-produtores_small.csv";

    private final String FILE_PATH_PRODUCER_COSTUMER_SMALL = "grafos/Small/clientes-produtores_small.csv";
    private final String FILE_PATH_DISTANCES_SMALL = "grafos/Small/distancias_small.csv";
    private final String FILE_PATH_CABAZES_SMALL = "grafos/Small/cabazes_small.csv";

    private final String FILE_PATH_PRODUCER_COSTUMER_BIG = "grafos/big/clientes-produtores_big.csv";
    private final String FILE_PATH_DISTANCES_BIG = "grafos/big/distancias_big.csv";
    private final String FILE_PATH_CABAZES_BIG = "grafos/big/cabazes_big.csv";

    private DistributionHub distributionHub;
    /**
     * Representa o ficheiro com alguma informação de cabazes a ser lido.
     */
    final String SMALL_BASKET_FILE = "grafos/Small/cabazes_small_test.csv";

    /**
     * Representa o ficheiro 2 com alguma informação de cabazes a ser lido.
     */
    final String SMALL_BASKET_FILE_TWO = "grafos/Small/cabazes_small_test_two.csv";

    /**
     * Representa uma regra de exceção esperada pelo teste.
     */
    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();


    /**
     * Antes de fazer a análise dos testes, carrega os dados dos clientes-produtores e das distâncias.
     */
    @Before
    public void setUp() throws Exception {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
    }
    /**
     * Testa o método fileToVertex para verificar se os dados duplicados de um dado ficheiro cliente-produtores foram
     * adicionados corretamente aos vértices de um determinado grafo.
     */
    @Test
    public void fileToVertexTest1() {
        String filePathTest = "grafos/Small/clientes-produtores_test1.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToVertex(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        expectedResult.addVertex(new Particular("CT1", 40.6389, -8.6553, "C1"));
        expectedResult.addVertex(new Particular("CT2", 38.0333, -7.8833, "C2"));
        expectedResult.addVertex(new Particular("CT3", 41.5333, -8.4167, "C3"));

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }


    /**
     * Testa o método fileToVertex para verificar se os dados de um dado ficheiro cliente-produtores foram adicionados
     * corretamente aos vértices de um determinado grafo.
     */
    @Test
    public void fileToVertexTest2() {
        String filePathTest = "grafos/Small/clientes-produtores_test2.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToVertex(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
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
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }


    /**
     * Testa o método fileToVertex para verificar se dado um ficheiro cliente-produtores completamente vazio, os vértices
     * de um determinado grafo continuam iguais.
     */
    @Test
    public void fileToVertexTestEmpty() {
        String filePathTest = "grafos/Small/clientes-produtores_test3.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToVertex(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método fileToEdge para verificar se os dados de um dado ficheiro de distâncias foram adicionados corretamente
     * às arestas de um determinado grafo.
     */
    @Test
    public void fileToEdgeTest1() {
        String filePathTest = "grafos/Small/distancias_test1.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToEdge(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 63448);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 67584);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 110848);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT5"), 125041);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT3"), 50467);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT1"), 62877);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT10"), 0717);
        expectedResult.addEdge(new Hub("CT11"), new Hub("CT5"), 62655);
        expectedResult.addEdge(new Hub("CT14"), new Hub("CT1"), 121584);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método fileToEdge para verificar se os dados duplicados de um dado ficheiro de distâncias foram
     * adicionados corretamente às arestas de um determinado grafo.
     */
    @Test
    public void fileToEdgeTest2() {
        String filePathTest = "grafos/Small/distancias_test2.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToEdge(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 63448);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 67584);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 110848);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método fileToEdge para verificar se dado um ficheiro de distâncias completamente vazio, as arestas
     * de um determinado grafo continuam iguais.
     */
    @Test
    public void fileToEdgeTestEmpty() {
        String filePathTest = "grafos/Small/distancias_test3.csv";
        distributionHub = new DistributionHub();
        distributionHub.fileToEdge(filePathTest);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método buildDistributionHub para verificar se os dados de um dado ficheiro de cliente-produtores e distâncias
     * foram adicionados corretamente aos vértices e arestas de um determinado grafo.
     */
    @Test
    public void buildDistributionHubTest1() {
        String filePathProducerCostumer = "grafos/Small/clientes-produtores_test2.csv";
        String filePathDistances = "grafos/Small/distancias_test1.csv";

        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(filePathProducerCostumer, filePathDistances);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        // Vertex
        expectedResult.addVertex(new Particular("CT1", 40.6389, -8.6553, "C1"));
        expectedResult.addVertex(new Particular("CT2", 38.0333, -7.8833, "C2"));
        expectedResult.addVertex(new Particular("CT3", 41.5333, -8.4167, "C3"));
        expectedResult.addVertex(new Company("CT14", 38.5243, -8.8926, "E1"));
        expectedResult.addVertex(new Company("CT11", 39.3167, -7.4167, "E2"));
        expectedResult.addVertex(new Company("CT5", 39.823, -7.4931, "E3"));
        expectedResult.addVertex(new Producer("CT17", 40.6667, -7.9167, "P1"));
        expectedResult.addVertex(new Producer("CT6", 40.2111, -8.4291, "P2"));
        expectedResult.addVertex(new Producer("CT10", 39.7444, -8.8072, "P3"));

        // Edge
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 63448);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 67584);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 110848);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT5"), 125041);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT3"), 50467);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT1"), 62877);
        expectedResult.addEdge(new Hub("CT12"), new Hub("CT10"), 70717);
        expectedResult.addEdge(new Hub("CT11"), new Hub("CT5"), 62655);
        expectedResult.addEdge(new Hub("CT14"), new Hub("CT1"), 121584);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método buildDistributionHub para verificar se os dados duplicados de um dado ficheiro de cliente-produtores
     * e distâncias foram adicionados corretamente aos vértices e arestas de um determinado grafo.
     */
    @Test
    public void buildDistributionHubTest2() {
        String filePathProducerCostumer = "grafos/Small/clientes-produtores_test1.csv";
        String filePathDistances = "grafos/Small/distancias_test2.csv";

        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(filePathProducerCostumer, filePathDistances);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        // Vertex
        expectedResult.addVertex(new Particular("CT1", 40.6389, -8.6553, "C1"));
        expectedResult.addVertex(new Particular("CT2", 38.0333, -7.8833, "C2"));
        expectedResult.addVertex(new Particular("CT3", 41.5333, -8.4167, "C3"));

        // Edge
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT6"), 63448);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT4"), 67584);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT1"), 110848);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());

        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método buildDistributionHub para verificar se dado um ficheiro de cliente-produtores e distâncias
     * completamente vazios, os vértices e arestas de um determinado grafo continuam iguais.
     */
    @Test
    public void buildDistributionHubTestEmpty() {
        String filePathProducerCostumer = "grafos/Small/clientes-produtores_test3.csv";
        String filePathDistances = "grafos/Small/distancias_test3.csv";

        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(filePathProducerCostumer,filePathDistances);

        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+distributionHub.getDistributionHub());


        assertEquals(expectedResult, distributionHub.getDistributionHub());
    }

    /**
     * Testa o método minimumSpanningTree para verificar se dado um ficheiro de cliente-produtores e distâncias, a árvore
     * de extensão mínima que conecta todos os clientes e produtores agrícolas com uma distância total mínima encontra-se correta
     * e se o numero suposto de ligações corresponde ao numero de ligações devolvidas pelo método que está a ser testado.
     */
    @Test
    public void minimumSpanningTreeTest1() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODCOST_SMALL, FILE_PATH_DISTANCE);

        Graph<Hub, Integer> result = distributionHub.minimumSpanningTree();
        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        expectedResult.addEdge(new Hub("CT1"), new Hub("CT6"), 56717);
        expectedResult.addEdge(new Hub("CT1"), new Hub("CT12"), 62877);
        expectedResult.addEdge(new Hub("CT1"), new Hub("CT17"), 69282);
        expectedResult.addEdge(new Hub("CT2"), new Hub("CT7"), 65574);
        expectedResult.addEdge(new Hub("CT2"), new Hub("CT8"), 125105);
        expectedResult.addEdge(new Hub("CT3"), new Hub("CT12"), 50467);
        expectedResult.addEdge(new Hub("CT3"), new Hub("CT15"), 43598);
        expectedResult.addEdge(new Hub("CT3"), new Hub("CT16"), 68957);
        expectedResult.addEdge(new Hub("CT4"), new Hub("CT16"), 110133);
        expectedResult.addEdge(new Hub("CT5"), new Hub("CT9"), 90186);
        expectedResult.addEdge(new Hub("CT5"), new Hub("CT11"), 62655);
        expectedResult.addEdge(new Hub("CT6"), new Hub("CT10"), 67584);
        expectedResult.addEdge(new Hub("CT7"), new Hub("CT14"), 95957);
        expectedResult.addEdge(new Hub("CT9"), new Hub("CT17"), 62879);
        expectedResult.addEdge(new Hub("CT10"), new Hub("CT13"), 63448);
        expectedResult.addEdge(new Hub("CT13"), new Hub("CT14"), 89813);

        System.out.println("Numero de ligações esperadas : "+expectedResult.numEdges()/2);
        System.out.println("Numero de ligações resultantes: "+result.numEdges()/2);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método minimumSpanningTree para verificar se dado um ficheiro de cliente-produtores e distâncias com apenas
     * 3 pontos de rede, a árvore de extensão mínima que conecta todos os clientes e produtores com uma distância
     * total mínima encontra-se correta  e se o numero suposto de ligações corresponde ao numero de ligações
     * devolvidas pelo método que está a ser testado.
     */
    @Test
    public void minimumSpanningTreeTest2() {
        String filePathProducerCostumer = "grafos/Small/clientes-produtores_test4.csv";
        String filePathDistances = "grafos/Small/distancias_test4.csv";

        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(filePathProducerCostumer, filePathDistances);

        Graph<Hub, Integer> result = distributionHub.minimumSpanningTree();
        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);
        expectedResult.addEdge(new Hub("CT1"), new Hub("CT2"), 63448);
        expectedResult.addEdge(new Hub("CT2"), new Hub("CT3"), 63448);
        System.out.println("Numero de ligações esperadas : "+expectedResult.numEdges()/2);
        System.out.println("Numero de ligações resultantes: "+result.numEdges()/2);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }

    /**
     * Testa o método minimumSpanningTree para verificar se dado um ficheiro de cliente-produtores e distâncias completamente
     * vazios, a árvore de extensão mínima também encontra-se vazia.
     */
    @Test
    public void minimumSpanningTreeTestEmpty() {
        String filePathProducerCostumer = "grafos/Small/clientes-produtores_test3.csv";
        String filePathDistances = "grafos/Small/distancias_test3.csv";

        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(filePathProducerCostumer, filePathDistances);

        Graph<Hub, Integer> result = distributionHub.minimumSpanningTree();
        Graph<Hub, Integer> expectedResult = new MatrixGraph<>(false);

        System.out.println("Numero de ligações esperadas : "+expectedResult.numEdges()/2);
        System.out.println("Numero de ligações resultantes: "+result.numEdges()/2);

        System.out.println("Expected Result:\n"+expectedResult);
        System.out.println("\nActual Result:\n"+result);

        assertEquals(expectedResult, result);
    }


    @Test
    public void checkConnectivityTest1() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODCOST_SMALL, FILE_PATH_DISTANCE);

        boolean result = distributionHub.checkConnectivity();

        System.out.println("Expected Result: true");
        System.out.println("\nActual Result: "+result);

        assertTrue(result);
    }


    @Test
    public void checkConnectivityTest2() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub("grafos/Small/clientes-produtores_test5.csv", "grafos/Small/distancias_test5.csv");

        boolean result = distributionHub.checkConnectivity();

        System.out.println("Expected Result: false");
        System.out.println("\nActual Result: "+result);

        assertFalse(result);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando existe um dia inválido no ficheiro de
     * importação de cabazes.
     */
    @Test
    public void fileToCabazTest1() {
        exceptionRule.expect(NumberFormatException.class);
        exceptionRule.expectMessage("Verifique o valor do dia na linha 5 do ficheiro, pois encontra-se inválido.");
        String invalid_day_file = "grafos/Small/cabazes_small_test_fail_wrong_day.csv";
        distributionHub.fileToCabaz(invalid_day_file);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando uma quantidade está
     * inválido o ficheiro de importação de cabazes.
     */
    @Test
    public void fileToCabazTest2() {
        exceptionRule.expect(NumberFormatException.class);
        exceptionRule.expectMessage("Foi encontrado um erro na linha 10 do ficheiro. Verifique as quantidades " +
                "existentes para os produtos nessa mesma linha.");
        String invalid_amount_file = "grafos/Small/cabazes_small_test_fail_invalid_amount.csv";

        distributionHub.fileToCabaz(invalid_amount_file);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando é indicado um cliente ou
     * produtor no ficheiro de importação de cabazes, e que este não existe na rede de distribuição.
     */
    @Test
    public void fileToCabazTest3() {
        exceptionRule.expect(HubNotFoundException.class);
        exceptionRule.expectMessage("O cliente ou produtor específicado na linha 20 do ficheiro, não foi " +
                "encontrado na rede de distribuição. Por favor, verifique se está correto.");
        String nonexistent_codidentifier_file = "grafos/Small/cabazes_small_test_fail_nonexistent_codIdentifier.csv";
        distributionHub.fileToCabaz(nonexistent_codidentifier_file);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando uma linha de um ficheiro
     * tem um número de colunas diferente ao número de colunas que o cabeçalho desse mesmo ficheiro tem.
     */
    @Test
    public void fileToCabazTest4() {
        exceptionRule.expect(InvalidFileLineException.class);
        exceptionRule.expectMessage(new InvalidFileLineException(19).getMessage());
        String invalid_line_size_file = "grafos/Small/cabazes_small_test_fail_invalid_line_size.csv";
        distributionHub.fileToCabaz(invalid_line_size_file);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando o caminho de um ficheiro
     * passado para o método, não existe.
     */
    @Test
    public void fileToCabazTest5() {
        exceptionRule.expect(IllegalArgumentException.class);
        exceptionRule.expectMessage("Não existe nenhum ficheiro no caminho indicado.");
        String inexistent_file = "não existe este ficheiro";
        distributionHub.fileToCabaz(inexistent_file);
    }

    /**
     * Método que testa o método que trata de chamar a leitura do ficheiro de cabazes quando a rede de distribuição é
     * nula ou não contem vértices.
     */
    @Test
    public void fileToCabazTest6() {
        DistributionHub nullDistributionNetwork = new DistributionHub();
        nullDistributionNetwork.fileToCabaz(SMALL_BASKET_FILE);
        Assert.assertNull(nullDistributionNetwork.getProductsAvailable());
        Assert.assertNull(nullDistributionNetwork.getProductsRequest());
    }
    /**
     * Método que verifica se o método que trata de chamar a leitura do ficheiro de cabazes constrói corretamente o
     * mapa de produtos disponíveis (em cabaz), e se posteriormente este é clonado corretamente.
     */
    @Test
    public void fileToCabazTest7() {
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);
        Map<Integer, Map<Producer, Cabaz>> expectedMap = new HashMap<>();
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        Map<Producer, Cabaz> dayOneMap = new HashMap<>();
        Map<Producer, Cabaz> dayTwoMap = new HashMap<>();

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        // Apenas produtos com quantidade superior a 0.0 são armazenados
        // Produtor 1
        Cabaz p1BasketDayOne = new Cabaz();
        p1BasketDayOne.addProduct(productTwo, 7.5);
        p1BasketDayOne.addProduct(productThree, 9.0);
        dayOneMap.put(p1, p1BasketDayOne);

        Cabaz p1BasketDayTwo = new Cabaz();
        p1BasketDayTwo.addProduct(productOne, 3.0);
        dayTwoMap.put(p1, p1BasketDayTwo);

        // Produtor 2
        Cabaz p2BasketDayOne = new Cabaz();
        p2BasketDayOne.addProduct(productOne, 7.5);
        p2BasketDayOne.addProduct(productTwo, 6.5);
        p2BasketDayOne.addProduct(productThree, 1.5);
        dayOneMap.put(p2, p2BasketDayOne);

        Cabaz p2BasketDayTwo = new Cabaz();
        p2BasketDayTwo.addProduct(productOne, 6.0);
        p2BasketDayTwo.addProduct(productThree, 10.0);
        dayTwoMap.put(p2, p2BasketDayTwo);

        // Produtor 3
        Cabaz p3BasketDayOne = new Cabaz();
        p3BasketDayOne.addProduct(productOne, 2.5);
        p3BasketDayOne.addProduct(productTwo, 2.0);
        dayOneMap.put(p3, p3BasketDayOne);

        expectedMap.put(1, dayOneMap);
        expectedMap.put(2, dayTwoMap);
        //System.out.println(expectedMap.toString());
        //System.out.println(distributionHub.getProductsAvailable().toString());
        System.out.println(distributionHub.getProductsAvailable());
        System.out.println(expectedMap);
        TestMapsHelper.testProductsAvailableOrRequestedMaps(expectedMap, distributionHub.getProductsAvailable());

    }

    /**
     * Método que verifica se o método que trata de chamar a leitura do ficheiro de cabazes, constrói corretamente o
     * mapa de produtos pedidos (em cabaz), e se posteriormente este é clonado corretamente.
     */
    @Test
    public void fileToCabazTest8() {
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);
        Map<Integer, Map<Costumer, Cabaz>> expectedMap = new HashMap<>();

        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Particular particularCostumerThree = new Particular("CT3", 41.5333, -8.4167, "C3");
        Company companyCostumerOne = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyCostumerThree = new Company("CT5", 39.823, -7.4931, "E3");

        Map<Costumer, Cabaz> dayOneMap = new HashMap<>();
        Map<Costumer, Cabaz> dayTwoMap = new HashMap<>();

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        // Apenas produtos com quantidade superior a 0.0 são armazenados como pedido
        // Particular Costumer 1
        Cabaz c1BasketDayTwo = new Cabaz();
        c1BasketDayTwo.addProduct(productOne, 4.5);
        c1BasketDayTwo.addProduct(productTwo, 6.0);
        c1BasketDayTwo.addProduct(productThree, 3.5);
        dayTwoMap.put(particularCostumerOne, c1BasketDayTwo);

        // Particular Costumer 2
        Cabaz c2BasketDayOne = new Cabaz();
        c2BasketDayOne.addProduct(productTwo, 5.5);
        c2BasketDayOne.addProduct(productThree, 4.5);
        dayOneMap.put(particularCostumerTwo, c2BasketDayOne);

        Cabaz c2BasketDayTwo = new Cabaz();
        c2BasketDayTwo.addProduct(productOne, 9.0);
        c2BasketDayTwo.addProduct(productTwo, 7.0);
        dayTwoMap.put(particularCostumerTwo, c2BasketDayTwo);

        // Particular Costumer 3
        Cabaz c3BasketDayTwo = new Cabaz();
        c3BasketDayTwo.addProduct(productOne, 10.0);
        c3BasketDayTwo.addProduct(productTwo, 20.0);
        dayTwoMap.put(particularCostumerThree, c3BasketDayTwo);

        // Company Costumer 1
        Cabaz e1BasketDayTwo = new Cabaz();
        e1BasketDayTwo.addProduct(productThree, 9.5);
        dayTwoMap.put(companyCostumerOne, e1BasketDayTwo);

        // Company Costumer 2
        Cabaz e2BasketDayOne = new Cabaz();
        e2BasketDayOne.addProduct(productOne, 9.0);
        e2BasketDayOne.addProduct(productTwo, 6.0);
        e2BasketDayOne.addProduct(productThree, 9.0);
        dayOneMap.put(companyCostumerTwo, e2BasketDayOne);

        Cabaz e2BasketDayTwo = new Cabaz();
        e2BasketDayTwo.addProduct(productThree, 7.5);
        dayTwoMap.put(companyCostumerTwo, e2BasketDayTwo);

        // Company Costumer 3
        Cabaz e3BasketDayTwo = new Cabaz();
        e3BasketDayTwo.addProduct(productOne, 8.5);
        e3BasketDayTwo.addProduct(productTwo, 5.0);
        dayTwoMap.put(companyCostumerThree, e3BasketDayTwo);

        expectedMap.put(1, dayOneMap);
        expectedMap.put(2, dayTwoMap);
        System.out.println(distributionHub.getProductsRequest());
        System.out.println(expectedMap);
        TestMapsHelper.testProductsAvailableOrRequestedMaps(expectedMap, distributionHub.getProductsRequest());

    }


    /**
     * Método para testar se é possivel gerar uma lista de expedição sem restrições, para um dado dia que não tem dados
     * registados.
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest1() {
        List<CabazExpedition> basketExpeditionsList = distributionHub.generateExpeditionListWithoutRestriction(10);
        assertNull(basketExpeditionsList);
    }

    @Test
    public void generateExpeditionListWithoutRestrictionTest2() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 1;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        List<CabazExpedition> expectedBasketExpeditions = new ArrayList<>();
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");

        // Cabaz de expedição para o cliente C2
        CabazExpedition basketExpeditionC2Day1 = new CabazExpedition(particularCostumerTwo, day);
        ProductProvided productProvidedOneC2Day1 = new ProductProvided(productTwo, 5.5, 5.5, p2);
        ProductProvided productProvidedTwoC2Day1 = new ProductProvided(productThree, 4.5, 1.5, p2);
        basketExpeditionC2Day1.addProductProvided(productProvidedOneC2Day1);
        basketExpeditionC2Day1.addProductProvided(productProvidedTwoC2Day1);
        expectedBasketExpeditions.add(basketExpeditionC2Day1);

        // Cabaz de expedição para o cliente E2
        CabazExpedition basketExpeditionE2Day1 = new CabazExpedition(companyCostumerTwo, day);
        ProductProvided productProvidedOneE2Day1 = new ProductProvided(productOne, 9, 7.5, p2);
        ProductProvided productProvidedTwoE2Day1 = new ProductProvided(productTwo, 6, 1, p2);
        ProductProvided productProvidedThreeE2Day1 = new ProductProvided(productThree, 9, 9, p1);

        basketExpeditionE2Day1.addProductProvided(productProvidedOneE2Day1);
        basketExpeditionE2Day1.addProductProvided(productProvidedTwoE2Day1);
        basketExpeditionE2Day1.addProductProvided(productProvidedThreeE2Day1);
        expectedBasketExpeditions.add(basketExpeditionE2Day1);

        assertEquals(expectedBasketExpeditions, actualBasketExpeditions);
    }

    /**
     * Método que testa se os valores dos mapas dos cabazes pedidos pelos clientes e dos cabazes fornecidos pelos
     * produtores, são atualizados corretamente. Neste teste é feita a expedição dos produtos para o dia 1 da lista
     * gerada pela utilização dos dados presentes no ficheiro SMALL_BASKET_FILE.
     * Teste complemento do teste generateExpeditionListWithoutRestrictionTest2().
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest3() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 1;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        Map<Integer, Map<Producer, Cabaz>> productsAvailable = distributionHub.getProductsAvailable();
        Map<Integer, Map<Costumer, Cabaz>> productsRequest = distributionHub.getProductsRequest();

        Map<Producer, Cabaz> actualProductsAvailable = productsAvailable.get(day);
        Map<Costumer, Cabaz> actualProductsRequest = productsRequest.get(day);

        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");

        // Testa o cabaz pedido por C2
        assertEquals(0, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productTwo), 0);
        assertEquals(3.0, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productThree), 0);

        // Testa o cabaz pedido por E2
        assertEquals(1.5, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productOne), 0);
        assertEquals(5.0, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P1
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productOne), 0);
        assertEquals(7.5, actualProductsAvailable.get(p1).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P3
        assertEquals(2.5, actualProductsAvailable.get(p3).getProductQuantity(productOne), 0);
        assertEquals(2, actualProductsAvailable.get(p3).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p3).getProductQuantity(productThree), 0);
    }

    /**
     * Método que testa se a lista de expedição sem restrições gerada para o dia 2 do ficheiro SMALL_BASKET_FILE, é
     * gerada corretamente. Aqui, alguns produtos serão procurados consequentemente nos cabazes disponibilizados no dia
     * 1.
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest4() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 2;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        List<CabazExpedition> expectedBasketExpeditions = new ArrayList<>();
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Particular particularCostumerThree = new Particular("CT3", 41.5333, -8.4167, "C3");
        Company companyCostumerOne = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyCostumerThree = new Company("CT5", 39.823, -7.4931, "E3");

        // Cabaz de expedição para o cliente C1
        CabazExpedition basketExpeditionC1Day2 = new CabazExpedition(particularCostumerOne, day);
        ProductProvided productProvidedOneC1Day2 = new ProductProvided(productOne, 4.5, 3, p1);
        ProductProvided productProvidedTwoC1Day2 = new ProductProvided(productTwo, 6, 6, p1); // De dia 1
        ProductProvided productProvidedThreeC1Day2 = new ProductProvided(productThree, 3.5, 3.5, p2);
        basketExpeditionC1Day2.addProductProvided(productProvidedOneC1Day2);
        basketExpeditionC1Day2.addProductProvided(productProvidedTwoC1Day2);
        basketExpeditionC1Day2.addProductProvided(productProvidedThreeC1Day2);

        // Cabaz de expedição para o cliente C2
        CabazExpedition basketExpeditionC2Day2 = new CabazExpedition(particularCostumerTwo, day);
        ProductProvided productProvidedOneC2Day2 = new ProductProvided(productOne, 9, 6, p2);
        ProductProvided productProvidedTwoC2Day2 = new ProductProvided(productTwo, 7, 6.5, p2); // De dia 1
        basketExpeditionC2Day2.addProductProvided(productProvidedOneC2Day2);
        basketExpeditionC2Day2.addProductProvided(productProvidedTwoC2Day2);

        // Cabaz de expedição para o cliente C3
        CabazExpedition basketExpeditionC3Day2 = new CabazExpedition(particularCostumerThree, day);
        ProductProvided productProvidedOneC3Day2 = new ProductProvided(productOne, 10, 7.5, p2); // De dia 1
        ProductProvided productProvidedTwoC3Day2 = new ProductProvided(productTwo, 20, 1.5, p1); // De dia 1
        basketExpeditionC3Day2.addProductProvided(productProvidedOneC3Day2);
        basketExpeditionC3Day2.addProductProvided(productProvidedTwoC3Day2);

        // Cabaz de expedição para o cliente E1
        CabazExpedition basketExpeditionE1Day1 = new CabazExpedition(companyCostumerOne, day);
        ProductProvided productProvidedThreeE1Day1 = new ProductProvided(productThree, 9.5, 6.5, p2);
        basketExpeditionE1Day1.addProductProvided(productProvidedThreeE1Day1);

        // Cabaz de expedição para o cliente E2
        CabazExpedition basketExpeditionE2Day1 = new CabazExpedition(companyCostumerTwo, day);
        ProductProvided productProvidedThreeE2Day1 = new ProductProvided(productThree, 7.5, 1.5, p2); // De dia 1
        basketExpeditionE2Day1.addProductProvided(productProvidedThreeE2Day1);

        // Cabaz de expedição para o cliente E3
        CabazExpedition basketExpeditionE3Day2 = new CabazExpedition(companyCostumerThree, day);
        ProductProvided productProvidedOneE3Day2 = new ProductProvided(productOne, 8.5, 2.5, p3); // De dia 1
        ProductProvided productProvidedTwoE3Day2 = new ProductProvided(productTwo, 5, 2, p3); // De dia 1
        basketExpeditionE3Day2.addProductProvided(productProvidedOneE3Day2);
        basketExpeditionE3Day2.addProductProvided(productProvidedTwoE3Day2);

        expectedBasketExpeditions.add(basketExpeditionC2Day2);
        expectedBasketExpeditions.add(basketExpeditionC1Day2);
        expectedBasketExpeditions.add(basketExpeditionC3Day2);
        expectedBasketExpeditions.add(basketExpeditionE3Day2);
        expectedBasketExpeditions.add(basketExpeditionE1Day1);
        expectedBasketExpeditions.add(basketExpeditionE2Day1);

        assertEquals(expectedBasketExpeditions, actualBasketExpeditions);
    }

    /**
     * Método que testa se os valores dos mapas dos cabazes pedidos pelos clientes e dos cabazes fornecidos pelos
     * produtores, são atualizados corretamente. Neste teste é feita a expedição dos produtos para o dia 2 da lista
     * gerada pela utilização dos dados presentes no ficheiro SMALL_BASKET_FILE. Aqui, consequentemente os produtos de
     * dia 1 que foram fornecidos, são também utilizados e atualizados para construir os cabazes.
     * Teste complemento do teste generateExpeditionListWithoutRestrictionTest4().
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest5() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Particular particularCostumerThree = new Particular("CT3", 41.5333, -8.4167, "C3");
        Company companyCostumerOne = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyCostumerThree = new Company("CT5", 39.823, -7.4931, "E3");

        // Dia 2
        int day = 2;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        Map<Integer, Map<Producer, Cabaz>> productsAvailable = distributionHub.getProductsAvailable();
        Map<Integer, Map<Costumer, Cabaz>> productsRequest = distributionHub.getProductsRequest();

        Map<Producer, Cabaz> actualProductsAvailable = productsAvailable.get(day);
        Map<Costumer, Cabaz> actualProductsRequest = productsRequest.get(day);

        // Testa o cabaz pedido por C1
        assertEquals(1.5, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productThree), 0);

        // Testa o cabaz pedido por C2
        assertEquals(3, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productOne), 0);
        assertEquals(0.5, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productTwo), 0);

        // Testa o cabaz pedido por C3
        assertEquals(2.5, actualProductsRequest.get(particularCostumerThree).getProductQuantity(productOne), 0);
        assertEquals(18.5, actualProductsRequest.get(particularCostumerThree).getProductQuantity(productTwo), 0);

        // Testa o cabaz pedido por E1
        assertEquals(3, actualProductsRequest.get(companyCostumerOne).getProductQuantity(productThree), 0);

        // Testa o cabaz pedido por E2
        assertEquals(6, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productThree), 0);

        // Testa o cabaz pedido por E3
        assertEquals(6, actualProductsRequest.get(companyCostumerThree).getProductQuantity(productOne), 0);
        assertEquals(3, actualProductsRequest.get(companyCostumerThree).getProductQuantity(productTwo), 0);

        // Testa o cabaz disponibilizado por P1
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

        // Dia 1 dos produtos disponíveis
        day = 1;
        productsAvailable = distributionHub.getProductsAvailable();
        actualProductsAvailable = productsAvailable.get(day);

        // Testa o cabaz disponibilizado por P1
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productTwo), 0);
        assertEquals(9, actualProductsAvailable.get(p1).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P3
        assertEquals(0, actualProductsAvailable.get(p3).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p3).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p3).getProductQuantity(productThree), 0);

    }

    /**
     * Método que testa se a lista de expedição sem restrições gerada para o dia 2 do ficheiro SMALL_BASKET_FILE_TWO, é
     * gerada corretamente. Aqui, será testado se um produto fornecido quando não há produtores que tenham o produto
     * disponibilizado, vem com o valor correto.
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest6() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE_TWO);

        int day = 2;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        List<CabazExpedition> expectedBasketExpeditions = new ArrayList<>();
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");

        // Cabaz de expedição para o cliente C1
        CabazExpedition cabazExpeditionC1Day2 = new CabazExpedition(particularCostumerOne, day);
        ProductProvided productProvidedOneC1Day2 = new ProductProvided(productOne, 4.5, 4.5, p2);
        ProductProvided productProvidedTwoC1Day2 = new ProductProvided(productTwo, 6, 0, null);
        ProductProvided productProvidedThreeC1Day2 = new ProductProvided(productThree, 3.5, 3.5, p2);
        cabazExpeditionC1Day2.addProductProvided(productProvidedOneC1Day2);
        cabazExpeditionC1Day2.addProductProvided(productProvidedTwoC1Day2);
        cabazExpeditionC1Day2.addProductProvided(productProvidedThreeC1Day2);

        expectedBasketExpeditions.add(cabazExpeditionC1Day2);

        assertEquals(expectedBasketExpeditions, actualBasketExpeditions);
    }

    /**
     * Método que testa se os valores dos mapas dos cabazes pedidos pelos clientes e dos cabazes fornecidos pelos
     * produtores, são atualizados corretamente. Neste teste é feita a expedição dos produtos para o dia 2 da lista
     * gerada pela utilização dos dados presentes no ficheiro SMALL_BASKET_FILE_TWO. Aqui, consequentemente os produtos
     * de dia 1 que foram fornecidos, são também utilizados e atualizados para construir os cabazes.
     * Teste complemento do teste generateExpeditionListWithoutRestrictionTest6().
     */
    @Test
    public void generateExpeditionListWithoutRestrictionTest7() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE_TWO);

        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");

        // Dia 2
        int day = 2;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        Map<Integer, Map<Producer, Cabaz>> productsAvailable = distributionHub.getProductsAvailable();
        Map<Integer, Map<Costumer, Cabaz>> productsRequest = distributionHub.getProductsRequest();

        Map<Producer, Cabaz> actualProductsAvailable = productsAvailable.get(day);
        Map<Costumer, Cabaz> actualProductsRequest = productsRequest.get(day);

        // Testa o cabaz pedido por C1
        assertEquals(0, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productOne), 0);
        assertEquals(6, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsRequest.get(particularCostumerOne).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P1
        assertEquals(3, actualProductsAvailable.get(p1).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(1.5, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(6.5, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

        // Dia 1 dos produtos disponíveis
        day = 1;
        productsAvailable = distributionHub.getProductsAvailable();
        actualProductsAvailable = productsAvailable.get(day);

        // Testa o cabaz disponibilizado por P1
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p1).getProductQuantity(productTwo), 0);
        assertEquals(9, actualProductsAvailable.get(p1).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(7.5, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(1.5, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

    }


    /**
     * Método que testa se o percurso de entrega que minimiza a distância total percorrida para a lista de expedição
     * gerada para o dia 2 do ficheiro FILE_PATH_CABAZES_SMALL, é gerada corretamente.
     */
    @Test
    public void generateDeliveryRouteTest1() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(FILE_PATH_CABAZES_SMALL);

        int day = 2;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);
        DeliveryRoute deliveryRouteResult = distributionHub.generateDeliveryRoute(actualCabazExpeditions);

        LinkedList<Hub> waypoints = new LinkedList<>();
        waypoints.add(new Hub("CT17"));
        waypoints.add(new Hub("CT6"));
        waypoints.add(new Hub("CT10"));
        waypoints.add(new Hub("CT4"));
        waypoints.add(new Hub("CT5"));
        waypoints.add(new Hub("CT9"));
        waypoints.add(new Hub("CT11"));
        waypoints.add(new Hub("CT14"));

        int totalDistance = 1179654;

        DeliveryRoute deliveryRouteExpected = new DeliveryRoute(waypoints, totalDistance);
        System.out.println("Result: "+deliveryRouteResult);
        assertEquals(deliveryRouteExpected, deliveryRouteResult);
    }

    /**
     * Método que testa se o percurso de entrega que minimiza a distância total percorrida para a lista de expedição
     * gerada para o dia 5 do ficheiro FILE_PATH_CABAZES_SMALL, é gerada corretamente.
     */
    @Test
    public void generateDeliveryRouteTest2() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(FILE_PATH_CABAZES_SMALL);

        int day = 5;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        DeliveryRoute deliveryRouteResult = distributionHub.generateDeliveryRoute(actualCabazExpeditions);

        LinkedList<Hub> waypoints = new LinkedList<>();
        waypoints.add(new Hub("CT17"));
        waypoints.add(new Hub("CT6"));
        waypoints.add(new Hub("CT10"));
        waypoints.add(new Hub("CT4"));
        waypoints.add(new Hub("CT5"));
        waypoints.add(new Hub("CT9"));
        waypoints.add(new Hub("CT11"));
        waypoints.add(new Hub("CT14"));

        int totalDistance = 1179654;

        DeliveryRoute deliveryRouteExpected = new DeliveryRoute(waypoints, totalDistance);
        System.out.println("Result: "+deliveryRouteResult);
        assertEquals(deliveryRouteExpected, deliveryRouteResult);
    }

    /**
     * Método que testa se o percurso de entrega que minimiza a distância total percorrida para a lista de expedição
     * gerada para o dia 2 do ficheiro SMALL_BASKET_FILE_TWO, é gerada corretamente.
     */
    @Test
    public void generateDeliveryRouteTest3() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE_TWO);

        int day = 2;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        DeliveryRoute deliveryRouteResult = distributionHub.generateDeliveryRoute(actualCabazExpeditions);

        LinkedList<Hub> waypoints = new LinkedList<>();
        waypoints.add(new Hub("CT6"));
        waypoints.add(new Hub("CT9"));

        int totalDistance = 136707;

        DeliveryRoute deliveryRouteExpected = new DeliveryRoute(waypoints, totalDistance);
        System.out.println("Result: "+deliveryRouteResult);
        assertEquals(deliveryRouteExpected, deliveryRouteResult);
    }

    /**
     * Método que testa se o percurso de entrega que minimiza a distância total percorrida para a lista de expedição
     * gerada para o dia 1 do ficheiro SMALL_BASKET_FILE, é gerada corretamente.
     */
    @Test
    public void generateDeliveryRouteTest4() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 1;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        DeliveryRoute deliveryRouteResult = distributionHub.generateDeliveryRoute(actualCabazExpeditions);

        LinkedList<Hub> waypoints = new LinkedList<>();
        waypoints.add(new Hub("CT17"));
        waypoints.add(new Hub("CT6"));
        waypoints.add(new Hub("CT5"));
        waypoints.add(new Hub("CT14"));

        int totalDistance = 448443;
        
        DeliveryRoute deliveryRouteExpected = new DeliveryRoute(waypoints, totalDistance);
        System.out.println("Result: "+deliveryRouteResult);
        assertEquals(deliveryRouteExpected, deliveryRouteResult);
    }

    /**
     * Método que testa se o percurso de entrega que minimiza a distância total percorrida para a lista de expedição
     * gerada para o dia 1 do ficheiro FILE_PATH_CABAZES_BIG, é gerada corretamente.
    **/
    @Test
    public void generateDeliveryRouteTest5() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_BIG, FILE_PATH_DISTANCES_BIG);
        distributionHub.fileToCabaz(FILE_PATH_CABAZES_BIG);

        int day = 1;
        List<CabazExpedition> actualBasketExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        DeliveryRoute deliveryRouteResult = distributionHub.generateDeliveryRoute(actualBasketExpeditions);

        LinkedList<Hub> waypoints = new LinkedList<>();
        waypoints.add(new Hub("CT7"));
        waypoints.add(new Hub("CT86"));
        waypoints.add(new Hub("CT90"));
        waypoints.add(new Hub("CT95"));
        waypoints.add(new Hub("CT1"));
        waypoints.add(new Hub("CT120"));
        waypoints.add(new Hub("CT126"));
        waypoints.add(new Hub("CT139"));
        waypoints.add(new Hub("CT14"));
        waypoints.add(new Hub("CT140"));
        waypoints.add(new Hub("CT153"));
        waypoints.add(new Hub("CT160"));
        waypoints.add(new Hub("CT164"));
        waypoints.add(new Hub("CT169"));
        waypoints.add(new Hub("CT178"));
        waypoints.add(new Hub("CT183"));
        waypoints.add(new Hub("CT185"));
        waypoints.add(new Hub("CT190"));
        waypoints.add(new Hub("CT195"));
        waypoints.add(new Hub("CT204"));
        waypoints.add(new Hub("CT207"));
        waypoints.add(new Hub("CT211"));
        waypoints.add(new Hub("CT217"));
        waypoints.add(new Hub("CT228"));
        waypoints.add(new Hub("CT229"));
        waypoints.add(new Hub("CT24"));
        waypoints.add(new Hub("CT253"));
        waypoints.add(new Hub("CT266"));
        waypoints.add(new Hub("CT271"));
        waypoints.add(new Hub("CT283"));
        waypoints.add(new Hub("CT285"));
        waypoints.add(new Hub("CT287"));
        waypoints.add(new Hub("CT299"));
        waypoints.add(new Hub("CT301"));
        waypoints.add(new Hub("CT311"));
        waypoints.add(new Hub("CT318"));
        waypoints.add(new Hub("CT321"));
        waypoints.add(new Hub("CT35"));
        waypoints.add(new Hub("CT48"));
        waypoints.add(new Hub("CT50"));
        waypoints.add(new Hub("CT51"));
        waypoints.add(new Hub("CT53"));
        waypoints.add(new Hub("CT6"));
        waypoints.add(new Hub("CT64"));
        waypoints.add(new Hub("CT66"));
        waypoints.add(new Hub("CT307"));
        waypoints.add(new Hub("CT317"));
        waypoints.add(new Hub("CT33"));
        waypoints.add(new Hub("CT34"));
        waypoints.add(new Hub("CT36"));
        waypoints.add(new Hub("CT5"));
        waypoints.add(new Hub("CT61"));
        waypoints.add(new Hub("CT62"));
        waypoints.add(new Hub("CT70"));
        waypoints.add(new Hub("CT77"));
        waypoints.add(new Hub("CT81"));
        waypoints.add(new Hub("CT83"));
        waypoints.add(new Hub("CT85"));
        waypoints.add(new Hub("CT88"));
        waypoints.add(new Hub("CT89"));
        waypoints.add(new Hub("CT98"));
        waypoints.add(new Hub("CT101"));
        waypoints.add(new Hub("CT110"));
        waypoints.add(new Hub("CT112"));
        waypoints.add(new Hub("CT113"));
        waypoints.add(new Hub("CT114"));
        waypoints.add(new Hub("CT117"));
        waypoints.add(new Hub("CT12"));
        waypoints.add(new Hub("CT124"));
        waypoints.add(new Hub("CT128"));
        waypoints.add(new Hub("CT131"));
        waypoints.add(new Hub("CT132"));
        waypoints.add(new Hub("CT133"));
        waypoints.add(new Hub("CT135"));
        waypoints.add(new Hub("CT142"));
        waypoints.add(new Hub("CT145"));
        waypoints.add(new Hub("CT146"));
        waypoints.add(new Hub("CT149"));
        waypoints.add(new Hub("CT151"));
        waypoints.add(new Hub("CT152"));
        waypoints.add(new Hub("CT159"));
        waypoints.add(new Hub("CT16"));
        waypoints.add(new Hub("CT161"));
        waypoints.add(new Hub("CT162"));
        waypoints.add(new Hub("CT170"));
        waypoints.add(new Hub("CT171"));
        waypoints.add(new Hub("CT177"));
        waypoints.add(new Hub("CT179"));
        waypoints.add(new Hub("CT18"));
        waypoints.add(new Hub("CT186"));
        waypoints.add(new Hub("CT187"));
        waypoints.add(new Hub("CT19"));
        waypoints.add(new Hub("CT191"));
        waypoints.add(new Hub("CT2"));
        waypoints.add(new Hub("CT200"));
        waypoints.add(new Hub("CT201"));
        waypoints.add(new Hub("CT209"));
        waypoints.add(new Hub("CT223"));
        waypoints.add(new Hub("CT231"));
        waypoints.add(new Hub("CT236"));
        waypoints.add(new Hub("CT237"));
        waypoints.add(new Hub("CT238"));
        waypoints.add(new Hub("CT240"));
        waypoints.add(new Hub("CT242"));
        waypoints.add(new Hub("CT244"));
        waypoints.add(new Hub("CT247"));
        waypoints.add(new Hub("CT251"));
        waypoints.add(new Hub("CT252"));
        waypoints.add(new Hub("CT254"));
        waypoints.add(new Hub("CT256"));
        waypoints.add(new Hub("CT26"));
        waypoints.add(new Hub("CT262"));
        waypoints.add(new Hub("CT263"));
        waypoints.add(new Hub("CT265"));
        waypoints.add(new Hub("CT27"));
        waypoints.add(new Hub("CT274"));
        waypoints.add(new Hub("CT279"));
        waypoints.add(new Hub("CT280"));
        waypoints.add(new Hub("CT282"));
        waypoints.add(new Hub("CT292"));
        waypoints.add(new Hub("CT295"));
        waypoints.add(new Hub("CT297"));
        waypoints.add(new Hub("CT3"));
        waypoints.add(new Hub("CT30"));
        waypoints.add(new Hub("CT302"));

        int totalDistance = 29526706;

        DeliveryRoute deliveryRouteExpected = new DeliveryRoute(waypoints, totalDistance);
        System.out.println("Result: "+deliveryRouteResult);
        assertEquals(deliveryRouteExpected, deliveryRouteResult);
    }
/**
 * Método para testar se é possivel gerar uma lista de expedição com os n hubs mais próximos, para um dado dia que não tem dados registados.
 */
@Test
public void generateExpeditionListWithNClosestHubsTest1() {
        List<CabazExpedition> cabazExpeditionsList = distributionHub.generateExpeditionListWithNClosestHubs(1, 10);
        assertNull(cabazExpeditionsList);
        }

/**
 * Método para testar se é possivel gerar uma lista de expedição com os n hubs mais próximos, para um número de hubs impossivel.
 */
@Test
public void generateExpeditionListWithNClosestHubsTest2() {
        List<CabazExpedition> cabazExpeditionsList = distributionHub.generateExpeditionListWithNClosestHubs(-1, 1);
        assertNull(cabazExpeditionsList);
        }

/**
 * Método que testa se a lista de expedição com os n hubs mais próximos gerada para o dia 1 do ficheiro SMALL_BASKET_FILE, é
 * gerada corretamente.
 */
@Test
public void generateExpeditionListWithNClosestHubsTest3() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 1;
        int n = 2;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithNClosestHubs(n, day);

        List<CabazExpedition> expectedCabazExpeditions =  new ArrayList<>();
        Producer p1 = new Producer("CT17", 39.7444,-8.8072, "P1");
        Producer p2 = new Producer("CT6", 40.2111,-8.4291, "P2");
        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");

        // Cabaz de expedição para o cliente C2
        CabazExpedition basketExpeditionC2Day1 = new CabazExpedition(particularCostumerTwo, day);
        ProductProvided productProvidedOneC2Day1 = new ProductProvided(productTwo, 5.5, 5.5, p2);
        ProductProvided productProvidedTwoC2Day1 = new ProductProvided(productThree, 4.5, 1.5, p2);
        basketExpeditionC2Day1.addProductProvided(productProvidedOneC2Day1);
        basketExpeditionC2Day1.addProductProvided(productProvidedTwoC2Day1);
        expectedCabazExpeditions.add(basketExpeditionC2Day1);

        // Cabaz de expedição para o cliente E2
        CabazExpedition basketExpeditionE2Day1 = new CabazExpedition(companyCostumerTwo, day);
        ProductProvided productProvidedOneE2Day1 = new ProductProvided(productOne, 9, 7.5, p2);
        ProductProvided productProvidedTwoE2Day1 = new ProductProvided(productTwo, 6, 1, p2);
        ProductProvided productProvidedThreeE2Day1 = new ProductProvided(productThree, 9, 9, p1);

        basketExpeditionE2Day1.addProductProvided(productProvidedOneE2Day1);
        basketExpeditionE2Day1.addProductProvided(productProvidedTwoE2Day1);
        basketExpeditionE2Day1.addProductProvided(productProvidedThreeE2Day1);
        expectedCabazExpeditions.add(basketExpeditionE2Day1);

        assertEquals(expectedCabazExpeditions, actualCabazExpeditions);
        }

/**
 * Método que testa se os valores dos mapas dos cabazes pedidos pelos clientes e dos cabazes fornecidos pelos
 * produtores, são atualizados corretamente. Neste teste é feita a expedição dos produtos para o dia 1 da lista
 * gerada pela utilização dos dados presentes no ficheiro SMALL_BASKET_FILE.
 * Teste complemento do teste generateExpeditionListWithNClosestHubsTest3().
 */
@Test
public void generateExpeditionListWithNClosestHubsTest4() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 1;
        int n = 2;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithNClosestHubs(n, day);

        Map<Integer, Map<Producer, Cabaz>> productsAvailable = distributionHub.getProductsAvailable();
        Map<Integer, Map<Costumer, Cabaz>> productsRequest = distributionHub.getProductsRequest();

        Map<Producer, Cabaz> actualProductsAvailable = productsAvailable.get(day);
        Map<Costumer, Cabaz> actualProductsRequest = productsRequest.get(day);

        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");

        // Testa o cabaz pedido por C2
        assertEquals(0, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productTwo), 0);
        assertEquals(3.0, actualProductsRequest.get(particularCostumerTwo).getProductQuantity(productThree), 0);

        // Testa o cabaz pedido por E2
        assertEquals(1.5, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productOne), 0);
        assertEquals(5.0, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsRequest.get(companyCostumerTwo).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P2
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productOne), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p2).getProductQuantity(productThree), 0);

        // Testa o cabaz disponibilizado por P3
        assertEquals(2.5, actualProductsAvailable.get(p3).getProductQuantity(productOne), 0);
        assertEquals(2, actualProductsAvailable.get(p3).getProductQuantity(productTwo), 0);
        assertEquals(0, actualProductsAvailable.get(p3).getProductQuantity(productThree), 0);
        }

/**
 * Método que testa se a lista de expedição com os n hubs mais próximos gerada para o dia 2 do ficheiro SMALL_BASKET_FILE, é
 * gerada corretamente. Aqui, alguns produtos serão procurados consequentemente nos cabazes disponibilizados no dia 1.
 */
@Test
public void generateExpeditionListWithNClosestHubsTest5() {
        distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(SMALL_BASKET_FILE);

        int day = 2;
        int n = 2;
        List<CabazExpedition> actualCabazExpeditions = distributionHub.generateExpeditionListWithNClosestHubs(n, day);

        List<CabazExpedition> expectedCabazExpeditions = new ArrayList<>();
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        Producer p3 = new Producer("CT10", 39.7444, -8.8072, "P3");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumerTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Particular particularCostumerThree = new Particular("CT3", 41.5333, -8.4167, "C3");
        Company companyCostumerOne = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyCostumerTwo = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyCostumerThree = new Company("CT5", 39.823, -7.4931, "E3");

        // Cabaz de expedição para o cliente C1
        CabazExpedition basketExpeditionC1Day2 = new CabazExpedition(particularCostumerOne, day);
        ProductProvided productProvidedOneC1Day2 = new ProductProvided(productOne, 4.5, 3, p1);
        ProductProvided productProvidedTwoC1Day2 = new ProductProvided(productTwo, 6, 6, p1); // De dia 1
        ProductProvided productProvidedThreeC1Day2 = new ProductProvided(productThree, 3.5, 3.5, p2);
        basketExpeditionC1Day2.addProductProvided(productProvidedOneC1Day2);
        basketExpeditionC1Day2.addProductProvided(productProvidedTwoC1Day2);
        basketExpeditionC1Day2.addProductProvided(productProvidedThreeC1Day2);

        // Cabaz de expedição para o cliente C2
        CabazExpedition basketExpeditionC2Day2 = new CabazExpedition(particularCostumerTwo, day);
        ProductProvided productProvidedOneC2Day2 = new ProductProvided(productOne, 9, 6, p2);
        ProductProvided productProvidedTwoC2Day2 = new ProductProvided(productTwo, 7, 6.5, p2); // De dia 1
        basketExpeditionC2Day2.addProductProvided(productProvidedOneC2Day2);
        basketExpeditionC2Day2.addProductProvided(productProvidedTwoC2Day2);

        // Cabaz de expedição para o cliente C3
        CabazExpedition basketExpeditionC3Day2 = new CabazExpedition(particularCostumerThree, day);
        ProductProvided productProvidedOneC3Day2 = new ProductProvided(productOne, 10, 7.5, p2); // De dia 1
        ProductProvided productProvidedTwoC3Day2 = new ProductProvided(productTwo, 20, 1.5, p1); // De dia 1
        basketExpeditionC3Day2.addProductProvided(productProvidedOneC3Day2);
        basketExpeditionC3Day2.addProductProvided(productProvidedTwoC3Day2);

        // Cabaz de expedição para o cliente E1
        CabazExpedition basketExpeditionE1Day1 = new CabazExpedition(companyCostumerOne, day);
        ProductProvided productProvidedThreeE1Day1 = new ProductProvided(productThree, 9.5, 6.5, p2);
        basketExpeditionE1Day1.addProductProvided(productProvidedThreeE1Day1);

        // Cabaz de expedição para o cliente E2
        CabazExpedition basketExpeditionE2Day1 = new CabazExpedition(companyCostumerTwo, day);
        ProductProvided productProvidedThreeE2Day1 = new ProductProvided(productThree, 7.5, 1.5, p2); // De dia 1
        basketExpeditionE2Day1.addProductProvided(productProvidedThreeE2Day1);

        // Cabaz de expedição para o cliente E3
        CabazExpedition basketExpeditionE3Day2 = new CabazExpedition(companyCostumerThree, day);
        ProductProvided productProvidedOneE3Day2 = new ProductProvided(productOne, 8.5, 2.5, p3); // De dia 1
        ProductProvided productProvidedTwoE3Day2 = new ProductProvided(productTwo, 5, 2, p3); // De dia 1
        basketExpeditionE3Day2.addProductProvided(productProvidedOneE3Day2);
        basketExpeditionE3Day2.addProductProvided(productProvidedTwoE3Day2);

        expectedCabazExpeditions.add(basketExpeditionC2Day2);
        expectedCabazExpeditions.add(basketExpeditionC1Day2);
        expectedCabazExpeditions.add(basketExpeditionC3Day2);
        expectedCabazExpeditions.add(basketExpeditionE3Day2);
        expectedCabazExpeditions.add(basketExpeditionE1Day1);
        expectedCabazExpeditions.add(basketExpeditionE2Day1);

        assertEquals(expectedCabazExpeditions, actualCabazExpeditions);
        }

}

