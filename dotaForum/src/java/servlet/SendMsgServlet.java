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
        NewJerseyClient jc = new NewJerseyClient();
//        MessageBean mb = new MessageBean();
        String isi = request.getParameter("msg_isi");

        HttpSession sessionLogIn = request.getSession();
        JSONObject user = (JSONObject) sessionLogIn.getAttribute("user");

//        UserBean ub = new UserBean();
        JSONObject target = jc.getUserById(request.getParameter("target"));
//        User target = ub.getUserById(Integer.parseInt(request.getParameter("target")));
        JSONObject obj = new JSONObject();
        obj.put("id_sender", user.get("id_user").toString());
        obj.put("id_receiver", target.get("id_user").toString());
        obj.put("isi", isi);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = "";
        time = sdf.format(new Date());
        obj.put("date_time",time);
//
//        User temp = new User();
//        temp.setFirstName(target.get("first_name").toString());
//        temp.setLastName(target.get("last_name").toString());
//        temp.setIdUser((int) target.get("id_user"));
//        temp.setEmail(target.get("email").toString());
//        temp.setJenisKelamin(target.get("jenis_kelamin").toString());
//        temp.setUrlFoto(target.get("url_foto").toString());
//        temp.setUsername(target.get("username").toString());
//        temp.setPassword(target.get("password").toString());
//        temp.setLevel((int) target.get("level"));
//        temp.setDateTime((Date) target.get("date_time"));
//        temp.setProgressLevel((int) target.get("progress_level"));

//        Message m = new Message(target,user,isi,null);
        if (jc.insertMessage(obj)) {
            String ALERT_FAIL = "fail";
            String fail = "0";
            request.setAttribute(ALERT_FAIL, fail);
            request.setAttribute("dataProfile", target);
            RequestDispatcher rd = request.getRequestDispatcher("showMessage.jsp?sender="+target.get("id_user").toString()+"&receiver="+user.get("id_user").toString());
            rd.include(request, response);
        } else {
            String ALERT_FAIL = "fail";
            String fail = "1";
            request.setAttribute(ALERT_FAIL, fail);
            request.setAttribute("dataProfile", target);
            RequestDispatcher rd = request.getRequestDispatcher("showMessage.jsp?sender="+target.get("id_user").toString()+"&receiver="+user.get("id_user").toString());
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
