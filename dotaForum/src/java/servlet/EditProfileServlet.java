/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
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
        UserBean ub = new UserBean();
        String newfirst = request.getParameter("first_name");
        String newlast = request.getParameter("last_name");
        String newpass = request.getParameter("password");
        String newmail = request.getParameter("email");
        String newpass2 = request.getParameter("password2");
        String newjk = request.getParameter("gender");
        boolean berhasil=false;
        
        
        User nu = ub.getUserById(Integer.parseInt(request.getParameter("userid")));
        nu.setFirstName(newfirst);
        nu.setJenisKelamin(newjk);
        nu.setLastName(newlast);
        nu.setEmail(newmail);
        nu.setPassword(newpass);
        nu.setUrlFoto(newlast);
        
         if (nu.getPassword().equals("") || nu.getFirstName().equals("")
                    || newpass2.equals("") || nu.getEmail().equals("")
                    || nu.getLastName().equals("")) {
                request.setAttribute("warningRegister", "Tolong lengkapi form");
            }
                if (nu.getPassword().length() > 4) {
                    if (nu.getPassword().equals(newpass2)) {
                        berhasil = true;
                        request.setAttribute("berhasil", "Update berhasil");
                    } else {
                        request.setAttribute("warningRegister", "Check Password and Confirm Password!");
                    }
                } else {
                    request.setAttribute("warningRegister", "Password minimal 4 character!");
                }
                if(berhasil){
                    if(ub.updateUser(nu)){
                        request.getRequestDispatcher("index.jsp?menu=1").forward(request, response);
                    }else{
                        
                    }
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
