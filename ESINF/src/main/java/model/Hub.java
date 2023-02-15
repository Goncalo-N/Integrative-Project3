package model;

/**
 * Classe que representa um ponto da rede.
 */
public class Hub implements Comparable<Hub>
{
    /**
     * 'Id' da localização do ponto da rede.
     */
    private String localizationId;

    /**
     * Latitude da localização do ponto da rede.
     */
    private Double latitude;

    /**
     * Longitude da localização do ponto da rede.
     */
    private Double longitude;

    private Company nearestHub;

    /**
     * Construtor para inicializar uma instância do objeto Hub com os atributos 'Id' da localização, latitude,
     * longitude do ponto de rede.
     *
     * @param localizationId 'Id' da localização do ponto da rede.
     * @param latitude       Latitude da localização do ponto da rede.
     * @param longitude      Longitude da localização do ponto da rede.
     */
    public Hub(String localizationId, Double latitude, Double longitude) {
        this.localizationId = localizationId;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    /**
     * Construtor para inicializar uma instância do objeto Hub com os atributos 'Id' da localização do ponto de rede.
     *
     * @param localizationId 'Id' da localização do ponto da rede.
     */
    public Hub(String localizationId) {
        this.localizationId = localizationId;
    }

    /**
     * Método para definir o hub mais próximo.
     *
     * @param nearestHub O hub mais próximo.
     */
    public void defineNearestHub(Company nearestHub) {
        this.nearestHub = nearestHub;
    }

    public Company getNearestHub() {
        return nearestHub;
    }
    /**
     * Método para verificar se este objeto atual é igual a outro objeto do mesmo tipo.
     *
     * @param obj O objeto a ser comparado com este atual.
     * @return true se o outro objeto representa um 'id' da localização do ponto da rede igual a este, caso contrário
     * devolve false.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj == null) {
            return false;
        }

        Hub otherHub = (Hub) obj;

        return (localizationId.equals(otherHub.localizationId));
    }

    /**
     * Calcula o hashcode para este objeto utilizando o 'id' da localização do ponto da rede.
     *
     * @return O valor de hash calculado.
     */
    @Override
    public int hashCode() {
        return localizationId.hashCode();
    }

    @Override
    public int compareTo(Hub otherHub) {
            return localizationId.compareTo(otherHub.localizationId);
    }


    public String getLocalizationId() {
        return localizationId;
    }


    @Override
    public String toString() {
        return localizationId;
    }
}
