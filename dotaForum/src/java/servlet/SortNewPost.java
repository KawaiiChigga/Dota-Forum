/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.CategoriesBean;
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
import model.Categories;
import model.Post;
import model.User;

/**
 *
 * @author asus
 */
@WebServlet(name = "SortNewPost", urlPatterns = {"/SortNewPost"})
public class SortNewPost extends HttpServlet {

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
            out.println("<title>Servlet SortNewPost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortNewPost at " + request.getContextPath() + "</h1>");
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
        PostBean pb = new PostBean();
        String judul = request.getParameter("post_title");
        String isi = request.getParameter("post_isi");
        String kategori = request.getParameter("category");
        
        HttpSession sessionLogIn = request.getSession();
        User user = (User) sessionLogIn.getAttribute("user");
        
        CategoriesBean cb = new CategoriesBean();
        Categories category = cb.getCategory(kategori);
        
        
        Post p = new Post(category,user,judul,isi,null,0,0);
        if(pb.insertPost(p)){
            String ALERT_FAIL = "fail";
            String fail = "0";
            request.setAttribute(ALERT_FAIL, fail);
            RequestDispatcher rd = request.getRequestDispatcher("post.jsp");
            rd.include(request, response);
        }else{
            String ALERT_FAIL = "fail";
            String fail = "1";
            request.setAttribute(ALERT_FAIL, fail);
            RequestDispatcher rd = request.getRequestDispatcher("post.jsp");
            rd.include(request, response);
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
