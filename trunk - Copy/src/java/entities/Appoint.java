package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Appoint generated by hbm2java
 */
public class Appoint  implements java.io.Serializable {


     private Integer id;
     private String patientId;
     private String doctorId;
     private String content;
     private String start;
     private String title;
     private String allday;
     private String end;
     private boolean honored;

    public Appoint() {
    }

	
    public Appoint(boolean honored) {
        this.honored = honored;
    }
    public Appoint(String patientId, String doctorId, String content, String start, String title, String allday, String end, boolean honored) {
       this.patientId = patientId;
       this.doctorId = doctorId;
       this.content = content;
       this.start = start;
       this.title = title;
       this.allday = allday;
       this.end = end;
       this.honored = honored;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getPatientId() {
        return this.patientId;
    }
    
    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }
    public String getDoctorId() {
        return this.doctorId;
    }
    
    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    public String getStart() {
        return this.start;
    }
    
    public void setStart(String start) {
        this.start = start;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAllday() {
        return this.allday;
    }
    
    public void setAllday(String allday) {
        this.allday = allday;
    }
    public String getEnd() {
        return this.end;
    }
    
    public void setEnd(String end) {
        this.end = end;
    }
    public boolean isHonored() {
        return this.honored;
    }
    
    public void setHonored(boolean honored) {
        this.honored = honored;
    }




}


