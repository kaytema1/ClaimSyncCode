package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Folder generated by hbm2java
 */
public class Folder  implements java.io.Serializable {


     private String foldernumber;
     private String shelvenumber;
     private String status;
     private String previouslocation;

    public Folder() {
    }

	
    public Folder(String foldernumber) {
        this.foldernumber = foldernumber;
    }
    public Folder(String foldernumber, String shelvenumber, String status, String previouslocation) {
       this.foldernumber = foldernumber;
       this.shelvenumber = shelvenumber;
       this.status = status;
       this.previouslocation = previouslocation;
    }
   
    public String getFoldernumber() {
        return this.foldernumber;
    }
    
    public void setFoldernumber(String foldernumber) {
        this.foldernumber = foldernumber;
    }
    public String getShelvenumber() {
        return this.shelvenumber;
    }
    
    public void setShelvenumber(String shelvenumber) {
        this.shelvenumber = shelvenumber;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public String getPreviouslocation() {
        return this.previouslocation;
    }
    
    public void setPreviouslocation(String previouslocation) {
        this.previouslocation = previouslocation;
    }




}

