package model;

import graph.Algorithms;
import graph.MatrixGraph;
import utils.FileToCabaz;
import utils.Graph;
import utils.hubGraph;

import java.util.*;

/**
 * Classe que representa uma rede de distribuição.
 */
public class DistributionHub {
    /**
     * 'Grafo' da rede de distribuição.
     */
    private final Graph<Hub, Integer> distributionHub;
    /**
     * Map que contem os produtos disponíveis em cabazes.
     */
    private final Map<Integer, Map<Producer, Cabaz>> productsAvailable;

    /**
     * Contante que representa os dias máximos em que o cabaz fica disponível antes de ser eliminado.
     */
    public static final int MAX_DAYS_BEFORE_BASKET_EXPIRE = 3;


    /**
     * Map que contem os produtos requeridos para cabezes.
     */
    private final Map<Integer, Map<Costumer, Cabaz>> productsRequest;

    /**
     * Grafo com a distância mínima dos pontos da rede de distribuição.
     */
    private MatrixGraph<Hub, Integer> minDistDistributionNetwork;

    /**
     * Construtor para inicializar uma instância do objeto DistributionHub.
     */
    public DistributionHub() {
        this.distributionHub= new MatrixGraph<>(false);
        this.productsRequest = new HashMap<>();
        this.productsAvailable = new HashMap<>();
        }

    /**
     * Método para devolver um clone do 'Grafo'da distribuição de hubs.
     *
     * @return 'Grafo' da distribuição de hubs.
     */
    public Graph<Hub, Integer> getDistributionHub() {
        return distributionHub.clone();
    }

    public Map<Integer, Map<Producer, Cabaz>> getProductsAvailable() {

        if (this.productsAvailable.isEmpty())
            return null;

        Map<Integer, Map<Producer, Cabaz>> map = new HashMap<>();

        for (Integer day : this.productsAvailable.keySet()) {
            Map<Producer, Cabaz> agriculturalProducerBasketMap = this.productsAvailable.get(day);
            map.put(day, new HashMap<>(agriculturalProducerBasketMap));
        }

        return map;
    }

    /**
     * Método para devolver um clone do mapa com os cabazes colocados (pedidos) pelos clientes.
     *
     * @return Mapa com a informação acerca dos cabazes pedidos pelos clientes.
     */
    public Map<Integer, Map<Costumer, Cabaz>> getProductsRequest() {
        if (this.productsAvailable.isEmpty())
            return null;

        Map<Integer, Map<Costumer, Cabaz>> map = new HashMap<>();

        for (Integer day : this.productsRequest.keySet()) {
            Map<Costumer, Cabaz> costumerBasketMap = this.productsRequest.get(day);
            map.put(day, new HashMap<>(costumerBasketMap));
        }

        return map;
    }


    /**
     * Método para construir a rede de distribuição a partir do ficheiro dos clientes-produtores e do ficheiro das
     * distâncias
     *  @param filePathVertex Caminho do ficheiro dos clientes-produtores.
     * @param filePathEdge   Caminho do ficheiro das distâncias.
     * @return
     */
    public void buildDistributionHub(String filePathVertex, String filePathEdge) {
        fileToVertex(filePathVertex);
        fileToEdge(filePathEdge);
        this.minDistDistributionNetwork = Algorithms.minDistGraph(distributionHub, Integer::compare, Integer::sum);
    }

    /**
     * Método para converter o ficheiro dos clientes-produtores nos vértices do 'grafo' da rede de distribuição.
     *
     * @param filePathVertex Caminho do ficheiro dos clientes-produtores.
     */
    public void fileToVertex(String filePathVertex) {
        hubGraph.readFileToVertex(distributionHub, filePathVertex);
    }

    /**
     * Método para converter o ficheiro das distâncias nas arestas do 'grafo' da rede de distribuição.
     *
     * @param filePathEdge Caminho do ficheiro das distâncias.
     */
    public void fileToEdge(String filePathEdge) {
        hubGraph.readFileToEdge(distributionHub, filePathEdge);
    }

    public void fileToCabaz(String filePathCabaz) {
        FileToCabaz.readFileToCabaz(distributionHub, productsAvailable, productsRequest, filePathCabaz);
    }

    /**
     * Método para determinar a rede que conecte todos os clientes e produtores agrícolas com uma distância total mínima.
     *
     * @return Árvore de extensão mínima.
     */
    public Graph<Hub, Integer> minimumSpanningTree() {
        return Algorithms.kruskal(distributionHub);
    }

    /**
     * Método para verificar se o grafo é conexo.
     *
     * @return se é ou nao conexo .
     */
    public boolean checkConnectivity() {
        return Algorithms.isConnected(distributionHub);
    }

    /**
     * Método para calcular o número mínimo de ligações.
     *
     * @return número mínimo de ligações.
     */
    public int minimumNumberNetwork() {
        return Algorithms.graphDiameter(distributionHub, Integer::compare, Integer::sum, 0);
    }
    /**
     * Método para calcular o número mínimo de ligações se e so se o grafo em questao for conexo.
     *
     * @return número mínimo de ligações.
     */
    public int calculateMinimumNumberNetwork() {
        return checkConnectivity() ? minimumNumberNetwork() : 0;
    }

    /**
     * Método que atualiza o valor da variável do tipo booleano que identifica uma instância da classe Company como hub,
     * alterando para verdadeiro o valor do identificador booleano das N empresas mais próximas de todos os pontos da rede.
     *
     * @param n Numero máximo de hubs.
     */
    //303
    public void defineHubs(int n) {
        boolean flag;
        int j = 0;
        //cria lista com todos os vertices
        List<Hub> vertices = distributionHub.vertices();
        //cria a lista com as companhias e a sua proximidade media a um ponto
         List<Pair<Company, Integer>> selectedHubs = new LinkedList<>();

        //Percorre todos os vertices do grafo
        for (int i = 0; i < vertices.size(); i++) {
            //cria lista para receber tos os caminhos entre vertices
            ArrayList<LinkedList<Hub>> paths = new ArrayList<>();
            //cria a lista para receber o peso dos caminhos
            ArrayList<Integer> dists = new ArrayList<>();

            // variavel passa a verdadeiro se for possivel calcular a distancia entre dois pontos
            flag = Algorithms.shortestPaths(distributionHub, vertices.get(i), Integer::compare, Integer::sum, 0, paths, dists);
            //chama o metodo de averageproximity apenas se for possivel criar um caminho entre dois vertices.
            if (flag) {
                //Calcula a media proximidade entre dois vertices
                Pair<Company, Integer> potencialHub = averageProximity(vertices.get(i), paths, dists);
                boolean existingHub = false;

                //Percorre todos os hubs
                for (Pair<Company, Integer> hub : selectedHubs) {
                    //Verifica se o atual hub é igual ao potencial hub
                    if (hub.equals(potencialHub)) {
                        existingHub = true;

                        //faz a verificação se é necessário mudar o peso do vertice
                        if (hub.getValue() > potencialHub.getValue()) {
                            hub.setValue(potencialHub.getValue());
                        }
                    }
                }

                //se o hub nao existir adiciona-o
                if (!existingHub) {
                    selectedHubs.add(averageProximity(vertices.get(i), paths, dists));
                }
            }
        }
        //ordena os hubs por ordem crescente
        Collections.sort(selectedHubs);

        //percorre o numero de hubs da quantidade de empresas mais proximas
        while (j < n && j < selectedHubs.size()) {
            //seleciona os hubs mais proximos da empresa
            selectedHubs.get(j).getKey().setHub(true);
            j++;
        }
    }
    //303
    private Pair<Company, Integer> averageProximity(Hub vOrig, ArrayList<LinkedList<Hub>> paths, ArrayList<Integer> dists) {
        List<Hub> vertices = distributionHub.vertices();
        Pair<Company, Integer> potencialHub;
        int distance;
        int minDistance = Integer.MAX_VALUE;
        int totalPaths = 0;
        int average;
        Company costumer = null;

        //percorre todos os vertices do grafo
        for (int i = 0; i < vertices.size(); i++) {
            //verifica se o vertice de origem é igual ao vertice final e se o vertice final é uma empresa
            if (vOrig != vertices.get(i) && (vertices.get(i) instanceof Company)) {

                distance = dists.get(distributionHub.key(vertices.get(i)));
                //se a distancia minima for maior que a distancia atualiza a distancia minima
                if (minDistance > distance) {
                    minDistance = distance;
                    totalPaths = paths.get(distributionHub.key(vertices.get(i))).size();
                    costumer = (Company) vertices.get(i);
                }
            }
        }

        //calcula a media
        average = minDistance / totalPaths;
        potencialHub = new Pair<>(costumer, average);

        return potencialHub;
    }

    /**
     * Método para determinar para cada cliente (particular ou empresa) o hub mais próximo.
     */
    //304
    public void determineNearestHub() {
        // chama o metodo da 303 para definir hubs, define todas as empresas como hubs
        defineHubs(totalNumberCompany());

        //percorre todos os vertices do grafo
        for (Hub hub : distributionHub.vertices()) {
            //verifica se o hub é um particular
            if (hub instanceof Costumer) {
                //procura o hub mais proximo
                Company nearestHub = nearestHub(hub);

                //define o hub proximo
                hub.defineNearestHub(nearestHub);
            }
        }
    }

    /**
     * Função para determinar o hub mais próximo de um ponto da rede.
     *
     * @param costumer Um ponto da rede.
     * @return O hub mais próximo.
     */
    private Company nearestHub(Hub costumer) {
        //chama metodo para criar lista de hubs
        List<Company> listHubs = determineListHubs();

        int shorterDistance = Integer.MAX_VALUE;
        Company nearestHub = null;

        //Percorre a lista de hubs inteira
        for (Company hub : listHubs) {
            //verifica se o atributo passado por parametro não é um hub
            if (costumer != hub) {
                LinkedList<Hub> shortPath = new LinkedList<>();
                //chama o shortest path para calcular a distancia entre dois pontos
                Integer distanceToHub = minDistDistributionNetwork.edge(costumer, hub).getWeight();
                //verifica se é preciso atualizar a distancia
                if (shorterDistance > distanceToHub) {
                    shorterDistance = distanceToHub;
                    nearestHub = hub;
                }
            }
        }

        //Retorna o hub mais proximo
        return nearestHub;
    }

    private List<Company> determineListHubs() {
        List<Company> determineListHubs = new ArrayList<>();

        //percorre todos os vertices da distribuição
        for (Hub hub : distributionHub.vertices()) {

            //verifica se o hub é uma companhia
            if (hub instanceof Company) {
                //se for uma companhia passa a verdadeiro
                boolean isHub = ((Company) hub).isHub();

                //se for verdadeiro adiciona a uma lista
                if (isHub) {
                    determineListHubs.add((Company) hub);
                }
            }
        }

        //Retorna a lista de hubs
        return determineListHubs;
    }

    private int totalNumberCompany() {
        int total = 0;

        //vai procurar todos os vertices existentes na distribuição
        for (Hub hub : distributionHub.vertices()) {
            //irá verificar se o hub é uma empresa, se for adiciona +1
            if (hub instanceof Company) {
                total++;
            }
        }

        return total;
    }

    /**
     * Método para construir uma lista com os mapas de cabazes disponibilizados à rede de distruibuição pelos
     * produtores, em que esses mapas pertençam a um dado intervalo de dias.
     *
     * @param maximumDay O dia mais atual.
     * @param minimumDay O dia necessário e anterior ao atual.
     * @return A lista que contem os mapas de cabazes disponibilizados à rede de distruibuição pelos produtores no
     * intervalo de dias fornecido.
     * @throws IllegalArgumentException Caso os dias se encontrem com valores inválidos (o dia mais baixo não pode ser
     *                                  maior que o dia mais alto, e o dia mais baixo não pode ser menor que 1).
     */
    private List<Map<Producer, Cabaz>> getListWithMapsFromAIntervalOfDays(int maximumDay, int minimumDay) {
        if (maximumDay < minimumDay)
            throw new IllegalArgumentException("O dia mais alto não pode ser menor do que o dia mais baixo.");

        if (minimumDay < 1)
            throw new IllegalArgumentException("O dia mais baixo não pode ser menor do que 1.");

        List<Map<Producer, Cabaz>> producerBasketMapList = new ArrayList<>();
        // Para cada dia do intervalo.
        for (int actualDay = maximumDay; actualDay >= minimumDay; actualDay--) {
            producerBasketMapList.add(this.productsAvailable.get(actualDay));
        }

        return producerBasketMapList;
    }

    /**
     * Método para procurar um produtor para fornecer um dado produto. Este produto ao ser fornecido, atualiza a
     * informação dos mapas que contem a informação dos cabazes pedidos e dos cabazes fornecidos.
     *
     * @param product               O produto desejado pelo cliente.
     * @param producerBasketMapList Lista com os mapas de cabazes fornecidos em cada dia por produtores.
     * @param costumerBasket        O cabaz atual requerido pelo cliente.
     * @return O produto fornecido por um dado produtor, ou nulo se nenhum produtor tiver stock deste produto nos seus
     * cabazes.
     */
    private ProductProvided findProducerAndProvideAProduct(
            CabazProduct product,
            List<Map<Producer, Cabaz>> producerBasketMapList,
            Cabaz costumerBasket) {

        double costumerRequestedQuantity = costumerBasket.getProductQuantity(product);
        ProductProvided productProvided = new ProductProvided(product, costumerRequestedQuantity, 0, null);
        boolean productFound = false;

        // Para cada mapa, verificar se existe um produtor que contém o produto desejado.
        Iterator<Map<Producer, Cabaz>> producerBasketMapsIterator = producerBasketMapList.iterator();
        while (producerBasketMapsIterator.hasNext() && !productFound) {
            Map<Producer, Cabaz> producerBasketMap = producerBasketMapsIterator.next();

            // Para cada produtor, verificar se este contém o produto requerido pelo cliente em cabaz e scom stock.
            Iterator<Producer> providersIterator = producerBasketMap.keySet().iterator();
            while (providersIterator.hasNext() && !productFound) {
                Producer provider = providersIterator.next();

                Cabaz producerBasket = producerBasketMap.get(provider);
                double producerAvailableQuantity = producerBasket.getProductQuantity(product);

                // Se o produto tiver o produto em quantidades acima de 0
                if (producerBasket.hasProduct(product) && producerAvailableQuantity > 0.0) {
                    // Diferença de quantidade que o produtor tem com a quantidade requerida pelo cliente.
                    double quantityDifference = producerAvailableQuantity - costumerRequestedQuantity;
                    // A quantidade do produto a ser entregue.
                    double deliveredQuantity = quantityDifference < 0 ? producerAvailableQuantity : costumerRequestedQuantity;
                    // Subtrai a quantidade deste produto agora a receber ao cabaz pedido pelo cliente.
                    costumerBasket.subtractProductQuantity(product, deliveredQuantity);
                    // Subtrai a quantidade fornecida pelo produtor ao cabaz do produtor.
                    producerBasket.subtractProductQuantity(product, deliveredQuantity);
                    productProvided = new ProductProvided(product, costumerRequestedQuantity, deliveredQuantity, provider);
                    productFound = true;
                }
            }
        }

        return productProvided;

    }


    /**
     * Método para popular a lista de expedição de cabazes.
     *
     * @param cabazExpeditionsList A lista de expedição de cabazes a ser populada.
     */
    private void populateExpeditionList(List<CabazExpedition> cabazExpeditionsList, int day, int minimumDay) {
        // Mapa com os cabazes requeridos para o dia day.
        Map<Costumer, Cabaz> costumerBasketMap = this.productsRequest.get(day);
        // Lista com os mapas de cabazes fornecidos em cada dia por produtores, no intervalo de dias dado.
        List<Map<Producer, Cabaz>> producerBasketMapList = getListWithMapsFromAIntervalOfDays(day, minimumDay);

        // Será necessário procurar cada produto que cada cliente deseja.
        for (Costumer costumer : costumerBasketMap.keySet()) {
            Cabaz costumerBasket = costumerBasketMap.get(costumer);
            CabazExpedition cabazExpedition = new CabazExpedition(costumer, day);

            // Para cada produto que se encontra requerido no cabaz do cliente.
            for (CabazProduct product : costumerBasket.getProductsSet()) {
                ProductProvided productProvided = findProducerAndProvideAProduct(product, producerBasketMapList, costumerBasket);

                if (productProvided != null)
                    cabazExpedition.addProductProvided(productProvided);

            }


            cabazExpeditionsList.add(cabazExpedition);

        }

    }

    /**
     * Método para gerar uma lista de expedição para um determinado dia que 
     * forneça os cabazes sem qualquer restrição quanto aos produtores
     *
     * @param day day of the generated expedition list
     */
    public List<CabazExpedition> generateExpeditionListWithoutRestriction(int day) {

        if (productsRequest.get(day) == null || productsAvailable.isEmpty())
            return null;

        // Determina os hubs mais próximos dos clientes
        determineNearestHub();

        List<CabazExpedition> cabazExpeditionsList = new ArrayList<>();

        int minimumDay = Math.max(day - MAX_DAYS_BEFORE_BASKET_EXPIRE, 1);

        populateExpeditionList(cabazExpeditionsList, day, minimumDay);

        return cabazExpeditionsList;
    }

    /**
     * Função para construir um mapa com os cabazes a entregar em cada hub.
     *
     * @param basketExpeditionsList A lista de expedição de cabazes a ser populada.
     * @return Um mapa com os cabazes a entregar em cada hub.
     */
    private Map<Company, Set<CabazExpedition>> getCabazDelivered(List<CabazExpedition> basketExpeditionsList) {
        Map<Company, Set<CabazExpedition>> cabazesDelivered = new HashMap<>();

        if (basketExpeditionsList != null) {
            for (CabazExpedition cabazExpedition : basketExpeditionsList) {
                Company hub = cabazExpedition.getCostumer().getNearestHub();

                Set<CabazExpedition> cabazExpeditionSet = cabazesDelivered.get(hub);
                if (cabazExpeditionSet == null) {
                    cabazExpeditionSet = new HashSet<>();
                    cabazesDelivered.put(hub, cabazExpeditionSet);
                }

                cabazExpeditionSet.add(cabazExpedition);
            }
        }

        return cabazesDelivered;
    }
    /**
     * Função para retornar uma lista dos fornecedores dos produtos fornecidos para a lista de expedição.
     *
     * @param cabazExpeditionsList A lista de expedição de cabazes a ser populada.
     * @return Lista dos fornecedores dos produtos fornecidos para a lista de expedição.
     */
    private List<Producer> getProviderList(List<CabazExpedition> cabazExpeditionsList) {
        List<Producer> providerList = new LinkedList<>();

        if (cabazExpeditionsList != null) {
            for (CabazExpedition cabazExpedition : cabazExpeditionsList) {

                for (Producer producer : cabazExpedition.getProviderList()) {
                    if (!providerList.contains(producer)) {
                        providerList.add(producer);
                    }
                }
            }
        }

        return providerList;
    }
    /**
     * Função para gerar uma rota que minimiza a distância total percorrida entre uma lista de pontos da rede de distribuição.
     *
     * @param waypoints          Lista de pontos da rede de distribuição.
     * @param shortPath          Lista para receber o caminho mais curto entre os pontos da rede de distribuição analisada.
     * @param firstFixedPosition Verdadeiro caso a posição inicial do percurso deva ser fixa, caso contrário falso.
     * @return Distância total entre todos os pontos da rede de distribuição analisada.
     */
    private <V extends Hub> int generateRoute(List<V> waypoints, LinkedList<Hub> shortPath, boolean firstFixedPosition) {
        int betterDistance = Integer.MAX_VALUE;
        LinkedList<Hub> betterShortPath = new LinkedList<>();

        int waypointsSize = waypoints.size();
        for (int i = 0; i < waypointsSize; i++) {
            int currentDistance = 0;

            // Soma as distâncias entre todos os pontos do percurso a ser analisado atualmente
            for (int j = 0; j < waypointsSize - 1; j++) {
                currentDistance += minDistDistributionNetwork.edge(waypoints.get(j), waypoints.get(j + 1)).getWeight();
            }

            // Verifica se a distância do percurso a ser verificado é menor do que a melhor atualmente
            if (betterDistance > currentDistance) {
                betterShortPath.clear();
                betterShortPath.addAll(waypoints);
                betterDistance = currentDistance;
            }

            // Realiza uma rotação no array do percurso para verificar todas as possibilidades
            Collections.rotate(waypoints, 1);

            // Se a primeira posição do percurso for fixa, volta a colocá-la em primeiro
            if (firstFixedPosition) {
                V firstPosition = waypoints.get(1);
                waypoints.remove(firstPosition);
                waypoints.add(0, firstPosition);
            }
        }

        // Adiciona o melhor percurso à lista passada por parâmetro
        shortPath.addAll(betterShortPath);

        return betterDistance;
    }

    /**
     * Função para uma lista de expedição diária gerar o percurso de entrega que minimiza a distância
     * total percorrida.
     *
     * @param cabazExpeditionList A lista de expedição de cabazes a ser populada.
     * @return A rota de entrega.
     */
    public DeliveryRoute generateDeliveryRoute(List<CabazExpedition> cabazExpeditionList) {
        // Cabazes entregues em cada hub
        Map<Company, Set<CabazExpedition>> cabazDelivered = getCabazDelivered(cabazExpeditionList);

        // Lista de produtores
        List<Producer> providerList = getProviderList(cabazExpeditionList);
        Collections.sort(providerList);
        // Lista de hubs
        List<Hub> hubList = new LinkedList<>(cabazDelivered.keySet());
        Collections.sort(hubList);

        // Cria uma lista para receber o caminho mais curto
        LinkedList<Hub> waypoints = new LinkedList<>();

        int totalDistance = 0;
        //Verifica o caminho mais curto entre todos os produtores
        totalDistance += generateRoute(providerList, waypoints, false);

        // Para haver uma conexão entre os produtores e os hub, é colocado o último produtor
        int positionLastProvider = providerList.size() - 1;
        hubList.add(0, waypoints.get(positionLastProvider));
        waypoints.remove(positionLastProvider);

        // Verifica o caminho mais curto entre o último produtor e todos os hub
        totalDistance += generateRoute(hubList, waypoints, true);

        // Retorna uma rota de entrega
        return new DeliveryRoute(waypoints, cabazDelivered, totalDistance, minDistDistributionNetwork);
    }


    /**
     * Método que gera uma lista de expedição para um determinado dia que forneçe apenas os N
     * produtores agrícolas mais próximos do hub de entrega do cliente.
     *
     * @param n     O número de hubs mais próximos.
     * @param day   O dia que se quer analisar.
     * @return      Uma lista de CabazExpedition com informação sobre os produtos solicitados pelos clientes num determinado dia.
     */
    public List<CabazExpedition> generateExpeditionListWithNClosestHubs (int n, int day) {

        if (productsRequest.get(day) == null || productsAvailable.isEmpty() || n <= 0) {
            return null;
        }

        // Determina os hubs mais próximos dos clientes
        determineNearestHub();

        List<CabazExpedition> CabazExpeditionList = new ArrayList<>();

        int minimumDay = Math.max(day - MAX_DAYS_BEFORE_BASKET_EXPIRE, 1);
        populateExpeditionListWithNClosestHubs(CabazExpeditionList, day, n, minimumDay);

        return CabazExpeditionList;
    }

    /**
     * Metodo que preenche uma lista de instâncias CapazExpedition com informações sobre os produtos solicitados pelos
     * clientes em um determinado dia e o Producer mais próximo que possa atender a cada solicitação.
     *
     * @param CabazExpeditionList  A lista a ser preenchida.
     * @param day                   O dia que se quer analisar.
     * @param n                     O número de hubs mais próximos.
     * @param minimumDay            O menor extremo do intervalo de dias.
     */
    private void populateExpeditionListWithNClosestHubs (List<CabazExpedition> CabazExpeditionList, int day, int n, int minimumDay) {
        Map<Costumer, Cabaz> costumerCabazMap = this.productsRequest.get(day);

        Set<Costumer> costumerSet = costumerCabazMap.keySet();

        for (Costumer costumer : costumerSet) {

            //coloca numa lista os mapas com o cliente durante aquele numero de dias com os produtores mais proximos dele
            List<Map<Producer, Cabaz>> producercabazMapList = getListWithMapsFromAIntervalOfDays(costumer, n, day, minimumDay);

            Cabaz costumerCabaz = costumerCabazMap.get(costumer);
            CabazExpedition cabazExpedition = new CabazExpedition(costumer, day);

            // Para cada produto que se encontra requerido no cabaz do cliente.
            for (CabazProduct product : costumerCabaz.getProductsSet()) {
                ProductProvided productProvided = findProducerAndProvideAProduct(product, producercabazMapList, costumerCabaz);

                if (productProvided != null)
                    cabazExpedition.addProductProvided(productProvided);

            }

            CabazExpeditionList.add(cabazExpedition);
        }

    }

    /**
     * Método que calcula os Producers mais próximos de n hubs.
     *
     * @param costumer      O cliente que queremos analisar.
     * @param n             O número de hubs mais próximos.
     * @param maximumDay    O maior extremo do intervalo de dias.
     * @param minimumDay    O menor extremo do intervalo de dias.
     * @return              Uma lista de mapas com os Producers mais próximos de n hubs e os Cabazes respetivos.
     */
    private List<Map<Producer, Cabaz>> getListWithMapsFromAIntervalOfDays (Costumer costumer, int n, int maximumDay, int minimumDay) {
        List<Map<Producer, Cabaz>> producerCabazMapList = new ArrayList<>();

        List<Producer> ProducerList = ProducersClosestToTheHub(costumer, n);

        for (int actualDay = maximumDay; actualDay >= minimumDay; actualDay--) {
            //produtos disponiveis naquele atual dia, coloca num mapa
            Map<Producer, Cabaz> ProducerCabazMap = this.productsAvailable.get(actualDay);
            Map<Producer, Cabaz> resultProducerCabazMap = new HashMap<>();

            //percorre a lista de produtores e coloca num mapa
            for (Producer producer : ProducerList) {
                Cabaz cabaz = ProducerCabazMap.get(producer);

                if (cabaz != null) {

                    //se existir produtor, coloca o produtor e os seus respetivos quantidade
                    resultProducerCabazMap.put(producer, cabaz);
                }
            }

            producerCabazMapList.add(resultProducerCabazMap);
        }

        return producerCabazMapList;
    }

    /**
     * Método para calcular as instâncias de Producer mais próximas a um hub.
     *
     * @param costumer  O cliente que queremos analisar.
     * @param n         O número de hubs mais próximos.
     * @return          Uma lista com os n hubs mais próximos do costumer passado por parametro.
     */
    private List<Producer> ProducersClosestToTheHub (Costumer costumer, int n) {
        Company hub = costumer.getNearestHub();
        List<Hub> vertices = distributionHub.vertices();

        // Cria uma lista para receber todos os caminhos entre dois vértices
        ArrayList<LinkedList<Hub>> paths = new ArrayList<>();
        // Cria uma lista para receber todos os valores ponderados dos caminhos
        ArrayList<Integer> dists = new ArrayList<>();

        // Calcula o caminho mais curto entre um vértice e todos os outros vértices
        Algorithms.shortestPaths(distributionHub, hub, Integer::compare, Integer::sum, 0, paths, dists);

        List<Pair<Producer, Integer>> ProducerDistanceToHub = new ArrayList<>();

        for (Hub hub1 : vertices) {
            // Verifica se o vértice inicial é igual ao vértice final e se o vértice final é um companyCostumer
            if ((hub1 instanceof Producer)) {
                // Atribuir à variável a distância entre dois vértices
                int distance = dists.get(distributionHub.key(hub1));

                ProducerDistanceToHub.add(new Pair<>((Producer) hub1, distance));
            }
        }

        Collections.sort(ProducerDistanceToHub);

        List<Producer> Producers = new ArrayList<>();

        for (int i = 0; i < ProducerDistanceToHub.size(); i++) {
            if (n > i) {
                Producers.add(ProducerDistanceToHub.get(i).getKey());
            }
        }

        return Producers;
    }

}
