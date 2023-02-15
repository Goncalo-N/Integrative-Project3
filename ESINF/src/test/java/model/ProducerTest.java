package model;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Classe para realizar testes à classe AgriculturalProducer.
 */
public class ProducerTest {

    /**
     * Testa o método equals com dois objetos AgriculturalProducer iguais.
     */
    @Test
    public void equalsTest1() {
        Producer agriculturalProducer1 = new Producer("CT17", 40.6667, -7.9167, "P1");
        Producer agriculturalProducer2 = new Producer("CT17", 40.6667, -7.9167, "P1");

        boolean result = agriculturalProducer1.equals(agriculturalProducer2);

        assertTrue(result);
    }

    /**
     * Testa o método equals com dois objetos AgriculturalProducer diferentes.
     */
    @Test
    public void equalsTest2() {
        Producer agriculturalProducer1 = new Producer("CT10", 39.7444, -8.8072, "P3");
        Producer agriculturalProducer2 = new Producer("CT17", 40.6667, -7.9167, "P1");

        boolean result = agriculturalProducer1.equals(agriculturalProducer2);

        assertFalse(result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest1() {
        Producer producer = new Producer("CT10", 39.7444, -8.8072, "P3");

        int result = producer.hashCode();
        int expResult = 2078288;

        assertEquals(expResult, result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest2() {
        Producer agriculturalProducer = new Producer("CT10", 39.7444, -8.8072, "P3");

        int result = agriculturalProducer.hashCode();
        int expResult = 1;

        assertNotEquals(expResult, result);
    }
}
