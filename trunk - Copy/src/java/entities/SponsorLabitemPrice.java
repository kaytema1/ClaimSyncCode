package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * SponsorLabitemPrice generated by hbm2java
 */
public class SponsorLabitemPrice  implements java.io.Serializable {


     private Integer id;
     private String sponsorId;
     private double price;
     private int labItemId;

    public SponsorLabitemPrice() {
    }

    public SponsorLabitemPrice(String sponsorId, double price, int labItemId) {
       this.sponsorId = sponsorId;
       this.price = price;
       this.labItemId = labItemId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getSponsorId() {
        return this.sponsorId;
    }
    
    public void setSponsorId(String sponsorId) {
        this.sponsorId = sponsorId;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public int getLabItemId() {
        return this.labItemId;
    }
    
    public void setLabItemId(int labItemId) {
        this.labItemId = labItemId;
    }




}


