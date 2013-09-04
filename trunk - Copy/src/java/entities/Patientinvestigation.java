package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Patientinvestigation generated by hbm2java
 */
public class Patientinvestigation  implements java.io.Serializable {


     private Integer id;
     private String patientid;
     private String code;
     private int investigationid;
     private String result;
     private String concentration;
     private String resultrange;
     private double price;
     private Integer quantity;
     private int visitationid;
     private String note;
     private String performed;
     private Date date;
     private double amountpaid;
     private String orderid;
     private boolean copaid;
     private boolean isPrivate;
     private double secondaryAmount;
     private double privateAmount;

    public Patientinvestigation() {
    }

	
    public Patientinvestigation(String patientid, String code, int investigationid, double price, int visitationid, Date date, double amountpaid, String orderid, boolean copaid, boolean isPrivate, double secondaryAmount, double privateAmount) {
        this.patientid = patientid;
        this.code = code;
        this.investigationid = investigationid;
        this.price = price;
        this.visitationid = visitationid;
        this.date = date;
        this.amountpaid = amountpaid;
        this.orderid = orderid;
        this.copaid = copaid;
        this.isPrivate = isPrivate;
        this.secondaryAmount = secondaryAmount;
        this.privateAmount = privateAmount;
    }
    public Patientinvestigation(String patientid, String code, int investigationid, String result, String concentration, String resultrange, double price, Integer quantity, int visitationid, String note, String performed, Date date, double amountpaid, String orderid, boolean copaid, boolean isPrivate, double secondaryAmount, double privateAmount) {
       this.patientid = patientid;
       this.code = code;
       this.investigationid = investigationid;
       this.result = result;
       this.concentration = concentration;
       this.resultrange = resultrange;
       this.price = price;
       this.quantity = quantity;
       this.visitationid = visitationid;
       this.note = note;
       this.performed = performed;
       this.date = date;
       this.amountpaid = amountpaid;
       this.orderid = orderid;
       this.copaid = copaid;
       this.isPrivate = isPrivate;
       this.secondaryAmount = secondaryAmount;
       this.privateAmount = privateAmount;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getPatientid() {
        return this.patientid;
    }
    
    public void setPatientid(String patientid) {
        this.patientid = patientid;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public int getInvestigationid() {
        return this.investigationid;
    }
    
    public void setInvestigationid(int investigationid) {
        this.investigationid = investigationid;
    }
    public String getResult() {
        return this.result;
    }
    
    public void setResult(String result) {
        this.result = result;
    }
    public String getConcentration() {
        return this.concentration;
    }
    
    public void setConcentration(String concentration) {
        this.concentration = concentration;
    }
    public String getResultrange() {
        return this.resultrange;
    }
    
    public void setResultrange(String resultrange) {
        this.resultrange = resultrange;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public Integer getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    public int getVisitationid() {
        return this.visitationid;
    }
    
    public void setVisitationid(int visitationid) {
        this.visitationid = visitationid;
    }
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }
    public String getPerformed() {
        return this.performed;
    }
    
    public void setPerformed(String performed) {
        this.performed = performed;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public double getAmountpaid() {
        return this.amountpaid;
    }
    
    public void setAmountpaid(double amountpaid) {
        this.amountpaid = amountpaid;
    }
    public String getOrderid() {
        return this.orderid;
    }
    
    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
    public boolean isCopaid() {
        return this.copaid;
    }
    
    public void setCopaid(boolean copaid) {
        this.copaid = copaid;
    }
    public boolean isIsPrivate() {
        return this.isPrivate;
    }
    
    public void setIsPrivate(boolean isPrivate) {
        this.isPrivate = isPrivate;
    }
    public double getSecondaryAmount() {
        return this.secondaryAmount;
    }
    
    public void setSecondaryAmount(double secondaryAmount) {
        this.secondaryAmount = secondaryAmount;
    }
    public double getPrivateAmount() {
        return this.privateAmount;
    }
    
    public void setPrivateAmount(double privateAmount) {
        this.privateAmount = privateAmount;
    }




}


