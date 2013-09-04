package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Treatment generated by hbm2java
 */
public class Treatment  implements java.io.Serializable {


     private String batchNumber;
     private String treatment;
     private double price;
     private String icd10;
     private String gdrg;
     private int quantity;

    public Treatment() {
    }

	
    public Treatment(String batchNumber, String treatment, double price, int quantity) {
        this.batchNumber = batchNumber;
        this.treatment = treatment;
        this.price = price;
        this.quantity = quantity;
    }
    public Treatment(String batchNumber, String treatment, double price, String icd10, String gdrg, int quantity) {
       this.batchNumber = batchNumber;
       this.treatment = treatment;
       this.price = price;
       this.icd10 = icd10;
       this.gdrg = gdrg;
       this.quantity = quantity;
    }
   
    public String getBatchNumber() {
        return this.batchNumber;
    }
    
    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }
    public String getTreatment() {
        return this.treatment;
    }
    
    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public String getIcd10() {
        return this.icd10;
    }
    
    public void setIcd10(String icd10) {
        this.icd10 = icd10;
    }
    public String getGdrg() {
        return this.gdrg;
    }
    
    public void setGdrg(String gdrg) {
        this.gdrg = gdrg;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }




}


