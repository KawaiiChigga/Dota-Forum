package model;
// Generated Feb 21, 2017 9:01:02 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Comment generated by hbm2java
 */
public class Comment  implements java.io.Serializable {


     private Integer idComment;
     private Thread thread;
     private User user;
     private String isiComment;
     private Date dateTime;
     private Set<Reply> replies = new HashSet<Reply>(0);

    public Comment() {
    }

	
    public Comment(Thread thread, User user, String isiComment, Date dateTime) {
        this.thread = thread;
        this.user = user;
        this.isiComment = isiComment;
        this.dateTime = dateTime;
    }
    public Comment(Thread thread, User user, String isiComment, Date dateTime, Set<Reply> replies) {
       this.thread = thread;
       this.user = user;
       this.isiComment = isiComment;
       this.dateTime = dateTime;
       this.replies = replies;
    }
   
    public Integer getIdComment() {
        return this.idComment;
    }
    
    public void setIdComment(Integer idComment) {
        this.idComment = idComment;
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
    public String getIsiComment() {
        return this.isiComment;
    }
    
    public void setIsiComment(String isiComment) {
        this.isiComment = isiComment;
    }
    public Date getDateTime() {
        return this.dateTime;
    }
    
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
    public Set<Reply> getReplies() {
        return this.replies;
    }
    
    public void setReplies(Set<Reply> replies) {
        this.replies = replies;
    }




}


