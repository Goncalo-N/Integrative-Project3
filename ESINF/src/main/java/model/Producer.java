package model;

public class Producer extends Hub
{
    private String ProducerID;


    public Producer(String localizationId, double latitude, double longitude, String producerCode) {
        super(localizationId, latitude, longitude);

        CheckIDProducer(producerCode);
        this.ProducerID = producerCode;
    }



    private boolean CheckIDProducer(String producerID){
        if(producerID.charAt(0) != ('P')){
            System.out.println("Obrigatoriamnete o codigo tem de começar por P ");
            return false;
        }
        return true;
    }

    public String getProducerID() {
        return ProducerID;
    }

    public void setProducerID(String producerID) {
        ProducerID = producerID;
    }

}
