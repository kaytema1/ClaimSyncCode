package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * LabStockPackaging generated by hbm2java
 */
public class LabStockPackaging  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String status;

    public LabStockPackaging() {
    }

    public LabStockPackaging(String name, String status) {
       this.name = name;
       this.status = status;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


