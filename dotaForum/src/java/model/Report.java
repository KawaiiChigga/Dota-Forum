package model;
// Generated Feb 21, 2017 9:01:02 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Report generated by hbm2java
 */
public class Report  implements java.io.Serializable {


     private Integer idReport;
     private Thread thread;
     private User user;
     private int typeOfReport;
     private Date dateTime;

    public Report() {
    }

    public Report(Thread thread, User user, int typeOfReport, Date dateTime) {
       this.thread = thread;
       this.user = user;
       this.typeOfReport = typeOfReport;
       this.dateTime = dateTime;
    }
   
    public Integer getIdReport() {
        return this.idReport;
    }
    
    public void setIdReport(Integer idReport) {
        this.idReport = idReport;
    }
    public Thread getThread() {
        return this.thread;
    }
    
    public void setThread(Thread thread) {
        this.thread = thread;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public int getTypeOfReport() {
        return this.typeOfReport;
    }
    
    public void setTypeOfReport(int typeOfReport) {
        this.typeOfReport = typeOfReport;
    }
    public Date getDateTime() {
        return this.dateTime;
    }
    
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }




}


