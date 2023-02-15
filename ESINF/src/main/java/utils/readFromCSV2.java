package utils;

import model.*;

import java.util.ArrayList;
import  java.io.BufferedReader ;
import  java.io.IOException ;
import  java.nio.file.Files ;
import  java.nio.file.Path ;
import  java.nio.file.Paths ;
import java.util.List;
import java.util.Map;

public class readFromCSV2
{
    public static ArrayList<Particular> readParticularsFromCSV(String fileName) {
        ArrayList<Particular> particulars = new ArrayList<>();

        Path pathToFile = Paths.get(fileName);

        try (BufferedReader br = Files.newBufferedReader(pathToFile)) {
            String headerLine = br.readLine();
            // read the first line from the text file
            String line = br.readLine();
            // loop until all lines are read
            String attributes[];
            while (line != null) {
                attributes = line.split(",");

                if(attributes[3].charAt(0) == ('C')){
                    Particular particular = createParticular(attributes);
                    particulars.add(particular);
                }

                line = br.readLine();
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return particulars;
    }

    public static ArrayList<Producer> readProducersFromCSV(String fileName) {

        ArrayList<Producer> producers = new ArrayList<>();

        Path pathToFile = Paths.get(fileName);

        try (BufferedReader br = Files.newBufferedReader(pathToFile)) {
            String headerLine = br.readLine();
            // read the first line from the text file
            String line = br.readLine();
            // loop until all lines are read
            String attributes[];
            while (line != null) {
                attributes = line.split(",");

                if(attributes[3].charAt(0) == ('P')){
                    Producer producer = createProducer(attributes);
                    producers.add(producer);
                }

                line = br.readLine();
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return producers;
    }

    public static ArrayList<Company> readCompaniesFromCSV(String fileName) {

        ArrayList<Company> companies = new ArrayList<>();

        Path pathToFile = Paths.get(fileName);

        try (BufferedReader br = Files.newBufferedReader(pathToFile)) {
            String headerLine = br.readLine();
            // read the first line from the text file
            String line = br.readLine();
            // loop until all lines are read
            String attributes[];
            while (line != null) {
                attributes = line.split(",");

                if(attributes[3].charAt(0) == ('E')){
                    Company company = createCompany(attributes);
                    companies.add(company);
                }

                line = br.readLine();
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return companies;
    }
    public static ArrayList<Distance> readDistancesFromCSV(String fileName) {

        ArrayList<Distance> distances = new ArrayList<>();

        Path pathToFile = Paths.get(fileName);

        try (BufferedReader br = Files.newBufferedReader(pathToFile)) {
            String headerLine = br.readLine();
            // read the first line from the text file
            String line = br.readLine();
            // loop until all lines are read
            String attributes[];
            while (line != null) {
                attributes = line.split(",");

                if(attributes[3].charAt(0) == ('E')){
                    Distance distance1  = createDistance(attributes);
                    distances.add(distance1);
                }

                line = br.readLine();
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return distances;
    }

    private static Particular createParticular(String[] ALParticular) {

        String localizationID = ALParticular[0];
        double latitude =  Double.parseDouble(ALParticular[1]);
        double longitude = Double.parseDouble(ALParticular[2]);
        String particularID = ALParticular[3];

        return new Particular(localizationID,latitude, longitude, particularID);
    }
    private static Producer createProducer(String[] ALProducer) {

        String localizationID = ALProducer[0];
        double latitude =  Double.parseDouble(ALProducer[1]);
        double longitude = Double.parseDouble(ALProducer[2]);
        String producerID = ALProducer[3];

        return new Producer(localizationID,latitude, longitude, producerID);
    }
    private static Company createCompany(String[] ALCompany) {

        String localizationID = ALCompany[0];
        double latitude =  Double.parseDouble(ALCompany[1]);
        double longitude = Double.parseDouble(ALCompany[2]);
        String companyID = ALCompany[3];

        return new Company(localizationID,latitude, longitude, companyID);
    }

    private static Distance createDistance(String[] ALDistance) {

        String localizationID1 = ALDistance[0];
        String localizationID2 = ALDistance[1];
        int distance = Integer.parseInt(ALDistance[2]);

        return new Distance(localizationID1,localizationID2, distance);
    }

}
