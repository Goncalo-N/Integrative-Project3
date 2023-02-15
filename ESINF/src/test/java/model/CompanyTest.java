package model;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Classe para realizar testes à classe Company.
 */
public class CompanyTest {

    /**
     * Testa o método equals com dois objetos Company iguais.
     */
    @Test
    public void equalsTest1() {
        Company companyCostumer1 = new Company("CT14", 38.5243, -8.8926, "E1");
        Company companyCostumer2 = new Company("CT14", 38.5243, -8.8926, "E1");

        boolean result = companyCostumer1.equals(companyCostumer2);

        assertTrue(result);
    }

    /**
     * Testa o método equals com dois objetos Company diferentes.
     */
    @Test
    public void equalsTest2() {
        Company companyCostumer1 = new Company("CT11", 39.3167, -7.4167, "E2");
        Company companyCostumer2 = new Company("CT14", 38.5243, -8.8926, "E1");

        boolean result = companyCostumer1.equals(companyCostumer2);

        assertFalse(result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest1() {
        Company companyCostumer = new Company("CT14", 38.5243, -8.8926, "E1");

        int result = companyCostumer.hashCode();
        int expResult = 2078292;

        assertEquals(expResult, result);
    }

    /**
     * Testa o método hashCode.
     */
    @Test
    public void hashCodeTest2() {
        Company companyCostumer = new Company("CT14", 38.5243, -8.8926, "E1");

        int result = companyCostumer.hashCode();
        int expResult = 1;

        assertNotEquals(expResult, result);
    }
}
