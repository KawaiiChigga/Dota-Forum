/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Categories;
import model.Post;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author asus
 */
public class CategoriesBean {

    public static SessionFactory factory;

    public CategoriesBean() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {

        }
    }

    public ArrayList<Post> getAllCategories() {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Categories");
        ArrayList<Post> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public boolean insertCategory(Categories c) {
        Session session = null;
        Transaction tx = null;
        try {
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(c);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return true;
    }

    public Categories getCategory(String c){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Categories where category='"+c+"'");
        ArrayList<Categories> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil.get(0);
    }
//    public boolean updatePost(Categories c) {
//        Session session = factory.openSession();
//        Transaction tx = session.beginTransaction();
//        Post post = (Post) session.get(Post.class,p.getIdPost());
//        System.out.println("UPDATE = " + post);
//        post.setUser(p.getUser());
//        post.setJudul(p.getJudul());
//        post.setIsi(p.getIsi());
//        post.setDateTime(p.getDateTime());
//        post.setLikePost(p.getLikePost());
//        post.setDislikePost(p.getDislikePost());
//        tx.commit();
//        session.close();
//        return true;
//    }
//
//    public boolean deletePost(int id) {
//        Session session = factory.openSession();
//        Transaction tx = session.beginTransaction();
//        Post post = (Post) session.get(Post.class, id);
//        session.delete(post);
//        System.out.println("Delete = " + post);
//        tx.commit();
//        session.close();
//        return true;
    }
