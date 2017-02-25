/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Report;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tuyu
 */
public class ReportBean {
    public static SessionFactory factory;
    
    public ReportBean(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch(Exception e){
            
        }
    }
    
    public static ArrayList<Report> getAllReport(){
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Report");
        ArrayList<Report> hasil = (ArrayList) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public static boolean insertReport(Report r){
        Session session = null;
        Transaction tx = null;
        boolean inserted = true;
        try{
            session = factory.openSession();
            tx = session.beginTransaction();
            session.save(r);
            tx.commit();
        }catch(Exception e){
            inserted = false;
        }finally {
            session.close();   
        }
        return inserted;
    }

    public static boolean updateReport(Report r) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Report report = (Report) session.get(Report.class,r.getIdReport());
        System.out.println("UPDATE = " + report);
        report.setPost(r.getPost());
        report.setUser(r.getUser());
        report.setTypeOfReport(r.getTypeOfReport());
        report.setDateTime(r.getDateTime());
        tx.commit();
        session.close();
        return true;
    }

    public static boolean deleteReport(int id) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Report report = (Report) session.get(Report.class, id);
        session.delete(report);
        System.out.println("Delete = " + report);
        tx.commit();
        session.close();
        return true;
    }
    
    public static void main(String[] args){
        ReportBean da = new ReportBean();
        ArrayList<Report> listMhs = da.getAllReport();
        System.out.println(listMhs);
//        for(int i=0;i<listMhs.size();i++){
//            System.out.println(listMhs.get(i).getNim()+" - "+listMhs.get(i).getNama()+" - "+listMhs.get(i).getAlamat());
//        }
    }
}
