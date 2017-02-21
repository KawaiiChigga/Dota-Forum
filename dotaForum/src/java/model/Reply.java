package model;
// Generated Feb 21, 2017 9:01:02 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Reply generated by hbm2java
 */
public class Reply  implements java.io.Serializable {


     private Integer idReply;
     private Comment comment;
     private User user;
     private String isi;
     private Date dateTime;

    public Reply() {
    }

    public Reply(Comment comment, User user, String isi, Date dateTime) {
       this.comment = comment;
       this.user = user;
       this.isi = isi;
       this.dateTime = dateTime;
    }
   
    public Integer getIdReply() {
        return this.idReply;
    }
    
    public void setIdReply(Integer idReply) {
        this.idReply = idReply;
    }
    public Comment getComment() {
        return this.comment;
    }
    
    public void setComment(Comment comment) {
        this.comment = comment;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getIsi() {
        return this.isi;
    }
    
    public void setIsi(String isi) {
        this.isi = isi;
    }
    public Date getDateTime() {
        return this.dateTime;
    }
    
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }




}


