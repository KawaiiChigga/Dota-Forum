/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import controller.CommentBean;
import controller.PostBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;
import model.Post;
import model.User;
import org.json.simple.JSONObject;

/**
 *
 * @author Tuyu
 */
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

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
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession sessionLogIn = request.getSession(false);
        NewJerseyClient jc = new NewJerseyClient();
        if (sessionLogIn.getAttribute("check") != null) {

//            CommentBean cb = new CommentBean();
            String isi = request.getParameter("isi_comment");
            String idpost = request.getParameter("id_post");
            int id = Integer.parseInt(idpost);
//            PostBean pb = new PostBean();
            JSONObject p = jc.getPostById(Integer.toString(id));
//            Post p = pb.getPostById(id);

            JSONObject user = (JSONObject) sessionLogIn.getAttribute("user");

//            Comment c = new Comment();
//            c.setPost(p);
//            c.setIsiComment(isi);
//            c.setUser(user);
            JSONObject obj = new JSONObject();
            obj.put("isi", isi);
            obj.put("id_post",p.get("id_post").toString());
            obj.put("id_user",user.get("id_user").toString());
            if (jc.insertComment(obj)) {
                String ALERT_FAIL = "fail";
                String fail = "0";
                request.setAttribute(ALERT_FAIL, fail);
//            request.setAttribute("post", id);
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.include(request, response);
                response.sendRedirect("comment.jsp?post=" + idpost);
            } else {
                String ALERT_FAIL = "fail";
                String fail = "1";
                request.setAttribute(ALERT_FAIL, fail);
                request.setAttribute("post", id);
                RequestDispatcher rd = request.getRequestDispatcher("comment.jsp");
                rd.include(request, response);
                response.sendRedirect("index.jsp");
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
