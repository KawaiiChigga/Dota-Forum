/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Asus
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        NewJerseyClient jc = new NewJerseyClient();
//        PostBean pb = new PostBean();
//        CommentBean cb = new CommentBean();
//        ReplyBean rb = new ReplyBean();
//        LikeDislikeBean ldb = new LikeDislikeBean();

        String pid = request.getParameter("post");
        JSONObject temp = jc.getPostById(pid);
//        Post temp = pb.getPostById(pid);

//        ArrayList<Comment> comment = new ArrayList<Comment>();
        JSONArray comment = jc.getCommentById(pid);
//        comment = cb.getCommentById(pid);

//        ArrayList<Likes> like = new ArrayList<Likes>();
//        like = ldb.getAllLike(pid);
        JSONArray like = jc.getAllLikes(pid);

//        ArrayList<Dislikes> dislike = new ArrayList<Dislikes>();
//        dislike = ldb.getAllDislike(pid);
        JSONArray dislike = jc.getAllDislike(pid);

//        try {
        if (comment.size() > 0) {
            JSONArray reply;
            for (int i = 0; i < comment.size(); i++) {

                JSONObject obj = (JSONObject) comment.get(i);
                reply = jc.getReplyByCommentId(obj.get("id_comment").toString());
                if (reply.size() > 0) {
                    JSONObject objReply = (JSONObject) reply.get(0);
                    jc.deleteReply(objReply.get("id_reply").toString());
//                        teReply(reply.get(0).getIdReply());
                }
                jc.deleteComment(obj.get("id_comment").toString());
            }
        }
        if (like.size() > 0) {
            for (int i = 0; i < like.size(); i++) {
                JSONObject objLike = (JSONObject) like.get(i);
                String id_post = objLike.get("id_post").toString();
                String id_user = objLike.get("id_user").toString();
                jc.deleteLike(id_post, id_user);
            }
        }
        if (dislike.size() > 0) {
            for (int i = 0; i < dislike.size(); i++) {
//                    ldb.deleteDislike(dislike.get(i).getIdDislike());
                JSONObject objDislike = (JSONObject) dislike.get(i);
                String id_post = objDislike.get("id_post").toString();
                String id_user = objDislike.get("id_user").toString();
                jc.deleteDislike(id_post,id_user);
            }
        }
        jc.deletePost(pid);
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("gagal");
//        } finally {

        request.setAttribute("dataProfile", jc.getUserById(temp.get("id_user").toString()));
        request.getRequestDispatcher("profile.jsp??menu=8").forward(request, response);
//        }
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
