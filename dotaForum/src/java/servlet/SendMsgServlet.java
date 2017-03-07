/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.MessageBean;
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
import model.Message;
import model.User;

/**
 *
 * @author Tuyu
 */
@WebServlet(name = "SendMsgServlet", urlPatterns = {"/sendMsgServlet"})
public class SendMsgServlet extends HttpServlet {

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
            out.println("<title>Servlet SendMsgServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMsgServlet at " + request.getContextPath() + "</h1>");
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
        MessageBean mb = new MessageBean();
        String judul = request.getParameter("msg_title");
        String isi = request.getParameter("msg_isi");
        
        HttpSession sessionLogIn = request.getSession();
        User user = (User) sessionLogIn.getAttribute("user");
        
        UserBean ub = new UserBean();
        User target = ub.getUserById(Integer.parseInt(request.getParameter("target")));
        
        Message m = new Message(target,user,isi,null);
        if(mb.insertMessage(m)){
            String ALERT_FAIL = "fail";
            String fail = "0";
            request.setAttribute(ALERT_FAIL, fail);
            request.setAttribute("dataProfile", target);
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?menu=8");
            rd.include(request, response);
        }else{
            String ALERT_FAIL = "fail";
            String fail = "1";
            request.setAttribute(ALERT_FAIL, fail);
            request.setAttribute("dataProfile", target);
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?menu=8");
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
