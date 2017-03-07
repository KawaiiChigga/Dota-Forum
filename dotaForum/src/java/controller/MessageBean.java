/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Message;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tuyu
 */
public class MessageBean {

    public static SessionFactory factory;

    public MessageBean() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {

        }
    }

    public static ArrayList<Message> getAllMessage() {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Message");
        ArrayList<Message> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public static ArrayList<Message> getInbox(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Message where id_receiver='" + id + "' group by id_sender order by date_time");
        ArrayList<Message> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public static ArrayList<Message> getMsgFromId(int idsender, int idreceiver) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Message where (id_receiver='" + idreceiver + "' and id_sender='" + idsender + "')"
                + "or (id_receiver='" + idsender + "' and id_sender='" + idreceiver + "') order by date_time");
        ArrayList<Message> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public static boolean insertMessage(Message m) {
        Session session = null;
        Transaction tx = null;
        try {
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(m);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }

    public static boolean updateMessage(Message m) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Message msg = (Message) session.get(Message.class, m.getIdMessage());
        System.out.println("UPDATE = " + msg);
        msg.setUserByIdReceiver(m.getUserByIdReceiver());
        msg.setUserByIdSender(m.getUserByIdSender());
        msg.setIsi(m.getIsi());
        msg.setDateTime(m.getDateTime());
        tx.commit();
        session.close();
        return true;
    }

    public static boolean deleteMessage(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Message msg = (Message) session.get(Message.class, id);
        session.delete(msg);
        System.out.println("Delete = " + msg);
        tx.commit();
        session.close();
        return true;
    }

    public static void main(String[] args) throws ParseException {
        MessageBean mb = new MessageBean();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        ArrayList<Message> msg = new ArrayList();
        msg = mb.getAllMessage();
        sdf = new SimpleDateFormat("dd/MM/YYYY");
        Date date = sdf.parse("4/03/2017");
        int test = date.compareTo(msg.get(0).getDateTime());
        System.out.println("test : "+test);
//        String time = sdf.format(msg.get(0).getDateTime());
//        String date = sdf.format(msg.get(0).getDateTime());
//        System.out.println(time);
//        System.out.println(date);
    }
}
