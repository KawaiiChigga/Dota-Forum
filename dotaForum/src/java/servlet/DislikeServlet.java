/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.LikeDislikeBean;
import controller.PostBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dislikes;
import model.Likes;
import model.Post;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "DislikeServlet", urlPatterns = {"/DislikeServlet"})
public class DislikeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DislikeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DislikeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session = null;

        String u = request.getParameter("user");
        String p = request.getParameter("post");
        try {
            LikeDislikeBean ld = new LikeDislikeBean();
            session = ld.factory.openSession();
            Transaction tx = session.beginTransaction();

            Query q = session.createQuery("from Likes where id_post='" + p + "' and id_user='" + u + "'");
            ArrayList<Likes> hasil2 = (ArrayList) q.list();

            Query q2 = session.createQuery("from Dislikes where id_post='" + p + "' and id_user='" + u + "'");
            ArrayList<Dislikes> hasil = (ArrayList) q2.list();

            q = session.createQuery("from User where id_user='" + u + "'");
            ArrayList<User> hasilUser = (ArrayList) q.list();
            q = session.createQuery("from Post where id_post='" + p + "'");
            ArrayList<Post> hasilPost = (ArrayList) q.list();
            boolean pernah = false;
            if (hasil.isEmpty()) {
                PostBean pb = new PostBean();
                if (hasil2.isEmpty()) {

                } else {
                    pernah = true;
                }
                Dislikes dislike = new Dislikes(hasilPost.get(0), hasilUser.get(0));
                if (ld.addDislike(dislike)) {
                    if (pernah) {
                        ld.deleteLike(hasil2.get(0).getIdLike());
                        hasilPost.get(0).setLikePost(hasilPost.get(0).getLikePost() - 1);
                        pb.updatePost(hasilPost.get(0));
                    }
                    hasilPost.get(0).setDislikePost(hasilPost.get(0).getDislikePost() + 1);
                    pb.updatePost(hasilPost.get(0));
                    System.out.println("berhasil");
                } else {
                    System.out.println("salah");
                }
            } else {
                System.out.println("sudah ada");
            }
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            request.getRequestDispatcher("comment.jsp?post=" + p).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
