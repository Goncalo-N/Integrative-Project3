package utils;

import TestHelper.TestMapsHelper;
import model.*;
import org.junit.*;
import org.junit.rules.ExpectedException;
import utils.Exceptions.HubNotFoundException;
import utils.Exceptions.InvalidFileLineException;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Classe para realizar testes à classe FileToCabaz.
 */
public class FileToCabazTest {

    /**
     * Atributo que representa o objeto distributionHubGraph
     */
    private Graph<Hub, Integer> distributionHubGraph;

    /**
     * Map que contem os produtos disponíveis em cabazes.
     */
    private final Map<Integer, Map<Producer, Cabaz>> productsAvailable = new HashMap<>();

    /**
     * Map que contem os produtos requeridos para cabezes.
     */
    private final Map<Integer, Map<Costumer, Cabaz>> productsRequest = new HashMap<>();

    /**
     * Representa o ficheiro com alguma informação de cabazes a ser lido.
     */
    final String SMALL_BASKET_FILE = "grafos/Small/cabazes_small_test.csv";

    /**
     * Atributo para indicar a exceção esperada quando é feito algo que lance uma exceção.
     */
    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();

    /**
     * Antes de correr os testes, construir a rede de distribuição distributionHub.
     */
    @Before
    public void setUp() {
        DistributionHub distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub("grafos/Small/clientes-produtores_small.csv",
                "grafos/Small/distancias_small.csv");
        this.distributionHubGraph = distributionHub.getDistributionHub();
    }

    /**
     * Método para testar quando existe um dia inválido no ficheiro de importação de cabazes.
     */
    @Test
    public void readFileToCabazTest1() {
        exceptionRule.expect(NumberFormatException.class);
        exceptionRule.expectMessage("Verifique o valor do dia na linha 5 do ficheiro, pois encontra-se inválido.");
        String invalid_day_file = "grafos/Small/cabazes_small_test_fail_wrong_day.csv";
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, invalid_day_file);
    }

    /**
     * Método para testar quando uma quantidade está inválido o ficheiro de importação de cabazes.
     */
    @Test
    public void readFileToCabazTest2() {
        exceptionRule.expect(NumberFormatException.class);
        exceptionRule.expectMessage("Foi encontrado um erro na linha 10 do ficheiro. Verifique as quantidades " +
                "existentes para os produtos nessa mesma linha.");
        String invalid_amount_file = "grafos/Small/cabazes_small_test_fail_invalid_amount.csv";
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, invalid_amount_file);
    }

    /**
     * Método para testar quando é indicado um cliente ou produtor no ficheiro de importação de cabazes, e que este não
     * existe na rede de distribuição.
     */
    @Test
    public void readFileToCabazTest3() {
        exceptionRule.expect(HubNotFoundException.class);
        exceptionRule.expectMessage("O cliente ou produtor específicado na linha 20 do ficheiro, não foi " +
                "encontrado na rede de distribuição. Por favor, verifique se está correto.");
        String nonexistent_codidentifier_file = "grafos/Small/cabazes_small_test_fail_nonexistent_codIdentifier.csv";
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, nonexistent_codidentifier_file);
    }

    /**
     * Método para testar quando uma linha de um ficheiro tem um número de colunas diferente ao número de colunas que o
     * cabeçalho desse mesmo ficheiro tem.
     */
    @Test
    public void readFileToCabazTest4() {
        exceptionRule.expect(InvalidFileLineException.class);
        exceptionRule.expectMessage(new InvalidFileLineException(19).getMessage());
        String invalid_line_size_file = "grafos/Small/cabazes_small_test_fail_invalid_line_size.csv";
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, invalid_line_size_file);
    }

    /**
     * Método para testar quando o caminho de um ficheiro passado para o método, não existe.
     */
    @Test
    public void readFileToCabazTest5() {
        exceptionRule.expect(IllegalArgumentException.class);
        exceptionRule.expectMessage("Não existe nenhum ficheiro no caminho indicado.");
        String inexistent_file = "não existe este ficheiro";
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, inexistent_file);
    }

    /**
     * Método que testa quando a rede de distribuição é nula ou não contem vértices.
     */
    @Test
    public void readFileToCabazTest6() {
        DistributionHub nullDistributionHub = new DistributionHub();
        FileToCabaz.readFileToCabaz(nullDistributionHub.getDistributionHub(), productsAvailable, productsRequest, SMALL_BASKET_FILE);
        assertEquals(new HashMap<>(), productsAvailable);
        assertEquals(new HashMap<>(), productsRequest);
    }

    /**
     * Método que verifica se o mapa de produtos disponíveis (em cabaz) é construído corretamente.
     */
    @Test
    public void readFileToCabazTest7() {
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, SMALL_BASKET_FILE);
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

        //System.out.println(expectedMap.values());
        //System.out.println(productsAvailable.values());

        TestMapsHelper.testProductsAvailableOrRequestedMaps(expectedMap, productsAvailable);

    }

    /**
     * Método que verifica se o mapa de produtos pedidos (em cabaz) é construído corretamente.
     */
    @Test
    public void readFileToCabazTest8() {
        FileToCabaz.readFileToCabaz(distributionHubGraph, productsAvailable, productsRequest, SMALL_BASKET_FILE);
        Map<Integer, Map<Costumer, Cabaz>> expectedMap = new HashMap<>();

        Particular particularOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularTwo = new Particular("CT2", 38.0333, -7.8833, "C2");
        Particular particularThree = new Particular("CT3", 41.5333, -8.4167, "C3");
        Company companyOne = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyTwo = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyThree = new Company("CT5", 39.823, -7.4931, "E3");

        Map<Costumer, Cabaz> dayOneMap = new HashMap<>();
        Map<Costumer, Cabaz> dayTwoMap = new HashMap<>();

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        // Apenas produtos com quantidade superior a 0.0 são armazenados como pedido
        // Particular 1
        Cabaz c1CabazDayTwo = new Cabaz();
        c1CabazDayTwo.addProduct(productOne, 4.5);
        c1CabazDayTwo.addProduct(productTwo, 6.0);
        c1CabazDayTwo.addProduct(productThree, 3.5);
        dayTwoMap.put(particularOne, c1CabazDayTwo);

        // Particular  2
        Cabaz c2CabazDayOne = new Cabaz();
        c2CabazDayOne.addProduct(productTwo, 5.5);
        c2CabazDayOne.addProduct(productThree, 4.5);
        dayOneMap.put(particularTwo, c2CabazDayOne);

        Cabaz c2CabazDayTwo = new Cabaz();
        c2CabazDayTwo.addProduct(productOne, 9.0);
        c2CabazDayTwo.addProduct(productTwo, 7.0);
        dayTwoMap.put(particularTwo, c2CabazDayTwo);

        // Particular  3
        Cabaz c3CabazDayTwo = new Cabaz();
        c3CabazDayTwo.addProduct(productOne, 10.0);
        c3CabazDayTwo.addProduct(productTwo, 20.0);
        dayTwoMap.put(particularThree, c3CabazDayTwo);

        // Company  1
        Cabaz e1CabazDayTwo = new Cabaz();
        e1CabazDayTwo.addProduct(productThree, 9.5);
        dayTwoMap.put(companyOne, e1CabazDayTwo);

        // Company  2
        Cabaz e2CabazDayOne = new Cabaz();
        e2CabazDayOne.addProduct(productOne, 9.0);
        e2CabazDayOne.addProduct(productTwo, 6.0);
        e2CabazDayOne.addProduct(productThree, 9.0);
        dayOneMap.put(companyTwo, e2CabazDayOne);

        Cabaz e2CabazDayTwo = new Cabaz();
        e2CabazDayTwo.addProduct(productThree, 7.5);
        dayTwoMap.put(companyTwo, e2CabazDayTwo);

        // Company  3
        Cabaz e3CabazDayTwo = new Cabaz();
        e3CabazDayTwo.addProduct(productOne, 8.5);
        e3CabazDayTwo.addProduct(productTwo, 5.0);
        dayTwoMap.put(companyThree, e3CabazDayTwo);

        expectedMap.put(1, dayOneMap);
        expectedMap.put(2, dayTwoMap);

        //System.out.println(expectedMap.values());
        //System.out.println(productsRequest.values());

        TestMapsHelper.testProductsAvailableOrRequestedMaps(expectedMap, productsRequest);
    }

}
