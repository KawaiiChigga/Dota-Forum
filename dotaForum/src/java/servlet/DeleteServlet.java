/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.CommentBean;
import controller.LikeDislikeBean;
import controller.PostBean;
import controller.ReplyBean;
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
import model.Comment;
import model.Dislikes;
import model.Likes;
import model.Post;
import model.Reply;

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

        PostBean pb = new PostBean();
        CommentBean cb = new CommentBean();
        ReplyBean rb = new ReplyBean();
        LikeDislikeBean ldb = new LikeDislikeBean();

        int pid = Integer.parseInt(request.getParameter("post"));
        Post temp = pb.getPostById(pid);

        ArrayList<Comment> comment = new ArrayList<Comment>();
        comment = cb.getCommentById(pid);
        
        ArrayList<Likes> like = new ArrayList<Likes>();
        like = ldb.getAllLike(pid);
        
        ArrayList<Dislikes> dislike = new ArrayList<Dislikes>();
        dislike = ldb.getAllDislike(pid);

        ArrayList<Reply> reply = new ArrayList<Reply>();

        try {
            if (comment.size() > 0) {
                for (int i = 0; i < comment.size(); i++) {

                    reply = rb.getReplyByCommentId(comment.get(0).getIdComment());
                    if (reply.size() > 0) {
                        rb.deleteReply(reply.get(0).getIdReply());
                    }
                    cb.deleteComment(comment.get(i).getIdComment());
                }
            }
            if(like.size()>0){
                for(int i=0;i<like.size();i++){
                    ldb.deleteLike(like.get(i).getIdLike());
                }
            }
            if(dislike.size()>0){
                for(int i=0;i<dislike.size();i++){
                    ldb.deleteDislike(dislike.get(i).getIdDislike());
                }
            }
            pb.deletePost(pid);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gagal");
        }finally{
            request.getRequestDispatcher("index.jsp?menu=1").forward(request, response);
        }
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
