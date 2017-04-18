/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import java.io.IOException;
//import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.simple.JSONObject;

/**
 *
 * @author asus
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        boolean berhasil = false;
        NewJerseyClient jc = new NewJerseyClient();

        JSONObject user = new JSONObject();
        user.put("email", request.getParameter("email"));
        user.put("password", request.getParameter("password"));
        user.put("username", request.getParameter("username"));
        user.put("first_name", request.getParameter("first_name"));
        user.put("last_name", request.getParameter("last_name"));
        user.put("gender", request.getParameter("gender"));
        user.put("level", 1);
        user.put("url_foto", "");
        user.put("progress_level", 1);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm:ss");
        String time = "";
        time = sdf.format(new Date());
        user.put("date_time", time);

        String confPassword = request.getParameter("password2");
        boolean used = jc.checkUser(request.getParameter("username"), request.getParameter("email"));
        if (user.get("password").toString().equals("") || user.get("first_name").toString().equals("")
                || confPassword.equals("") || user.get("email").toString().equals("")
                || user.get("username").toString().equals("") || user.get("last_name").toString().equals("")) {
            request.setAttribute("warningRegister", "Tolong lengkapi form");
        } else if (!used) {
            if (user.get("password").toString().length() >= 4) {
                if (user.get("password").toString().equals(confPassword)) {
                    berhasil = true;
                    request.setAttribute("berhasil", "Registrasi berhasil");
                } else {
                    request.setAttribute("warningRegister", "Check Password and Confirm Password!");
                }
            } else {
                request.setAttribute("warningRegister", "Password minimal 4 character!");
            }
        } else {
            request.setAttribute("warningRegister", "Username atau email sudah terdaftar!");
        }

        if (berhasil) {
            if (jc.insertUser(user)) {
                request.setAttribute("username", user.get("username").toString());
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("warningRegister", "Registrasi Gagal!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
