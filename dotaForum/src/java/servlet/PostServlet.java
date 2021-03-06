/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author Tuyu
 */
@WebServlet(name = "postServlet", urlPatterns = {"/postServlet"})
public class PostServlet extends HttpServlet {

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
            out.println("<title>Servlet postServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        if (session.getAttribute("check") != null) {
            request.getRequestDispatcher("post.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        NewJerseyClient jc = new NewJerseyClient();
//        PostBean pb = new PostBean();
        String judul = request.getParameter("post_title");
        String isi = request.getParameter("post_isi");
        String kategori = request.getParameter("category");

        HttpSession sessionLogIn = request.getSession();
        JSONObject user = (JSONObject) sessionLogIn.getAttribute("user");

//        CategoriesBean cb = new CategoriesBean();
        JSONObject category = jc.getCategory(kategori);
//        Categories category = cb.getCategory(kategori);
        JSONObject obj = new JSONObject();
        obj.put("id_user",user.get("id_user"));
        obj.put("judul",judul);
        obj.put("isi",isi);
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String time = "";
        time = sdf.format(new Date());
        obj.put("date_time",time);
        obj.put("like_post",0);
        obj.put("dislike_post",0);
        obj.put("id_category",category.get("id_category").toString());
        
//        Post p = new Post(category, user, judul, isi, null, 0, 0);
        
        if (jc.insertPost(obj)) {
            String ALERT_FAIL = "fail";
            String fail = "0";
            request.setAttribute(ALERT_FAIL, fail);
            RequestDispatcher rd = request.getRequestDispatcher("post.jsp");
            rd.include(request, response);
        } else {
            String ALERT_FAIL = "fail";
            String fail = "1";
            request.setAttribute(ALERT_FAIL, fail);
            RequestDispatcher rd = request.getRequestDispatcher("post.jsp");
            rd.include(request, response);
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
