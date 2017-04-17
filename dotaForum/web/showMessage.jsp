<%-- 
    Document   : showMessage
    Created on : Mar 7, 2017, 2:37:17 PM
    Author     : Tuyu
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.NewJerseyClient"%>
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
        NewJerseyClient jc = new NewJerseyClient();
//        UserBean ub = new UserBean();
        JSONObject user = jc.getUserById(request.getParameter("receiver"));
        JSONObject byuser = jc.getUserById(request.getParameter("sender"));
//        User user = ub.getUserById(Integer.parseInt(request.getParameter("receiver")));
//        User byuser = ub.getUserById(Integer.parseInt(request.getParameter("sender")));
//        MessageBean mb = new MessageBean();
//        ArrayList<Message> msg = new ArrayList();
        JSONArray msg = jc.getMsgFromId(byuser.get("id_user").toString(), user.get("id_user").toString());
//        msg = mb.getMsgFromId(byuser.getIdUser(), user.getIdUser());
%>
    <body>
        <script src=jquery-1.11.3.min.js></script>
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
                                <p style="font-size:25px;">Message <span style="font-size:15px">with <a href="ProfileServlet?userid=<%= byuser.get("id_user").toString()%>"><%= byuser.get("username").toString()%></a></span></p>
                                <hr>
                                <%! String time = "";%>
                                <%
                                    for (int i = 0; i < msg.size(); i++) {
//                                        User receiver = msg.get(i).getUserByIdReceiver();
//                                        User sender = msg.get(i).getUserByIdSender();
                                        JSONObject obj = (JSONObject) msg.get(i);
//                                        int receiver = msg.get(i).getUserByIdReceiver().getIdUser();
                                        int receiver = (int) obj.get("id_user");
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm");
                                        if ((int) user.get("id_user") == receiver) {
                                            time = sdf.format(obj.get("date_time"));
                                %>
                                <p style="font-size:15px;">
                                    <%= byuser.get("username").toString()%> - <%= time%>
                                    <br>
                                    <%= obj.get("isi").toString()%>
                                </p>
                                <%
                                } else {
                                    time = sdf.format(obj.get("date_time"));
                                %>
                                <p style="font-size:15px;"><%= user.get("username").toString()%> - <%= time%>
                                    <br>
                                    <%= obj.get("isi").toString()%>
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
                                <h2 style="font-size:25px">Reply Message to <a href="ProfileServlet?userid=<%= byuser.get("id_user").toString()%>"><%= byuser.get("username").toString()%></a></h2>
                                <p style="color:red"><b><%=err%></b><p>
                                <center>
                                    <textarea placeholder="What do you wanna say?" name="msg_isi" id="post_disc" style="border-radius:5px;" rows="15"> </textarea><br><br>
                                    <input type="submit" name="msg_send" value="Send" style="width:70%;height:50px;border-radius:5px;"><br><br>
                                    <input type="submit" name="msg_cancel" value="Cancel" style="width:70%;height:30px;border-radius:5px;" formaction="index.jsp"><br>
                                    <input type="hidden" name="target" value="<%= byuser.get("id_user").toString()%>">
                                </center>
                            </form>
                            <br>
                            <button style="border-radius:5px;width:100%;height:40px;background-color:#193149;color:whitesmoke;font-family:Trebuchet MS;font-size:20px;" id="btnReply">Reply Message</button>
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
