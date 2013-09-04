package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Investigation generated by hbm2java
 */
public class Investigation  implements java.io.Serializable {


     private Integer detailedInvId;
     private String code;
     private String name;
     private Double rate;
     private double nhisRate;
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
     private int specimenId;
     private boolean antibiotic;
     private Integer orderNum;
     private boolean isSubheading;
     private int active;

    public Investigation() {
    }

	
    public Investigation(String code, String name, double nhisRate, int labTypeId, int typeOfTestId, boolean resultOptions, String refRangeType, int specimenId, boolean antibiotic, boolean isSubheading, int active) {
        this.code = code;
        this.name = name;
        this.nhisRate = nhisRate;
        this.labTypeId = labTypeId;
        this.typeOfTestId = typeOfTestId;
        this.resultOptions = resultOptions;
        this.refRangeType = refRangeType;
        this.specimenId = specimenId;
        this.antibiotic = antibiotic;
        this.isSubheading = isSubheading;
        this.active = active;
    }
    public Investigation(String code, String name, Double rate, double nhisRate, String lowBound, String highBound, int labTypeId, int typeOfTestId, Integer groupedUnderId, String units, String interpretation, String defaultValue, String rangeFrom, String rangeUpTo, String comments, String reportCollDays, Date reportCollTime, boolean resultOptions, String refRangeType, int specimenId, boolean antibiotic, Integer orderNum, boolean isSubheading, int active) {
       this.code = code;
       this.name = name;
       this.rate = rate;
       this.nhisRate = nhisRate;
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
       this.specimenId = specimenId;
       this.antibiotic = antibiotic;
       this.orderNum = orderNum;
       this.isSubheading = isSubheading;
       this.active = active;
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
    public double getNhisRate() {
        return this.nhisRate;
    }
    
    public void setNhisRate(double nhisRate) {
        this.nhisRate = nhisRate;
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
    public int getSpecimenId() {
        return this.specimenId;
    }
    
    public void setSpecimenId(int specimenId) {
        this.specimenId = specimenId;
    }
    public boolean isAntibiotic() {
        return this.antibiotic;
    }
    
    public void setAntibiotic(boolean antibiotic) {
        this.antibiotic = antibiotic;
    }
    public Integer getOrderNum() {
        return this.orderNum;
    }
    
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }
    public boolean isIsSubheading() {
        return this.isSubheading;
    }
    
    public void setIsSubheading(boolean isSubheading) {
        this.isSubheading = isSubheading;
    }
    public int getActive() {
        return this.active;
    }
    
    public void setActive(int active) {
        this.active = active;
    }




}

