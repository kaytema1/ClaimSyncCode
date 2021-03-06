package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * BackupSyncTable generated by hbm2java
 */
public class BackupSyncTable  implements java.io.Serializable {


     private Integer id;
     private Integer syncfrequency;
     private Date dayDate;
     private Integer time;
     private String amPm;
     private Integer backFrequncy;

    public BackupSyncTable() {
    }

    public BackupSyncTable(Integer syncfrequency, Date dayDate, Integer time, String amPm, Integer backFrequncy) {
       this.syncfrequency = syncfrequency;
       this.dayDate = dayDate;
       this.time = time;
       this.amPm = amPm;
       this.backFrequncy = backFrequncy;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getSyncfrequency() {
        return this.syncfrequency;
    }
    
    public void setSyncfrequency(Integer syncfrequency) {
        this.syncfrequency = syncfrequency;
    }
    public Date getDayDate() {
        return this.dayDate;
    }
    
    public void setDayDate(Date dayDate) {
        this.dayDate = dayDate;
    }
    public Integer getTime() {
        return this.time;
    }
    
    public void setTime(Integer time) {
        this.time = time;
    }
    public String getAmPm() {
        return this.amPm;
    }
    
    public void setAmPm(String amPm) {
        this.amPm = amPm;
    }
    public Integer getBackFrequncy() {
        return this.backFrequncy;
    }
    
    public void setBackFrequncy(Integer backFrequncy) {
        this.backFrequncy = backFrequncy;
    }




}


