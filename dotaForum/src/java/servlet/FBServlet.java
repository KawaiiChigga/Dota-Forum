/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.NewJerseyClient;
import fb.FBConnection;
import fb.FBGraph;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author admin
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/fbhome"})
public class FBServlet extends HttpServlet {

    private String code = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        code = request.getParameter("code");
        if (code == null || code.equals("")) {
            throw new RuntimeException(
                    "ERROR: Didn't get code parameter in callback.");
        }
        FBConnection fbConnection = new FBConnection();
        String accessToken = fbConnection.getAccessToken(code);

        FBGraph fbGraph = new FBGraph(accessToken);

        String graph = "";
        graph = fbGraph.getFBGraph();
        if (!graph.equals("")) {
            //        System.out.println(graph);
            HashMap<String, String> fbProfileData = fbGraph.getGraphData(graph);
            String email = fbProfileData.get("email");
            NewJerseyClient jc = new NewJerseyClient();
            if (!jc.checkUser("username", email)) {
                request.setAttribute("warning", "Username atau email sudah terdaftar!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                String first_name = fbProfileData.get("first_name");
                String last_name = fbProfileData.get("last_name");
                JSONObject user = new JSONObject();
                user.put("email", email);
                user.put("first_name", first_name);
                user.put("last_name", last_name);
                request.setAttribute("user", user);
                request.setAttribute("fb", "fb");
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            request.setAttribute("warning", "Username atau email sudah terdaftar!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

//  "username": "",
//  "password": "",
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
