/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
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
public class UserBean {
    public static SessionFactory factory;
    
    public UserBean(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch(Exception e){
            
        }
    }
    
    public ArrayList<User> getAllUser(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from User");
        ArrayList<User> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public boolean insertUser(User u){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(u);
        
        tx.commit();
        session.close();
        return true;
    }

    public boolean updateUser(User newUser) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        User user = (User) session.get(User.class,
                newUser.getIdUser());
        System.out.println("UPDATE = " + user);
        
        user.setFirstName(newUser.getFirstName());
        user.setLastName(newUser.getLastName());
        user.setEmail(newUser.getEmail());
        user.setJenisKelamin(newUser.getJenisKelamin());
        user.setUrlFoto(newUser.getUrlFoto());
        user.setPassword(newUser.getPassword());
        user.setLevel(newUser.getLevel());
        user.setDateTime(newUser.getDateTime());
        user.setProgressLevel(newUser.getProgressLevel());
        tx.commit();
        session.close();
        return true;
    }

    public boolean deleteUser(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        User user = (User) session.get(User.class, id);
        session.delete(user);
        System.out.println("Delete = " + user);
        tx.commit();
        session.close();
        return true;
    }
    
    public static void main(String[] args){
        UserBean da = new UserBean();
        ArrayList<User> listMhs = da.getAllUser();
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
