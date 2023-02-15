package model;

public class Company extends Costumer
{
    private String CompanyID;

    private boolean hub;


    public Company(String localizationID, double latitude, double longitude, String companyID) {
        super(localizationID, latitude, longitude,companyID);
        if(CheckIDCompany(companyID) == true){
            this.CompanyID = companyID;
            this.hub = false;
        }
    }
    public Company(String localizationId, String companyID) {
        super(localizationId, companyID);
        if(CheckIDCompany(companyID) == true) {
            this.CompanyID = companyID;
        }
    }
    private boolean CheckIDCompany(String companyID){
        if(companyID.charAt(0) != ('E')){
            System.out.println("Obrigatoriamente o codigo tem de comecar por E");
            return false;
        }
        return true;
    }

    public String getCompanyID() {
        return CompanyID;
    }

    public void setCompanyID(String companyID) {
        CompanyID = companyID;
    }

    public void setHub(boolean hub) {
        this.hub = hub;
    }

    public boolean isHub() {
        return hub;
    }

}
