package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Consultingrooms generated by hbm2java
 */
public class Consultingrooms  implements java.io.Serializable {


     private Integer consultingroomid;
     private String consultingroom;
     private String type;

    public Consultingrooms() {
    }

    public Consultingrooms(String consultingroom, String type) {
       this.consultingroom = consultingroom;
       this.type = type;
    }
   
    public Integer getConsultingroomid() {
        return this.consultingroomid;
    }
    
    public void setConsultingroomid(Integer consultingroomid) {
        this.consultingroomid = consultingroomid;
    }
    public String getConsultingroom() {
        return this.consultingroom;
    }
    
    public void setConsultingroom(String consultingroom) {
        this.consultingroom = consultingroom;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }




}


