package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Newborn generated by hbm2java
 */
public class Newborn  implements java.io.Serializable {


     private Integer newbordid;
     private Date year;
     private String month;
     private String day;
     private Date time;
     private String momsid;
     private String supervisingmidwife;
     private String complications;

    public Newborn() {
    }

	
    public Newborn(Date year, String month, String day, Date time, String momsid) {
        this.year = year;
        this.month = month;
        this.day = day;
        this.time = time;
        this.momsid = momsid;
    }
    public Newborn(Date year, String month, String day, Date time, String momsid, String supervisingmidwife, String complications) {
       this.year = year;
       this.month = month;
       this.day = day;
       this.time = time;
       this.momsid = momsid;
       this.supervisingmidwife = supervisingmidwife;
       this.complications = complications;
    }
   
    public Integer getNewbordid() {
        return this.newbordid;
    }
    
    public void setNewbordid(Integer newbordid) {
        this.newbordid = newbordid;
    }
    public Date getYear() {
        return this.year;
    }
    
    public void setYear(Date year) {
        this.year = year;
    }
    public String getMonth() {
        return this.month;
    }
    
    public void setMonth(String month) {
        this.month = month;
    }
    public String getDay() {
        return this.day;
    }
    
    public void setDay(String day) {
        this.day = day;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }
    public String getMomsid() {
        return this.momsid;
    }
    
    public void setMomsid(String momsid) {
        this.momsid = momsid;
    }
    public String getSupervisingmidwife() {
        return this.supervisingmidwife;
    }
    
    public void setSupervisingmidwife(String supervisingmidwife) {
        this.supervisingmidwife = supervisingmidwife;
    }
    public String getComplications() {
        return this.complications;
    }
    
    public void setComplications(String complications) {
        this.complications = complications;
    }




}

