package TestHelper;

import model.Cabaz;

import java.util.Map;

import static org.junit.Assert.assertEquals;

/**
 * Classe para criar métodos que validam mapas de um dado padrão e tipos de dados.
 */
public class TestMapsHelper {

    /**
     * Método para verificar se dois mapas com o formato Map<Integer, Map<V, Basket>>, têm a mesma informação.
     *
     * @param expectedMap Valores expectáveis que o mapa deve ter.
     * @param actualMap   Os verdadeiros valores que o mapa tem.
     * @param <V>         Um dado tipo que será Costumer ou AgriculturalProducer.
     */
    public static <V> void testProductsAvailableOrRequestedMaps(Map<Integer, Map<V, Cabaz>> expectedMap, Map<Integer, Map<V, Cabaz>> actualMap) {
        // Verifica se ambos os mapas contem os mesmos dias como chave
        assertEquals(expectedMap.keySet(), actualMap.keySet());
        for (Integer i : actualMap.keySet()) {
            // Verifica se ambos os mapas num dado dia contem os mesmos valores como chave
            assertEquals(expectedMap.get(i).keySet(), actualMap.get(i).keySet());
            for (V entity : actualMap.get(i).keySet()) {
                Cabaz cabaz1 = expectedMap.get(i).get(entity);
                Cabaz cabaz2 = actualMap.get(i).get(entity);
                // Verifica se os cabazes contêm a mesma informação
                assertEquals(cabaz1, cabaz2);
            }
        }
    }

}