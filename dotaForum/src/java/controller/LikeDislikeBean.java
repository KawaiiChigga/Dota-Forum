/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author asus
 */

import static controller.PostBean.factory;
import java.util.ArrayList;
import model.Dislikes;
import model.Likes;
import model.Post;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class LikeDislikeBean {

    public static SessionFactory factory;

    public LikeDislikeBean() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {

        }
    }

    public ArrayList<Likes> getAllLike(int id){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Likes where id_post='"+id+"'");
        ArrayList<Likes> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public ArrayList<Dislikes> getAllDislike(int id){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Dislikes where id_post='"+id+"'");
        ArrayList<Dislikes> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public boolean addLike(Likes like){
        Session session = null;
        Transaction tx = null;
        try {
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(like);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return true;
    }
    
    public boolean addDislike(Dislikes dislike){
        Session session = null;
        Transaction tx = null;
        try {
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(dislike);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return true;
    }
    
    public boolean deleteDislike(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Dislikes dislike = (Dislikes) session.get(Dislikes.class, id);
        session.delete(dislike);
        System.out.println("Delete = " + dislike);
        tx.commit();
        session.close();
        return true;
    }
    
    public boolean deleteLike(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Likes like = (Likes) session.get(Likes.class, id);
        session.delete(like);
        System.out.println("Delete = " + like);
        tx.commit();
        session.close();
        return true;
    }
    
    
    public boolean updateLike(Post p) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        
        Post post = (Post) session.get(Post.class, session);
        post.setUser(p.getUser());
        post.setJudul(p.getJudul());
        post.setIsi(p.getIsi());
        post.setDateTime(p.getDateTime());
        post.setLikePost(p.getLikePost());
        post.setDislikePost(p.getDislikePost());
        tx.commit();
        session.close();
        return true;
    }
    
    public boolean updateDislike(Post p,User u) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        
        Post post = (Post) session.get(Post.class, p.getIdPost());
        post.setUser(p.getUser());
        post.setJudul(p.getJudul());
        post.setIsi(p.getIsi());
        post.setDateTime(p.getDateTime());
        post.setLikePost(p.getLikePost());
        post.setDislikePost(p.getDislikePost());
        tx.commit();
        session.close();
        return true;
    }
}

