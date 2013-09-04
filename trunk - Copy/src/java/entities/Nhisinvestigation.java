package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Nhisinvestigation generated by hbm2java
 */
public class Nhisinvestigation  implements java.io.Serializable {


     private Integer detailedInvId;
     private String code;
     private String name;
     private Double rate;
     private String lowBound;
     private String highBound;
     private int labTypeId;
     private int typeOfTestId;
     private Integer groupedUnderId;
     private String units;
     private String interpretation;
     private String defaultValue;
     private String rangeFrom;
     private String rangeUpTo;
     private String comments;
     private String reportCollDays;
     private Date reportCollTime;
     private boolean resultOptions;
     private String refRangeType;

    public Nhisinvestigation() {
    }

	
    public Nhisinvestigation(String code, String name, int labTypeId, int typeOfTestId, boolean resultOptions, String refRangeType) {
        this.code = code;
        this.name = name;
        this.labTypeId = labTypeId;
        this.typeOfTestId = typeOfTestId;
        this.resultOptions = resultOptions;
        this.refRangeType = refRangeType;
    }
    public Nhisinvestigation(String code, String name, Double rate, String lowBound, String highBound, int labTypeId, int typeOfTestId, Integer groupedUnderId, String units, String interpretation, String defaultValue, String rangeFrom, String rangeUpTo, String comments, String reportCollDays, Date reportCollTime, boolean resultOptions, String refRangeType) {
       this.code = code;
       this.name = name;
       this.rate = rate;
       this.lowBound = lowBound;
       this.highBound = highBound;
       this.labTypeId = labTypeId;
       this.typeOfTestId = typeOfTestId;
       this.groupedUnderId = groupedUnderId;
       this.units = units;
       this.interpretation = interpretation;
       this.defaultValue = defaultValue;
       this.rangeFrom = rangeFrom;
       this.rangeUpTo = rangeUpTo;
       this.comments = comments;
       this.reportCollDays = reportCollDays;
       this.reportCollTime = reportCollTime;
       this.resultOptions = resultOptions;
       this.refRangeType = refRangeType;
    }
   
    public Integer getDetailedInvId() {
        return this.detailedInvId;
    }
    
    public void setDetailedInvId(Integer detailedInvId) {
        this.detailedInvId = detailedInvId;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Double getRate() {
        return this.rate;
    }
    
    public void setRate(Double rate) {
        this.rate = rate;
    }
    public String getLowBound() {
        return this.lowBound;
    }
    
    public void setLowBound(String lowBound) {
        this.lowBound = lowBound;
    }
    public String getHighBound() {
        return this.highBound;
    }
    
    public void setHighBound(String highBound) {
        this.highBound = highBound;
    }
    public int getLabTypeId() {
        return this.labTypeId;
    }
    
    public void setLabTypeId(int labTypeId) {
        this.labTypeId = labTypeId;
    }
    public int getTypeOfTestId() {
        return this.typeOfTestId;
    }
    
    public void setTypeOfTestId(int typeOfTestId) {
        this.typeOfTestId = typeOfTestId;
    }
    public Integer getGroupedUnderId() {
        return this.groupedUnderId;
    }
    
    public void setGroupedUnderId(Integer groupedUnderId) {
        this.groupedUnderId = groupedUnderId;
    }
    public String getUnits() {
        return this.units;
    }
    
    public void setUnits(String units) {
        this.units = units;
    }
    public String getInterpretation() {
        return this.interpretation;
    }
    
    public void setInterpretation(String interpretation) {
        this.interpretation = interpretation;
    }
    public String getDefaultValue() {
        return this.defaultValue;
    }
    
    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }
    public String getRangeFrom() {
        return this.rangeFrom;
    }
    
    public void setRangeFrom(String rangeFrom) {
        this.rangeFrom = rangeFrom;
    }
    public String getRangeUpTo() {
        return this.rangeUpTo;
    }
    
    public void setRangeUpTo(String rangeUpTo) {
        this.rangeUpTo = rangeUpTo;
    }
    public String getComments() {
        return this.comments;
    }
    
    public void setComments(String comments) {
        this.comments = comments;
    }
    public String getReportCollDays() {
        return this.reportCollDays;
    }
    
    public void setReportCollDays(String reportCollDays) {
        this.reportCollDays = reportCollDays;
    }
    public Date getReportCollTime() {
        return this.reportCollTime;
    }
    
    public void setReportCollTime(Date reportCollTime) {
        this.reportCollTime = reportCollTime;
    }
    public boolean isResultOptions() {
        return this.resultOptions;
    }
    
    public void setResultOptions(boolean resultOptions) {
        this.resultOptions = resultOptions;
    }
    public String getRefRangeType() {
        return this.refRangeType;
    }
    
    public void setRefRangeType(String refRangeType) {
        this.refRangeType = refRangeType;
    }




}

