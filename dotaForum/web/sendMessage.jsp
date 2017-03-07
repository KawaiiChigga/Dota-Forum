<%-- 
    Document   : sendMessage.jsp
    Created on : Mar 7, 2017, 6:28:44 AM
    Author     : Tuyu
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        User target = (User) request.getAttribute("user");
    %>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <jsp:include page="header.jsp"/>

            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
                            <section>
                                <div class="post">
                                    <form method="POST" action="sendMsgServlet" id="post_disc">
                                        <h2>Message to <a href="ProfileServlet?userid=<%= target.getIdUser()%>"><%= target.getUsername() %></a></h2>
                                        <p style="color:red"><b><%=err%></b><p>
                                        <center>
                                            <input type="text" name="msg_title" placeholder="Subject" style="width:50%;height:30px;border-radius:5px;"><br><br>
                                            <textarea placeholder="What do you wanna say?" name="msg_isi" id="post_disc" style="border-radius:5px;" rows="15"> </textarea><br><br>
                                            <input type="submit" name="msg_send" value="Send" style="width:70%;height:50px;border-radius:5px;"><br><br>
                                            <input type="submit" name="msg_cancel" value="Cancel" style="width:70%;height:30px;border-radius:5px;" formaction="index.jsp"><br>
                                            <input type="hidden" name="target" value="<%= target.getIdUser() %>">
                                        </center>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="3u">
                        <div id="sidebar2">
                            <section>
                                <div class="sbox1">
                                    <ul class="style1">
                                        <li><input class="search" type="text" name="search" placeholder="Search"></li>
                                        <li><input style="width:100%;border-radius:5px;" type="button" name="newpost" value="Feedback and Support"></li>
                                        <li><input style="width:100%;border-radius:5px;" type="button" name="newpost" value="Forum Rules"></li>
                                        <li>
                                            <div style="width:100%">
                                                <p><b>Please be kind to your fellow forum users.</b></p>
                                                <p>Administrators/Moderators reserve the right to move, change or delete any content at any time if they feel it is inappropiate or unsuitable. </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <div class="5grid-layout">
                <div class="row" id="footer-content">
                    <jsp:include page="footer.jsp"/>
                </div>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
