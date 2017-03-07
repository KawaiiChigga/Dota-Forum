/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Tuyu
 */
@WebServlet(name = "DirectMsgServlet", urlPatterns = {"/directMsgServlet"})
public class DirectMsgServlet extends HttpServlet {

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
            out.println("<title>Servlet DirectMsgServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DirectMsgServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession sessionLogin = request.getSession();
        User usession = (User) sessionLogin.getAttribute("user");
        
        UserBean ub = new UserBean();
        int uid = Integer.parseInt(request.getParameter("userid"));
        User u = (User) ub.getUserById(uid);

        if (usession.getUsername().equals(u.getUsername())) {
            request.setAttribute("user", u);
            RequestDispatcher rd = request.getRequestDispatcher("getMessage.jsp");
            rd.forward(request, response);
        }else{
            RequestDispatcher rd = request.getRequestDispatcher("showMessage.jsp?sender="+u.getIdUser()+"&receiver="+usession.getIdUser());
            rd.forward(request, response);
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
//        HttpSession sessionLogin = request.getSession();
//        User usession = (User) sessionLogin.getAttribute("user");
//
//        UserBean ub = new UserBean();
//        int uid = Integer.parseInt(request.getParameter("userid"));
//        User u = (User) ub.getUserById(uid);
//
//        if (usession.getUsername().equals(u.getUsername())) {
//            request.setAttribute("user", u);
//            RequestDispatcher rd = request.getRequestDispatcher("getMessage.jsp");
//            rd.forward(request, response);
//        }else{
//            request.setAttribute("user", u);
//            RequestDispatcher rd = request.getRequestDispatcher("sendMessage.jsp");
//            rd.forward(request, response);
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
