<%-- 
    Document   : showMessage
    Created on : Mar 7, 2017, 2:37:17 PM
    Author     : Tuyu
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.MessageBean"%>
<%@page import="model.User"%>
<%@page import="controller.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message | Dota Forum</title>
    </head>
    <%
        String fail = (String) request.getAttribute("fail");
        String err = "";
        if (fail != null) {
            if (fail.equals("0")) {
                err = "Message sent";
            } else if (fail.equals("1")) {
                err = "Message not sent";
            } else {
                err = "";
            }
        }
        UserBean ub = new UserBean();
        User user = ub.getUserById(Integer.parseInt(request.getParameter("receiver")));
        User byuser = ub.getUserById(Integer.parseInt(request.getParameter("sender")));
        MessageBean mb = new MessageBean();
        ArrayList<Message> msg = new ArrayList();
        msg = mb.getMsgFromId(byuser.getIdUser(), user.getIdUser());
    %>
    <body>
        <script>
            $(document).ready(function () {
                $("#formMsg").hide();
                $("#btnReply").click(function () {
                    $("#formMsg").toggle(750);
                });
            });
        </script>
        <div id="header-wrapper">
            <jsp:include page="header.jsp?menu=<%=user%>"/>
        </div>
        <div id="page-wrapper" class="5grid-layout">
            <div class="row">
                <div class="9u">
                    <div id="content">
                        <section>
                            <div  style = "width:70%" >
                                <%! String time = "";%>
                                <%
                                    for (int i = 0; i < msg.size(); i++) {
//                                        User receiver = msg.get(i).getUserByIdReceiver();
//                                        User sender = msg.get(i).getUserByIdSender();
                                        int receiver = msg.get(i).getUserByIdReceiver().getIdUser();
                                        if (user.getIdUser() == receiver) {
                                            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                                            time = sdf.format(msg.get(i).getDateTime());
                                %>
                                <p style="font-size:15px;">
                                    <%= byuser.getUsername()%> - <%= time %>
                                    <br>
                                    <%= msg.get(i).getIsi()%>
                                </p>
                                <%
                                } else {
                                %>
                                <p style="font-size:15px;"><%= user.getUsername()%> - <%= time %>
                                    <br>
                                    <%= msg.get(i).getIsi()%>
                                </p>
                                <%
                                    }
                                %>
                                <hr>
                                <%
                                    }
                                %>
                            </div>
                            <br>
                            <form method="POST" action="sendMsgServlet" id="formMsg">
                                <h2>Reply Message to <a href="ProfileServlet?userid=<%= byuser.getIdUser()%>"><%= byuser.getUsername()%></a></h2>
                                <p style="color:red"><b><%=err%></b><p>
                                <center>
                                    <textarea placeholder="What do you wanna say?" name="msg_isi" id="post_disc" style="border-radius:5px;" rows="15"> </textarea><br><br>
                                    <input type="submit" name="msg_send" value="Send" style="width:70%;height:50px;border-radius:5px;"><br><br>
                                    <input type="submit" name="msg_cancel" value="Cancel" style="width:70%;height:30px;border-radius:5px;" formaction="index.jsp"><br>
                                    <input type="hidden" name="target" value="<%= byuser.getIdUser()%>">
                                </center>
                            </form>

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
