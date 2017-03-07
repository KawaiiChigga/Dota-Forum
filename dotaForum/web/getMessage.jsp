<%-- 
    Document   : getMessage
    Created on : Mar 7, 2017, 1:36:20 PM
    Author     : Tuyu
--%>

<%@page import="controller.UserBean"%>
<%@page import="model.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.MessageBean"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Message | Dota Forum</title>
    </head>
    <%
        UserBean ub = new UserBean();
        User user = (User) request.getAttribute("user");
        MessageBean mb = new MessageBean();
        ArrayList<Message> msg = new ArrayList();
        msg = mb.getInbox(user.getIdUser());
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
                                        User sender = new User();
                                        sender = ub.getUserById(msg.get(i).getUserByIdSender().getIdUser());
                                %><div onclick="window.location = 'showMessage.jsp?sender=<%= sender.getIdUser()%>&receiver=<%= user.getIdUser()%>';" style="cursor: pointer;">
                                    <p>from <b style="font-size:20px"><a href="ProfileServlet?userid=<%= sender.getIdUser()%>"><%= sender.getUsername()%></a></b></p>
                                    <p><%= msg.get(i).getIsi()%></p>
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
        <div class="5grid-layout"> 
            <div class="row" id="footer-content">
                <jsp:include page="footer.jsp"/>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
