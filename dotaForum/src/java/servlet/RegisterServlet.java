/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.UserBean;
import static controller.UserBean.factory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
        Session session = factory.openSession();
        User user = new User();
        boolean berhasil = false;
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setUsername(request.getParameter("username"));
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setJenisKelamin(request.getParameter("gender"));
        user.setLevel(1);
        user.setUrlFoto(null);
        user.setDateTime(null);
        user.setProgressLevel(0);
        String confPassword = request.getParameter("password");

        Query username = session.createQuery("from user where username=" + user.getUsername());
        Query email = session.createQuery("from user where email=" + user.getEmail());

        if (email == null) {
            if (username == null) {
                if (user.getPassword().length() > 4) {
                    if (user.getPassword().equals(confPassword)) {
                        berhasil = true;
                        request.setAttribute("warningRegister", "Registrasi berhasil");
                    } else {
                        request.setAttribute("warningRegister", "Check Password and Confirm Password!");
                    }
                } else {
                    request.setAttribute("warningPassLength", "Password minimal 4 character!");
                }
            } else {
                request.setAttribute("warningRegister", "Username sudah terdaftar!");
            }
        } else {
            request.setAttribute("warningRegister", "Email sudah terdaftar!");
        }

        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();

        if (berhasil) {
            UserBean register = new UserBean();
            register.insertUser(user);
            response.sendRedirect("login.jsp");
//            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//            rd.include(request, response);
        } else {
            response.sendRedirect("register.jsp");
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
