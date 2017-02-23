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
    
    public boolean insertPost(Post p){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(p);
        
        tx.commit();
        session.close();
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
    
    public static void main(String[] args){
        PostBean da = new PostBean();
        ArrayList<Post> listMhs = da.getAllPost();
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
