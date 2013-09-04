package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * PatientDiscount generated by hbm2java
 */
public class PatientDiscount  implements java.io.Serializable {


     private Integer discountId;
     private int visitId;
     private String patientId;
     private double percentageDiscount;
     private double discounted;
     private double newAmount;
     private String staffId;
     private String status;
     private String reason;

    public PatientDiscount() {
    }

    public PatientDiscount(int visitId, String patientId, double percentageDiscount, double discounted, double newAmount, String staffId, String status, String reason) {
       this.visitId = visitId;
       this.patientId = patientId;
       this.percentageDiscount = percentageDiscount;
       this.discounted = discounted;
       this.newAmount = newAmount;
       this.staffId = staffId;
       this.status = status;
       this.reason = reason;
    }
   
    public Integer getDiscountId() {
        return this.discountId;
    }
    
    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }
    public int getVisitId() {
        return this.visitId;
    }
    
    public void setVisitId(int visitId) {
        this.visitId = visitId;
    }
    public String getPatientId() {
        return this.patientId;
    }
    
    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }
    public double getPercentageDiscount() {
        return this.percentageDiscount;
    }
    
    public void setPercentageDiscount(double percentageDiscount) {
        this.percentageDiscount = percentageDiscount;
    }
    public double getDiscounted() {
        return this.discounted;
    }
    
    public void setDiscounted(double discounted) {
        this.discounted = discounted;
    }
    public double getNewAmount() {
        return this.newAmount;
    }
    
    public void setNewAmount(double newAmount) {
        this.newAmount = newAmount;
    }
    public String getStaffId() {
        return this.staffId;
    }
    
    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public String getReason() {
        return this.reason;
    }
    
    public void setReason(String reason) {
        this.reason = reason;
    }




}

