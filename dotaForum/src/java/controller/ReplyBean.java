/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Reply;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tuyu
 */
public class ReplyBean {

    public static SessionFactory factory;

    public ReplyBean() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {

        }
    }

    public static ArrayList<Reply> getAllReply() {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Reply");
        ArrayList<Reply> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public ArrayList<Reply> getReplyByCommentId(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Reply where id_comment='"+id+"'");
        ArrayList<Reply> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public static boolean insertReply(Reply r) {
        Session session = null;
        Transaction tx = null;
        try {
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(r);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }

    public static boolean updateReply(Reply r) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Reply reply = (Reply) session.get(Reply.class, r.getIdReply());
        System.out.println("UPDATE = " + reply);
        reply.setComment(r.getComment());
        reply.setUser(r.getUser());
        reply.setIsi(r.getIsi());
        reply.setDateTime(r.getDateTime());
        tx.commit();
        session.close();
        return true;
    }

    public static boolean deleteReply(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Reply reply = (Reply) session.get(Reply.class, id);
        session.delete(reply);
        System.out.println("Delete = " + reply);
        tx.commit();
        session.close();
        return true;
    }

    public static void main(String[] args) {
        ReplyBean da = new ReplyBean();
        ArrayList<Reply> listMhs = da.getAllReply();
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
