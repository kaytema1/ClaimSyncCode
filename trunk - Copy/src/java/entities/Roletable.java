package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * Roletable generated by hbm2java
 */
public class Roletable  implements java.io.Serializable {


     private Integer roleid;
     private String rolename;
     private String roledescription;

    public Roletable() {
    }

    public Roletable(String rolename, String roledescription) {
       this.rolename = rolename;
       this.roledescription = roledescription;
    }
   
    public Integer getRoleid() {
        return this.roleid;
    }
    
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }
    public String getRolename() {
        return this.rolename;
    }
    
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
    public String getRoledescription() {
        return this.roledescription;
    }
    
    public void setRoledescription(String roledescription) {
        this.roledescription = roledescription;
    }




}


