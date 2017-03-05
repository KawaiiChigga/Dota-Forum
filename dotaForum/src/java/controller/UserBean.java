/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
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
    
    public static ArrayList<User> getAllUser(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from User");
        ArrayList<User> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
//    public static User getUser(String username){
//        Session session = null;
//        Transaction tx = null;
//        ArrayList<User> hasil = new ArrayList<>();
//        
//        try{
//            session = factory.openSession();
//            tx = session.beginTransaction();
//            Query q = session.createQuery("from User where username = '" + username+"'");
//             hasil = (ArrayList) q.list();
////             System.out.println("-- : "+ hasil);
//            tx.commit();
//        }catch(Exception e){
//            hasil = null;
//        }finally {
//            session.close();   
//        }
//        
//        return hasil;
//    }
    
    public static boolean insertUser(User u){
        Session session = null;
        Transaction tx = null;
        try{
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(u);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally {
            session.close();   
        }
        return true;
    }

    public static boolean updateUser(User newUser) {
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

    public static boolean deleteUser(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        User user = (User) session.get(User.class, id);
        session.delete(user);
        System.out.println("Delete = " + user);
        tx.commit();
        session.close();
        return true;
    }
    
    public static User checkLogIn(String username, String password){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        User u = null;
        try{
            Query q = session.createQuery("from User where username='" + username + "' and password='" + password +"'");
            u = (User) q.uniqueResult();
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            session.close();   
        }
        return u;
    }
    
    public static void main(String[] args){
        UserBean da = new UserBean();
//        ArrayList<User> listMhs = da.getUser("tuyu");
//        System.out.println(listMhs);
//        User u = new User("glenn", "tuyu", "cgtuyu31@gmail.com", "L", "ganteng.jpg", "tuyu", "tuyu", 1, null, 0);
        System.out.println(checkLogIn("tuyu", "tuyu"
                + ""));
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
