package model;
// Generated Mar 5, 2017 11:25:18 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Comment generated by hbm2java
 */
public class Comment  implements java.io.Serializable {


     private Integer idComment;
     private Post post;
     private User user;
     private String isiComment;
     private Date dateTime;
     private Set<Reply> replies = new HashSet<Reply>(0);

    public Comment() {
    }

	
    public Comment(Post post, User user, String isiComment, Date dateTime) {
        this.post = post;
        this.user = user;
        this.isiComment = isiComment;
        this.dateTime = dateTime;
    }
   
    public Integer getIdComment() {
        return this.idComment;
    }
    
    public void setIdComment(Integer idComment) {
        this.idComment = idComment;
    }
    public Post getPost() {
        return this.post;
    }
    
    public void setPost(Post post) {
        this.post = post;
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

    @Override
    public String toString() {
        return "Comment{" + "idComment=" + idComment + ", isiComment=" + isiComment + ", dateTime=" + dateTime + '}';
    }

    }



