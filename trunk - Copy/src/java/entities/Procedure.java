package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Procedure generated by hbm2java
 */
public class Procedure  implements java.io.Serializable {


     private String code;
     private String description;
     private double price;

    public Procedure() {
    }

    public Procedure(String code, String description, double price) {
       this.code = code;
       this.description = description;
       this.price = price;
    }
   
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }




}


