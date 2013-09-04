package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Room generated by hbm2java
 */
public class Room  implements java.io.Serializable {


     private Integer roomid;
     private String description;
     private int numberOfBeds;
     private int status;
     private double cost;
     private int wardId;

    public Room() {
    }

    public Room(String description, int numberOfBeds, int status, double cost, int wardId) {
       this.description = description;
       this.numberOfBeds = numberOfBeds;
       this.status = status;
       this.cost = cost;
       this.wardId = wardId;
    }
   
    public Integer getRoomid() {
        return this.roomid;
    }
    
    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public int getNumberOfBeds() {
        return this.numberOfBeds;
    }
    
    public void setNumberOfBeds(int numberOfBeds) {
        this.numberOfBeds = numberOfBeds;
    }
    public int getStatus() {
        return this.status;
    }
    
    public void setStatus(int status) {
        this.status = status;
    }
    public double getCost() {
        return this.cost;
    }
    
    public void setCost(double cost) {
        this.cost = cost;
    }
    public int getWardId() {
        return this.wardId;
    }
    
    public void setWardId(int wardId) {
        this.wardId = wardId;
    }




}


