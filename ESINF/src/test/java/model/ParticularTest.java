package model;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Classe para realizar testes à classe ParticularCostumer.
 */
public class ParticularTest {

    /**
     * Testa o método equals com dois objetos ParticularCostumer iguais.
     */
    @Test
    public void equalsTest1() {
        Particular particularCostumer1 = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumer2 = new Particular("CT1", 40.6389, -8.6553, "C1");

        boolean result = particularCostumer1.equals(particularCostumer2);

        assertTrue(result);
    }

    /**
     * Testa o método equals com dois objetos ParticularCostumer diferentes.
     */
    @Test
    public void equalsTest2() {
        Particular particularCostumer1 = new Particular("CT1", 40.6389, -8.6553, "C1");
        Particular particularCostumer2 = new Particular("CT2", 38.0333, -7.8833, "C2");

        boolean result = particularCostumer1.equals(particularCostumer2);

        assertFalse(result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest1() {
        Particular particularCostumer = new Particular("CT1", 40.6389, -8.6553, "C1");

        int result = particularCostumer.hashCode();
        int expResult = 67040;

        assertEquals(expResult, result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest2() {
        Particular particularCostumer = new Particular("CT1", 40.6389, -8.6553, "C1");

        int result = particularCostumer.hashCode();
        int expResult = 1;

        assertNotEquals(expResult, result);
    }
}
