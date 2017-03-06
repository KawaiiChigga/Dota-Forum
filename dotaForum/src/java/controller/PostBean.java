/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Post;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tuyu
 */
public class PostBean {
    public static SessionFactory factory;
    
    public PostBean(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch(Exception e){
            
        }
    }
    
    public ArrayList<Post> getAllPost(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Post");
        ArrayList<Post> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public ArrayList<Post> getProfilePost(int user){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Post where id_user="+user+"");
        ArrayList<Post> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public boolean insertPost(Post p){
        Session session = null;
        Transaction tx = null;
        try{
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(p);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally {
            session.close();   
        }
        return true;
    }

    public boolean updatePost(Post p) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Post post = (Post) session.get(Post.class,p.getIdPost());
        System.out.println("UPDATE = " + post);
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

    public boolean deletePost(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Post post = (Post) session.get(Post.class, id);
        session.delete(post);
        System.out.println("Delete = " + post);
        tx.commit();
        session.close();
        return true;
    }
    
    public static Post getPostById(int id){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Post p = null;
        try{
            Query q = session.createQuery("from Post where id_post='" + id + "'");
            p = (Post) q.uniqueResult();
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            session.close();   
        }
        return p;
    }
    
    public static void main(String[] args){
        PostBean da = new PostBean();
        ArrayList<Post> p = new ArrayList<>();
        p = da.getAllPost();
//        System.out.println(p);
        for(Post a : p){
            System.out.println("User : "+a.getUser());
        }
    }
}
