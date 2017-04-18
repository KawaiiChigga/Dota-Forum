<%-- 
    Document   : getMessage
    Created on : Mar 7, 2017, 1:36:20 PM
    Author     : Tuyu
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Message | Dota Forum</title>
    </head>
    <%
        NewJerseyClient jc = new NewJerseyClient();
//        UserBean ub = new UserBean();
        HttpSession sessionLogin = request.getSession();
//        User temp = (User) sessionLogin.getAttribute("user");
        JSONObject user = (JSONObject) request.getAttribute("user");
//        MessageBean mb = new MessageBean();
//        ArrayList<Message> msg = new ArrayList();
        JSONArray msg = jc.getInbox(user.get("id_user").toString());
//        msg = mb.getInbox(user.getIdUser());
%>
    <body>
        <div id="header-wrapper">
            <jsp:include page="header.jsp?menu=<%=user%>"/>
        </div>
        <div id="page-wrapper" class="5grid-layout">
            <div class="row">
                <div class="9u">
                    <div id="content">
                        <section>
                            <p style="font-size:25px;">Messages</p>
                            <hr>
                            <%
                                for (int i = 0; i < msg.size(); i++) {
//                                        User sender = new User();
                                    JSONObject obj = (JSONObject) msg.get(i);
                                    JSONObject sender = jc.getUserById(obj.get("id_user").toString());
                            %><div onclick="window.location = 'showMessage.jsp?sender=<%= sender.get("id_user").toString()%>&receiver=<%= user.get("id_user").toString() %>';" style="cursor: pointer;">
                                <p>from <b style="font-size:20px"><a href="ProfileServlet?userid=<%= sender.get("id_user").toString()%>"><%= sender.get("username")%></a></b></p>
                                <p><%= obj.get("isi").toString()%></p>
                                <hr>
                            </div>
                            <%
                                }
                            %>
                        </section>
                    </div>
                </div>
                <div class="3u">
                    <div id="sidebar2">
                        <jsp:include page="sidebar.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
