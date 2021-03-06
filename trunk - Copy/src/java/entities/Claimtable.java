package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Claimtable generated by hbm2java
 */
public class Claimtable  implements java.io.Serializable {


     private Integer tableid;
     private int claimid;
     private String sportype;
     private int visitid;
     private String patientid;
     private String status;
     private Double totalClaim;
     private Date claimDate;
     private Date firstVisit;
     private Date secondVisit;
     private Date thirdVisit;
     private Date fourthVisit;
     private Integer secondVisitid;
     private Integer thirdVisitid;
     private Integer fourthVisitid;
     private int patientage;
     private String badgeid;
     private double returnAmount;
     private String returnNotes;
     private String insuranceid;
     private String acceptReject;

    public Claimtable() {
    }

	
    public Claimtable(int claimid, String sportype, int visitid, String patientid, String status, Date claimDate, Date firstVisit, int patientage, String badgeid, double returnAmount, String returnNotes, String insuranceid, String acceptReject) {
        this.claimid = claimid;
        this.sportype = sportype;
        this.visitid = visitid;
        this.patientid = patientid;
        this.status = status;
        this.claimDate = claimDate;
        this.firstVisit = firstVisit;
        this.patientage = patientage;
        this.badgeid = badgeid;
        this.returnAmount = returnAmount;
        this.returnNotes = returnNotes;
        this.insuranceid = insuranceid;
        this.acceptReject = acceptReject;
    }
    public Claimtable(int claimid, String sportype, int visitid, String patientid, String status, Double totalClaim, Date claimDate, Date firstVisit, Date secondVisit, Date thirdVisit, Date fourthVisit, Integer secondVisitid, Integer thirdVisitid, Integer fourthVisitid, int patientage, String badgeid, double returnAmount, String returnNotes, String insuranceid, String acceptReject) {
       this.claimid = claimid;
       this.sportype = sportype;
       this.visitid = visitid;
       this.patientid = patientid;
       this.status = status;
       this.totalClaim = totalClaim;
       this.claimDate = claimDate;
       this.firstVisit = firstVisit;
       this.secondVisit = secondVisit;
       this.thirdVisit = thirdVisit;
       this.fourthVisit = fourthVisit;
       this.secondVisitid = secondVisitid;
       this.thirdVisitid = thirdVisitid;
       this.fourthVisitid = fourthVisitid;
       this.patientage = patientage;
       this.badgeid = badgeid;
       this.returnAmount = returnAmount;
       this.returnNotes = returnNotes;
       this.insuranceid = insuranceid;
       this.acceptReject = acceptReject;
    }
   
    public Integer getTableid() {
        return this.tableid;
    }
    
    public void setTableid(Integer tableid) {
        this.tableid = tableid;
    }
    public int getClaimid() {
        return this.claimid;
    }
    
    public void setClaimid(int claimid) {
        this.claimid = claimid;
    }
    public String getSportype() {
        return this.sportype;
    }
    
    public void setSportype(String sportype) {
        this.sportype = sportype;
    }
    public int getVisitid() {
        return this.visitid;
    }
    
    public void setVisitid(int visitid) {
        this.visitid = visitid;
    }
    public String getPatientid() {
        return this.patientid;
    }
    
    public void setPatientid(String patientid) {
        this.patientid = patientid;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Double getTotalClaim() {
        return this.totalClaim;
    }
    
    public void setTotalClaim(Double totalClaim) {
        this.totalClaim = totalClaim;
    }
    public Date getClaimDate() {
        return this.claimDate;
    }
    
    public void setClaimDate(Date claimDate) {
        this.claimDate = claimDate;
    }
    public Date getFirstVisit() {
        return this.firstVisit;
    }
    
    public void setFirstVisit(Date firstVisit) {
        this.firstVisit = firstVisit;
    }
    public Date getSecondVisit() {
        return this.secondVisit;
    }
    
    public void setSecondVisit(Date secondVisit) {
        this.secondVisit = secondVisit;
    }
    public Date getThirdVisit() {
        return this.thirdVisit;
    }
    
    public void setThirdVisit(Date thirdVisit) {
        this.thirdVisit = thirdVisit;
    }
    public Date getFourthVisit() {
        return this.fourthVisit;
    }
    
    public void setFourthVisit(Date fourthVisit) {
        this.fourthVisit = fourthVisit;
    }
    public Integer getSecondVisitid() {
        return this.secondVisitid;
    }
    
    public void setSecondVisitid(Integer secondVisitid) {
        this.secondVisitid = secondVisitid;
    }
    public Integer getThirdVisitid() {
        return this.thirdVisitid;
    }
    
    public void setThirdVisitid(Integer thirdVisitid) {
        this.thirdVisitid = thirdVisitid;
    }
    public Integer getFourthVisitid() {
        return this.fourthVisitid;
    }
    
    public void setFourthVisitid(Integer fourthVisitid) {
        this.fourthVisitid = fourthVisitid;
    }
    public int getPatientage() {
        return this.patientage;
    }
    
    public void setPatientage(int patientage) {
        this.patientage = patientage;
    }
    public String getBadgeid() {
        return this.badgeid;
    }
    
    public void setBadgeid(String badgeid) {
        this.badgeid = badgeid;
    }
    public double getReturnAmount() {
        return this.returnAmount;
    }
    
    public void setReturnAmount(double returnAmount) {
        this.returnAmount = returnAmount;
    }
    public String getReturnNotes() {
        return this.returnNotes;
    }
    
    public void setReturnNotes(String returnNotes) {
        this.returnNotes = returnNotes;
    }
    public String getInsuranceid() {
        return this.insuranceid;
    }
    
    public void setInsuranceid(String insuranceid) {
        this.insuranceid = insuranceid;
    }
    public String getAcceptReject() {
        return this.acceptReject;
    }
    
    public void setAcceptReject(String acceptReject) {
        this.acceptReject = acceptReject;
    }




}


