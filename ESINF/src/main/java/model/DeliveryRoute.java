package model;

import graph.MatrixGraph;

import java.util.*;

/**
 * Classe que representa uma rota de entrega.
 */
public class DeliveryRoute {

    /**
     * Lista com os pontos de passagem do percurso (produtores e hubs).
     */
    private LinkedList<Hub> waypoints;

    /**
     * Mapa que contêm os cabazes entregues em cada hub.
     */
    private Map<Company, Set<CabazExpedition>> cabazesDelivered;

    /**
     * Distância total entre todos os pontos do percurso.
     */
    private int totalDistance;

    /**
     * Grafo com a distância mínima dos pontos de passagem do percurso.
     */
    private MatrixGraph<Hub, Integer> minDistDeliveryRoute;

    /**
     * Construtor para inicializar uma nova instância desta classe com os atributos waypoints, basketsDelivered,
     * unsatisfiedProducts e totalDistance.
     *
     * @param waypoints            Lista com os pontos de passagem do percurso (produtores e hubs).
     * @param cabazesDelivered     Mapa que contêm os cabazes entregues em cada hub.
     * @param totalDistance        Distância total entre todos os pontos do percurso.
     * @param minDistDeliveryRoute Grafo com a distância mínima dos pontos de passagem do percurso.
     */
    public DeliveryRoute(LinkedList<Hub> waypoints, Map<Company, Set<CabazExpedition>> cabazesDelivered, int totalDistance, MatrixGraph<Hub, Integer> minDistDeliveryRoute) {
        this.waypoints = waypoints;
        this.cabazesDelivered = cabazesDelivered;
        this.totalDistance = totalDistance;
        this.minDistDeliveryRoute = minDistDeliveryRoute;
    }

    /**
     * Construtor para inicializar uma nova instância desta classe com os atributos waypoints e totalDistance.
     *
     * @param waypoints     Lista com os pontos de passagem do percurso (produtores e hubs).
     * @param totalDistance Distância total entre todos os pontos do percurso.
     */
    public DeliveryRoute(LinkedList<Hub> waypoints, int totalDistance) {
        this.waypoints = waypoints;
        this.totalDistance = totalDistance;
    }
    @Override
    public String toString() {
        if(cabazesDelivered!=null && minDistDeliveryRoute != null)
        return "DeliveryRoute{" +
                "waypoints=" + waypoints +
                ", cabazesDelivered=" + cabazesDelivered.keySet().toString() +
                ", totalDistance=" + totalDistance +
                ", minDistDeliveryRoute=\n" + minDistDeliveryRoute +
                '}';

        return "DeliveryRoute{" +
                "waypoints=" + waypoints +
                ", cabazesDelivered=0 totalDistance=" + totalDistance +
                ", minDistDeliveryRoute=nonexistent due to no cabazes delivered";
    }

    /**
     * Método para verificar se este objeto atual é igual a outro objeto do mesmo tipo.
     *
     * @param obj O objeto a ser comparado com este atual.
     * @return true se o outro objeto representa uma rota de entrega igual a esta, caso contrário devolve false.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj == null) {
            return false;
        }

        DeliveryRoute otherDeliveryRoute = (DeliveryRoute) obj;

        return (waypoints.equals(otherDeliveryRoute.waypoints) &&
                totalDistance == otherDeliveryRoute.totalDistance);
    }
}
