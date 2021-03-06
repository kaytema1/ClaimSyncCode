package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * NursingtableVitals generated by hbm2java
 */
public class NursingtableVitals  implements java.io.Serializable {


     private Integer id;
     private int visitId;
     private String staffId;
     private String docId;
     private Date time;

    public NursingtableVitals() {
    }

	
    public NursingtableVitals(int visitId, String staffId, Date time) {
        this.visitId = visitId;
        this.staffId = staffId;
        this.time = time;
    }
    public NursingtableVitals(int visitId, String staffId, String docId, Date time) {
       this.visitId = visitId;
       this.staffId = staffId;
       this.docId = docId;
       this.time = time;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getVisitId() {
        return this.visitId;
    }
    
    public void setVisitId(int visitId) {
        this.visitId = visitId;
    }
    public String getStaffId() {
        return this.staffId;
    }
    
    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }
    public String getDocId() {
        return this.docId;
    }
    
    public void setDocId(String docId) {
        this.docId = docId;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }




}


