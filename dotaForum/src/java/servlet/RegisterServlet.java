/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.UserBean;
import static controller.UserBean.factory;
import java.io.IOException;
//import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
        boolean berhasil = false;
        User user = new User();
        Session session = null;

        try {
            UserBean ub = new UserBean();
            session = ub.factory.openSession();
            Transaction tx = session.beginTransaction();

            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user.setUsername(request.getParameter("username"));
            user.setFirstName(request.getParameter("first_name"));
            user.setLastName(request.getParameter("last_name"));
            user.setJenisKelamin(request.getParameter("gender"));
            user.setLevel(1);
            user.setUrlFoto("");
            user.setProgressLevel(0);
            user.setDateTime(null);

            String confPassword = request.getParameter("password2");
            String temp = user.getUsername();
            Query q = session.createQuery("from User where username = '" + temp + "' or email = '" + user.getEmail() + "'");
            ArrayList<User> hasil = (ArrayList) q.list();
            if (user.getPassword().equals("") || user.getFirstName().equals("")
                    || confPassword.equals("") || user.getEmail().equals("")
                    || user.getUsername().equals("") || user.getLastName().equals("")) {
                request.setAttribute("warningRegister", "Tolong lengkapi form");
            } else if (hasil.isEmpty()) {
                if (user.getPassword().length() > 4) {
                    if (user.getPassword().equals(confPassword)) {
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

            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        if (berhasil) {
            UserBean register = new UserBean();
            if (register.insertUser(user)) {
                request.setAttribute("username", user.getUsername());
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
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
