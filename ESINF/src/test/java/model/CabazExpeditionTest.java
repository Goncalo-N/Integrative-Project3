package model;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Classe para realizar teste aos métodos da classe CabazExpedition
 */
public class CabazExpeditionTest {

    /**
     * Caminho do ficheiro pequeno com as distâncias
     */
    private final String FILE_PATH_DISTANCES_SMALL = "grafos/small/distancias_small.csv";

    /**
     * Caminho do ficheiro pequeno com as informações sobre clientes-produtores
     */
    private final String FILE_PATH_PRODUCER_COSTUMER_SMALL = "grafos/small/clientes-produtores_small.csv";

    /**
     * Caminho do ficheiro pequeno com a informação sobre os cabazes
     */
    private final String FILE_PATH_CABAZES_SMALL = "grafos/small/cabazes_small.csv";

    /**
     * Testa o método addProductProvided da classe CabazExpedition, em que são inseridos objetos do tipo
     * ProductProvided com valores de produto diferentes, sendo então inseridos todos com sucesso.
     */
    @Test
    public void addProductProvidedTest1() {
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        CabazExpedition basketExpedition = new CabazExpedition(particularCostumerOne, 1);

        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        ProductProvided productProvidedOne = new ProductProvided(productOne, 10, 10, p1);
        ProductProvided productProvidedTwo = new ProductProvided(productTwo, 10, 10, p1);
        ProductProvided productProvidedThree = new ProductProvided(productThree, 10, 10, p1);

        assertTrue(basketExpedition.addProductProvided(productProvidedOne));
        assertTrue(basketExpedition.addProductProvided(productProvidedTwo));
        assertTrue(basketExpedition.addProductProvided(productProvidedThree));

    }

    /**
     * Testa o método addProductProvided da classe CabazExpedition, em que são inseridos objetos do tipo
     * ProductProvided com produtos de nomes iguais, sendo que estes não são inseridos e é devolvido o valor false.
     */
    @Test
    public void addProductProvidedTest2() {
        Particular particular1 = new Particular("CT1", 40.6389, -8.6553, "C1");
        CabazExpedition cabazExpedition = new CabazExpedition(particular1, 1);

        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");

        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");

        ProductProvided productProvidedOne = new ProductProvided(productOne, 10, 10, p1);
        ProductProvided productProvidedTwo = new ProductProvided(productTwo, 10, 10, p1);
        ProductProvided productProvidedThree = new ProductProvided(productOne, 10, 10, p1);

        // Insere com sucesso o produtor fornecido 1
        assertTrue(cabazExpedition.addProductProvided(productProvidedOne));
        // Tenta inserir o mesmo objeto
        assertFalse(cabazExpedition.addProductProvided(productProvidedOne));

        // Insere com sucesso o produtor fornecido 2
        assertTrue(cabazExpedition.addProductProvided(productProvidedTwo));

        // Tenta inserir um ProductProvided que tem um produto com o mesmo nome de outro já inserido.
        assertFalse(cabazExpedition.addProductProvided(productProvidedThree));

    }

    /**
     * Método que testa se dois objetos de CabazExpedition tem os mesmos valores nos atributos.
     */
    @Test
    public void equalsTest1() {
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        int day = 1;
        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");
        CabazProduct productThree = new CabazProduct("Prod3");

        ProductProvided productProvidedCostumerOne1 = new ProductProvided(productOne, 10, 10, p1);
        ProductProvided productProvidedCostumerOne2 = new ProductProvided(productTwo, 20, 10, p1);
        ProductProvided productProvidedCostumerOne3 = new ProductProvided(productThree, 15, 15, p2);
        CabazExpedition cabazExpeditionCostumerOne1 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne1);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne2);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne3);

        // Aqui cria-se outro objeto produto com o mesmo valor que productOne, para testar se mesmo assim o produto
        // continua a ser considerado igual.
        ProductProvided productProvidedCostumerTwo1 = new ProductProvided(new CabazProduct("Prod1"), 10, 10, p1);
        ProductProvided productProvidedCostumerTwo2 = new ProductProvided(productTwo, 20, 10, p1);
        ProductProvided productProvidedCostumerTwo3 = new ProductProvided(productThree, 15, 15, p2);
        CabazExpedition cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo2);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo3);

        assertEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

    }

    /**
     * Método que testa se dois objetos de CabazExpedition tem os mesmos valores nos atributos, com exceção do produto.
     */
    @Test
    public void equalsTest2() {
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        int day = 1;
        CabazProduct productOne = new CabazProduct("Prod1");
        CabazProduct productTwo = new CabazProduct("Prod2");

        ProductProvided productProvidedCostumerOne1 = new ProductProvided(productOne, 10, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne1 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne1);

        ProductProvided productProvidedCostumerTwo1 = new ProductProvided(productTwo, 10, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

    }

    /**
     * Método que testa se dois objetos de CabazExpedition tem os mesmos valores nos atributos, com exceção da
     * quantidade requisitada.
     */
    @Test
    public void equalsTest3() {
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        int day = 1;
        CabazProduct productOne = new CabazProduct("Prod1");

        ProductProvided productProvidedCostumerOne1 = new ProductProvided(productOne, 10, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne1 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne1);

        ProductProvided productProvidedCostumerTwo1 = new ProductProvided(productOne, 10.1, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 1 -> 10 vs 10.1
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 9.9, 10, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 2 -> 10 vs 9.9
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 11, 10, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 3 -> 10 vs 11
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 9, 10, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 4 -> 10 vs 9
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

    }

    /**
     * Método que testa se dois objetos de CabazExpedition tem os mesmos valores nos atributos, com exceção da
     * quantidade entregue.
     */
    @Test
    public void equalsTest4() {
        Particular particularOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        int day = 1;
        CabazProduct productOne = new CabazProduct("Prod1");

        ProductProvided productProvidedCostumerOne1 = new ProductProvided(productOne, 10, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne1 = new CabazExpedition(particularOne, day);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne1);

        ProductProvided productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 10.1, p1);
        CabazExpedition cabazExpeditionCostumerOne2 = new CabazExpedition(particularOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 1 -> 10 vs 10.1
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 9.9, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 2 -> 10 vs 9.9
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 11, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 3 -> 10 vs 11
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 9, p1);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 4 -> 10 vs 9
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

    }

    /**
     * Método que testa se dois objetos de CabazExpedition tem os mesmos valores nos atributos, com exceção do
     * produtor.
     */
    @Test
    public void equalsTest5() {
        Particular particularCostumerOne = new Particular("CT1", 40.6389, -8.6553, "C1");
        Producer p1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer p2 = new Producer("CT6", 40.2111, -8.4291, "P2");
        int day = 1;
        CabazProduct productOne = new CabazProduct("Prod1");

        ProductProvided productProvidedCostumerOne1 = new ProductProvided(productOne, 10, 10, p1);
        CabazExpedition cabazExpeditionCostumerOne1 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne1.addProductProvided(productProvidedCostumerOne1);

        ProductProvided productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 10, p2);
        CabazExpedition cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 1 -> produtor 1 vs produtor 2
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

        productProvidedCostumerTwo1 = new ProductProvided(productOne, 10, 10, null);
        cabazExpeditionCostumerOne2 = new CabazExpedition(particularCostumerOne, day);
        cabazExpeditionCostumerOne2.addProductProvided(productProvidedCostumerTwo1);

        // Teste 2 -> produtor 1 vs null
        assertNotEquals(cabazExpeditionCostumerOne1, cabazExpeditionCostumerOne2);

    }

    /**
     * Método que testa o método que devolve a localização de entrega de um dado cabaz em expedição.
     */
    @Test
    public void getDeliveryLocationTest() {
        DistributionHub distributionHub = new DistributionHub();
        distributionHub.buildDistributionHub(FILE_PATH_PRODUCER_COSTUMER_SMALL, FILE_PATH_DISTANCES_SMALL);
        distributionHub.fileToCabaz(FILE_PATH_CABAZES_SMALL);

        int day = 1;
        List<CabazExpedition> cabazExpeditions = distributionHub.generateExpeditionListWithoutRestriction(day);

        CabazExpedition cabazExpeditionOne = cabazExpeditions.get(0);
        Hub deliveryLocationCabazExpeditionOne = cabazExpeditionOne.getDeliveryLocation();
        Company companyCostumer1 = new Company("CT14", 38.5243, -8.8926, "E1");
        assertEquals(companyCostumer1, deliveryLocationCabazExpeditionOne);

        CabazExpedition cabazExpeditionTwo = cabazExpeditions.get(1);
        Hub deliveryLocationCabazExpeditionTwo = cabazExpeditionTwo.getDeliveryLocation();
        Company companyCostumer2 = new Company("CT9", 40.5364, -7.2683, "E4");
        assertEquals(companyCostumer2, deliveryLocationCabazExpeditionTwo);

    }

}
