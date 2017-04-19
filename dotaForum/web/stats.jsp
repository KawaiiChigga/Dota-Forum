<%-- 
    Document   : stats
    Created on : Apr 18, 2017, 1:26:32 PM
    Author     : Asus
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            NewJerseyClient jc = new NewJerseyClient();
//            HttpSession sessionLogin = request.getSession();
//            JSONObject user = (JSONObject) sessionLogin.getAttribute("user");
            JSONObject user = jc.getUserById(request.getParameter("id_user"));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= user.get("username").toString()%> Stats</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <a href="stats.jsp"></a>
                <jsp:include page="header.jsp"/>
            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
                            <section>
                                <div class="post">
                                    <table>
                                        <tr>
                                            <th><p style="font-size:30px"><%= user.get("username").toString()%>'s Chart</p></th>
                                        </tr>
                                    </table>
                                    <img src="chart.jsp?id_user=<%=user.get("id_user").toString()%>"/>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="3u">
                        <div id="sidebar2">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
