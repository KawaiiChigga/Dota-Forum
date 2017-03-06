/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Comment;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tuyu
 */
public class CommentBean {
    public static SessionFactory factory;
    
    public CommentBean(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch(Exception e){
            
        }
    }
    
    public static ArrayList<Comment> getAllComment(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Comment");
        ArrayList<Comment> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public static ArrayList<Comment> getCommentById(int id){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Comment where id_post = '"+id+"'");
        ArrayList<Comment> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public static boolean insertComment(Comment c){
        Session session = null;
        Transaction tx = null;
        try{
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(c);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            session.close();   
        }
        return true;
    }

    public static boolean updateComment(Comment c) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Comment cmt = (Comment) session.get(Comment.class,c.getIdComment());
        System.out.println("UPDATE = " + cmt);
        cmt.setPost(c.getPost());
        cmt.setUser(c.getUser());
        cmt.setIsiComment(c.getIsiComment());
        cmt.setDateTime(c.getDateTime());
        tx.commit();
        session.close();
        return true;
    }

    public static boolean deleteComment(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Comment c = (Comment) session.get(Comment.class, id);
        session.delete(c);
        System.out.println("Delete = " + c);
        tx.commit();
        session.close();
        return true;
    }
    
    public static void main(String[] args){
        CommentBean da = new CommentBean();
        ArrayList<Comment> listMhs = da.getCommentById(1);
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
