/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
    
    public MessageBean(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch(Exception e){
            
        }
    }
    
    public ArrayList<Message> getAllMessage(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Message");
        ArrayList<Message> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public boolean insertMessage(Message m){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(m);
        
        tx.commit();
        session.close();
        return true;
    }

    public boolean updateMessage(Message m) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Message msg = (Message) session.get(Message.class,m.getIdMessage());
        System.out.println("UPDATE = " + msg);
        msg.setUserByIdReceiver(m.getUserByIdReceiver());
        msg.setUserByIdSender(m.getUserByIdSender());
        msg.setIsi(m.getIsi());
        msg.setDateTime(m.getDateTime());
        tx.commit();
        session.close();
        return true;
    }

    public boolean deleteMessage(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Message msg = (Message) session.get(Message.class, id);
        session.delete(msg);
        System.out.println("Delete = " + msg);
        tx.commit();
        session.close();
        return true;
    }
    
    public static void main(String[] args){
        MessageBean da = new MessageBean();
        ArrayList<Message> listMhs = da.getAllMessage();
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
