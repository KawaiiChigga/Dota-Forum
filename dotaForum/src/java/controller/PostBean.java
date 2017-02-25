/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Post;
import model.User;
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
        Session session = null;
        Transaction tx = null;
        try{
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(p);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
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
    
    public static void main(String[] args){
        PostBean da = new PostBean();
        User u = new User("glenn", "tuyu", "cgtuyu31@gmail.com", "L", "ganteng.jpg", "tuyu", "tuyu", 1, null, 0);
        Post p = new Post(u,"judul","isi\n\nqwiejqowenjqwe",null,0,0);
        if(da.insertPost(p)){
            System.out.println("inserted");
        }else{
            System.out.println("not inserted");
        }
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
