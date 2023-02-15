package utils;

import java.util.Objects;

public class Distance implements Comparable<Distance> {
    private String localizationID1;
    private String localizationID2;
    private int distance;

    public Distance(String localizationID1, String localizationID2, int distance) {
        this.distance = distance;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getLocalizationID1() {
        return localizationID1;
    }

    public void setLocalizationID1(String localizationID1) {
        this.localizationID1 = localizationID1;
    }

    public String getLocalizationID2() {
        return localizationID2;
    }
    public void setLocalizationID2(String localizationID2) {
        this.localizationID2 = localizationID2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Distance distance1 = (Distance) o;
        return distance == distance1.distance;
    }

    @Override
    public int hashCode() {
        return Objects.hash(distance);
    }

    @Override
    public String toString() {
        return "Distance{" +
                "distance=" + distance +
                '}';
    }

    @Override
    public int compareTo(Distance o) {
        return 0;
    }
}