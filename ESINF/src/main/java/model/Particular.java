package model;

public class Particular extends Costumer
{
    private String ParticularID;

    public Particular(String localizationID, double latitude, double longitude, String particularID)
    {
        super(localizationID, latitude, longitude,particularID);
        if(CheckIDParticular(particularID) == true){
            this.ParticularID = particularID;
        }
    }
    public Particular(String localizationId, String particularID) {
        super(localizationId, particularID);
        this.ParticularID= particularID;
    }

    public String getParticularID() {
        return ParticularID;
    }

    public void setParticularID(String particularID) {
        ParticularID = particularID;
    }

    private boolean CheckIDParticular(String particularID)
    {
        if(particularID.charAt(0) != ('C')){
            System.out.println("Obrigatoriamnete o codigo tem de começar por C ");
            return false;
        }
        return true;
    }

}
