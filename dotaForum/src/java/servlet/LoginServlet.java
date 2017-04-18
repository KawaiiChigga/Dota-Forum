/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
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
import org.json.simple.JSONObject;

/**
 *
 * @author asus
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

//        UserBean ub = new UserBean();
        NewJerseyClient jc = new NewJerseyClient();
//        User u = ub.checkLogIn(username, password);
        JSONObject user = new JSONObject();
        user.put("username", username);
        user.put("password", password);
        JSONObject obj = jc.checkLogIn(user);
        if (obj != null) {
            HttpSession sessionLogIn = request.getSession();
//            User temp = new User();
//            temp.setFirstName(obj.get("first_name").toString());
//            temp.setLastName(obj.get("last_name").toString());
//            temp.setIdUser((int) obj.get("id_user"));
//            temp.setEmail(obj.get("email").toString());
//            temp.setJenisKelamin(obj.get("jenis_kelamin").toString());
//            temp.setUrlFoto(obj.get("url_foto").toString());
//            temp.setUsername(obj.get("username").toString());
//            temp.setPassword(obj.get("password").toString());
//            temp.setLevel((int) obj.get("level"));
//            temp.setDateTime((Date) obj.get("date_time"));
//            temp.setProgressLevel((int) obj.get("progress_level"));
            sessionLogIn.setAttribute("check", "yes");
            sessionLogIn.setAttribute("user", obj);
            sessionLogIn.setAttribute("remember", remember);
            request.getRequestDispatcher("index.jsp?menu=1").forward(request, response);
        } else {
            request.setAttribute("warning", "Username or password wrong!");
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
