/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import java.awt.Point;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author asus
 */
@WebServlet(name = "LikeServlet", urlPatterns = {"/LikeServlet"})
public class LikeServlet extends HttpServlet {

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
            out.println("<title>Servlet LikeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LikeServlet at " + request.getContextPath() + "</h1>");
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
//        Session session = null;
        NewJerseyClient jc = new NewJerseyClient();
        String u = request.getParameter("user");
        String p = request.getParameter("post");
//        try {
//            LikeDislikeBean ld = new LikeDislikeBean();
//            session = ld.factory.openSession();
//            Transaction tx = session.beginTransaction();

//            Query q = session.createQuery("from Likes where id_post='" + p + "' and id_user='" + u + "'");
//            ArrayList<Likes> hasil = (ArrayList) q.list();
//
//            Query q2 = session.createQuery("from Dislikes where id_post='" + p + "' and id_user='" + u + "'");
//            ArrayList<Dislikes> hasil2 = (ArrayList) q2.list();
//
//            q = session.createQuery("from User where id_user='" + u + "'");
//            ArrayList<User> hasilUser = (ArrayList) q.list();
//            q = session.createQuery("from Post where id_post='" + p + "'");
//            ArrayList<Post> hasilPost = (ArrayList) q.list();
            boolean dis = false;
            if (!jc.checkLikeUser(p, u)) {
//                PostBean pb = new PostBean();
                JSONObject post = jc.getPostById(p);
                if (!jc.checkDislikeUser(p, u)) {

                } else {
                    dis = true;
                }
//                Likes like = new Likes(hasilPost.get(0), hasilUser.get(0));
                JSONObject obj = new JSONObject();
                obj.put("id_user", u);
                obj.put("id_post", p);
                if (jc.addLike(obj)) {
                    JSONObject objUpdate = new JSONObject();
                    if (dis) {
                        jc.deleteDislike(p, u);
//                        hasilPost.get(0).setDislikePost(hasilPost.get(0).getDislikePost() - 1);
                        objUpdate.put("dislike_post", Integer.toString(Integer.parseInt(post.get("dislike_post").toString()) - 1));
                        jc.updatePost(objUpdate, p);
                    }
                    JSONObject objUpdate2 = new JSONObject();
                    objUpdate2.put("like_post", Integer.toString(Integer.parseInt(post.get("like_post").toString()) + 1));
//                    hasilPost.get(0).setLikePost(hasilPost.get(0).getLikePost() + 1);
                    jc.updatePost(objUpdate2, p);
                    System.out.println("berhasil");
                } else {
                    System.out.println("salah");
                }
            } else {
                System.out.println("sudah ada");
            }
//            tx.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
            request.getRequestDispatcher("comment.jsp?post=" + p).forward(request, response);
//        }

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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
