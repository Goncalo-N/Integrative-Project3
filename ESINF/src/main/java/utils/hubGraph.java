package utils;

import model.Company;
import model.Hub;
import model.Particular;
import model.Producer;
import java.io.FileNotFoundException;
import java.util.List;

/**
 * Classe responsável por converter os ficheiros de clientes-produtores e distâncias num grafo.
 */
public class hubGraph
{
    /**
     * Método para converter o ficheiro dos clientes-produtores nos vértices do 'grafo' da rede de distribuição.
     *
     * @param distributionHub 'Grafo' da rede de distribuição.
     * @param filePathVertex      Caminho do ficheiro dos clientes-produtores.
     */

    public static void readFileToVertex(Graph<Hub, Integer> distributionHub, String filePathVertex) {
        try {
            List<String[]> contentFile = new readFromCSV().readFile(filePathVertex,true);

            for (String[] columns : contentFile) {
                if (columns.length == IndexProducerCustomer.TOTAL_COLUMNS.getIndex()) {

                    Hub hub = createHub(columns[IndexProducerCustomer.LOCALIZATION_ID.getIndex()],
                            columns[IndexProducerCustomer.LATITUDE.getIndex()],
                            columns[IndexProducerCustomer.LONGITUDE.getIndex()],
                            columns[IndexProducerCustomer.NAME.getIndex()]);

                    if (hub!= null) {
                        distributionHub.addVertex(hub);
                    }
                }
            }

        } catch (FileNotFoundException e) {
            throw new IllegalArgumentException("Não existe nenhum ficheiro no caminho indicado.");
        }
    }

    /**
     * Método para converter o ficheiro das distâncias nas arestas do 'grafo' da rede de distribuição.
     *
     * @param distributionHub 'Grafo' da rede de distribuição.
     * @param filePathEdge        Caminho do ficheiro das distâncias.
     */
    public static void readFileToEdge(Graph<Hub, Integer> distributionHub, String filePathEdge) {
        try {
            List<String[]> contentFile = new readFromCSV().readFile(filePathEdge,true);

            for (String[] columns : contentFile) {
                if (columns.length == IndexDistances.TOTAL_COLUMNS.getIndex()) {

                    Hub hub1 = new Hub(columns[IndexDistances.LOCALIZATION_ID_1.getIndex()]);
                    Hub hub2 = new Hub(columns[IndexDistances.LOCALIZATION_ID_2.getIndex()]);
                    Integer distance = parseStringToInteger(columns[IndexDistances.DISTANCES.getIndex()]);

                    distributionHub.addEdge(hub1, hub2, distance);
                }
            }

        } catch (FileNotFoundException e) {
            throw new IllegalArgumentException("Não existe nenhum ficheiro no caminho indicado.");
        }
    }

    /**
     * Função para criar um objeto Locationdo tipo produtor agrícola,
     * cliente particular ou empresarial dependendo
     * do código passado por parâmetro.
     *
     * @param localizationId 'Id' da localização do ponto da rede.
     * @param latitude       Latitude da localização do ponto da rede.
     * @param longitude      Longitude da localização do ponto da rede.
     * @param code           Código do produtor ou do cliente.
     * @return Um ponto da rede ou null.
     */
    private static Hub createHub(String localizationId, String latitude, String longitude, String code) {
        char codeInitialCharacter = code.charAt(0);

        if (codeInitialCharacter == Code.COSTUMER_PARTICULAR.getCharacter()) {
            return new Particular(localizationId, parseStringToDouble(latitude), parseStringToDouble(longitude), code);

        } else if (codeInitialCharacter == Code.COSTUMER_COMPANY.getCharacter()) {
            return new Company(localizationId, parseStringToDouble(latitude), parseStringToDouble(longitude), code);

        } else if (codeInitialCharacter == Code.PRODUCER.getCharacter()) {
            return new Producer(localizationId, parseStringToDouble(latitude), parseStringToDouble(longitude), code);
        }
        return null;
    }

    /**
     * Função para converter uma 'String' num número inteiro. Caso não seja possível é retornado o valor 0.
     *
     * @param number String a converter.
     * @return Inteiro.
     */
    private static Integer parseStringToInteger(String number) {
        try {
            return Integer.parseInt(number);
        } catch (NumberFormatException n) {
            return 0;
        }
    }

    /**
     * Função para converter uma 'String' num número double. Caso não seja possível é retornado o valor 0.
     * @param number String a converter.
     * @return Double.
     */
    private static Double parseStringToDouble(String number) {
        try {
            return Double.parseDouble(number);
        } catch (NumberFormatException n) {
            return 0D;
        }
    }
}
