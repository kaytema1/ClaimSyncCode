package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Loggingtable generated by hbm2java
 */
public class Loggingtable  implements java.io.Serializable {


     private Integer id;
     private String userid;
     private Date logintime;
     private Date logoutitme;
     private String action;
     private Date date;

    public Loggingtable() {
    }

	
    public Loggingtable(String userid, String action, Date date) {
        this.userid = userid;
        this.action = action;
        this.date = date;
    }
    public Loggingtable(String userid, Date logintime, Date logoutitme, String action, Date date) {
       this.userid = userid;
       this.logintime = logintime;
       this.logoutitme = logoutitme;
       this.action = action;
       this.date = date;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getUserid() {
        return this.userid;
    }
    
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public Date getLogintime() {
        return this.logintime;
    }
    
    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }
    public Date getLogoutitme() {
        return this.logoutitme;
    }
    
    public void setLogoutitme(Date logoutitme) {
        this.logoutitme = logoutitme;
    }
    public String getAction() {
        return this.action;
    }
    
    public void setAction(String action) {
        this.action = action;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }




}


