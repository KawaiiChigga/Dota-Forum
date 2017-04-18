/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import controller.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import org.json.simple.JSONObject;

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
        JSONObject usession = (JSONObject) sessionLogin.getAttribute("user");

        NewJerseyClient jc = new NewJerseyClient();
//        UserBean ub = new UserBean();
        int uid = Integer.parseInt(request.getParameter("userid"));
        JSONObject u = jc.getUserById(Integer.toString(uid));
//        User u = (User) ub.getUserById(uid);

        if (usession.get("username").toString().equals(u.get("username").toString())) {
//            User temp = new User();
//            temp.setFirstName(u.get("first_name").toString());
//            temp.setLastName(u.get("last_name").toString());
//            temp.setIdUser((int) u.get("id_user"));
//            temp.setEmail(u.get("email").toString());
//            temp.setJenisKelamin(u.get("jenis_kelamin").toString());
//            temp.setUrlFoto(u.get("url_foto").toString());
//            temp.setUsername(u.get("username").toString());
//            temp.setPassword(u.get("password").toString());
//            temp.setLevel((int) u.get("level"));
//            temp.setDateTime((Date) u.get("date_time"));
//            temp.setProgressLevel((int) u.get("progress_level"));

            request.setAttribute("user", u);
            RequestDispatcher rd = request.getRequestDispatcher("getMessage.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("showMessage.jsp?sender=" + u.get("id_user").toString() + "&receiver=" + usession.get("id_user").toString());
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
