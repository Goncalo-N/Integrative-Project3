package utils;

import model.*;
import utils.Exceptions.HubNotFoundException;
import utils.Exceptions.InvalidFileLineException;

import java.io.FileNotFoundException;
import java.util.*;

/**
 * Classe responsável por converter os ficheiros de cabazes em mapas com a informação presente no ficheiro.
 */
public class FileToCabaz {

    /**
     * Método responsável por ler e armazenar os dados presentes no ficheiro em mapas de informação.
     *
     * @param distributionHub 'Grafo' da rede de distribuição.
     * @param productsAvailable   Mapa que armazena cabazes de produtos disponíveis para serem requeridos por clientes.
     * @param productsRequest     Mapa que armazena cabazes de produtos requeridos por clientes.
     * @param filePath            Caminho do ficheiro com a informação acerca dos cabazes.
     */
    public static void readFileToCabaz(Graph<Hub, Integer> distributionHub,
                                        Map<Integer, Map<Producer, Cabaz>> productsAvailable,
                                        Map<Integer, Map<Costumer, Cabaz>> productsRequest,
                                        String filePath) {

        if (distributionHub == null || distributionHub.numVertices() == 0)
            return;

        try {

            List<String[]> contentFile = new readFromCSV().readFile(filePath, false);
            String[] header = contentFile.get(0);
            contentFile.remove(0);
            // Cria os objetos Produto com os nomes dos produtos fornecidos no cabeçaho
            Map<Integer, CabazProduct> productMap = createProductsByHeader(header);

            int line = 2;
            for (String[] columns : contentFile) {
                // Se as linhas que sucedem o cabeçalho não tiver o mesmo número de colunas, existe erro.
                if (columns.length != header.length) {
                    throw new InvalidFileLineException(line);
                }

                // Identificador
                String clientOrProductor = columns[IndexColumnsFileBaskets.COSTUMERS_PRODUCERS.getValue()];
                int day = convertDayStringInInt(columns[IndexColumnsFileBaskets.DAY.getValue()], line);
                Cabaz cabaz = createCabaz(columns, productMap, line);
                Hub hub = findHub(distributionHub, clientOrProductor, line);

                // Apenas adiciona o cliente ou o produtor se o cabaz para este dia tiver produtos.
                if (cabaz.getProductsSet() != null) {
                    // Verifica que é produtor ou cliente
                    if (clientOrProductor.toUpperCase().charAt(0) == Code.PRODUCER.getCharacter()) {
                        if (productsAvailable.get(day) == null)
                            productsAvailable.put(day, new HashMap<>());
                        //System.out.println("Hubs:"+hub+"\n"+cabaz.toString());
                        productsAvailable.get(day).put((Producer) hub, cabaz);
                    } else {
                        if (productsRequest.get(day) == null)
                            productsRequest.put(day, new HashMap<>());
                        //System.out.println("Hubs:"+hub+"\n"+cabaz.toString());
                        productsRequest.get(day).put((Costumer) hub, cabaz);
                    }
                }

                line++;
            }
            System.out.println("Leitura de cabaz finalizada");

        } catch (FileNotFoundException ex) {
            throw new IllegalArgumentException("Não existe nenhum ficheiro no caminho indicado.");
        }

    }

    /**
     * Método para converter um dia representado por uma String, num dia representado pelo tipo de dados int.
     *
     * @param day  A String que representa um determinado dia.
     * @param line Linha do ficheiro onde este valor se encontra.
     * @return O valor do dia representado pelo tipo de dados int.
     * @throws NumberFormatException Quando não é possível converter o valor em int.
     */
    private static int convertDayStringInInt(String day, int line) {
        int dayValue = 0;

        try {
            dayValue = Integer.parseInt(day);
        } catch (NumberFormatException ex) {
            throw new NumberFormatException("Verifique o valor do dia na linha " + line + " do ficheiro, pois " +
                    "encontra-se inválido.");
        }

        return dayValue;
    }

    /**
     * Método para converter uma quantidade representada por uma String numa quantidade do tipo double.
     *
     * @param columnValue A quantidade em String a ser convertido para double.
     * @param line        Linha do ficheiro em que este valor se encontra.
     * @return A quantidade representada no tipo double.
     * @throws NumberFormatException Quando não é possível converter o valor em double.
     */
    private static double convertAmountStringInDouble(String columnValue, int line) {
        double value = 0.0;

        try {
            value = Double.parseDouble(columnValue);
        } catch (NumberFormatException ex) {
            throw new NumberFormatException("Foi encontrado um erro na linha " + line + " do ficheiro. Verifique as " +
                    "quantidades existentes para os produtos nessa mesma linha.");
        }

        return value;
    }

    /**
     * Método para encontrar e devolver o Hub de um dado código identificador de um produto ou de um cliente.
     *
     * @param distributionHub 'Grafo' da rede de distribuição.
     * @param codeIdentifier      O código identificador de um produtor ou de um cliente.
     * @param line                Linha do ficheiro a ser tratada no momento.
     * @return Devolve o Hub correspondente a um código identificador de um produto ou de um cliente, ou null
     * no caso de não ser encontrado nenhum Hub a que pertence ao identificador.
     */
    private static Hub findHub(Graph<Hub, Integer> distributionHub,
                                                 String codeIdentifier, int line) {

        for (Hub hub : distributionHub.vertices()) {
            if (hub instanceof Producer producer) {
                if (producer.getProducerID().equals(codeIdentifier))
                    return producer;
            } else if (hub instanceof Costumer costumer) {
                if (costumer.getCostumerIdentifier().equals(codeIdentifier))
                    return costumer;
            }
        }

        throw new HubNotFoundException("O cliente ou produtor específicado na linha " + line + " do ficheiro, " +
                "não foi encontrado na rede de distribuição. Por favor, verifique se está correto.");
    }

    /**
     * Método para criar produtos a partir de um dado array com o cabeçalho do ficheiro, onde é possível encontrar os
     * nomes dos produtos necessários.
     *
     * @param header Array com os parâmetros do cabeçalho do ficheiro.
     * @return Devolve um mapa com a chave que indica o índice onde esse produto se encontra, e como valor o Produto
     * criado.
     */
    private static Map<Integer, CabazProduct> createProductsByHeader(String[] header) {
        Map<Integer, CabazProduct> productMap = new HashMap<>();

        for (int pos = IndexColumnsFileBaskets.START_PRODUCT_INDEX.getValue(); pos < header.length; pos++) {
            productMap.put(pos, new CabazProduct(header[pos]));
        }

        return productMap;
    }

    /**
     * Método para criar um cabaz e adicionar um conjunto de produtos a esse mesmo cabaz.
     *
     * @param data       Contém a informação sobre a quantidade de cada produto.
     * @param productMap Um mapa que contem os produtos onde a chave para os encontrar representa o índice em que se
     *                   encontra a quantidade no array.
     * @param line       Representa a linha do ficheiro de onde provêm estes dados das quantidades.
     * @return Devolve um cabaz com os produtos e respetivas quantidades adicionadas.
     */
    private static Cabaz createCabaz(String[] data, Map<Integer, CabazProduct> productMap, int line) {
        Cabaz cabaz = new Cabaz();

        for (int pos = IndexColumnsFileBaskets.START_PRODUCT_INDEX.getValue(); pos < data.length; pos++) {
            double productAmount = convertAmountStringInDouble(data[pos], line);
            if (productAmount > 0.0)
                cabaz.addProduct(productMap.get(pos), productAmount);

        }

        return cabaz;
    }

}
