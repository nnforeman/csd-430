package beans;

import java.io.Serializable;

/*
 * Name: Natasha Foreman
 * Course: CSD 430 - Server Side Development
 * Date: 7/26/26
 * Assignment: Modules 5.3, 6.3, and 7 Project Parts 1 and 2
 * Purpose: JavaBean used to store one state database record.
 */
public class StateRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    private int stateId;
    private String stateName;
    private String cityLocation;
    private String travelCategory;
    private String visitType;
    private String reasonEnjoyed;

    public StateRecord() {
    }

    public StateRecord(
            int stateId,
            String stateName,
            String cityLocation,
            String travelCategory,
            String visitType,
            String reasonEnjoyed) {
        this.stateId = stateId;
        this.stateName = stateName;
        this.cityLocation = cityLocation;
        this.travelCategory = travelCategory;
        this.visitType = visitType;
        this.reasonEnjoyed = reasonEnjoyed;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCityLocation() {
        return cityLocation;
    }

    public void setCityLocation(String cityLocation) {
        this.cityLocation = cityLocation;
    }

    public String getTravelCategory() {
        return travelCategory;
    }

    public void setTravelCategory(String travelCategory) {
        this.travelCategory = travelCategory;
    }

    public String getVisitType() {
        return visitType;
    }

    public void setVisitType(String visitType) {
        this.visitType = visitType;
    }

    public String getReasonEnjoyed() {
        return reasonEnjoyed;
    }

    public void setReasonEnjoyed(String reasonEnjoyed) {
        this.reasonEnjoyed = reasonEnjoyed;
    }
}
