<%--
    Document   : index
    Created on : Feb 25, 2017, 12:40:04 PM
    Author     : Tuyu
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Comment"%>
<%@page import="controller.CommentBean"%>
<%@page import="controller.UserBean"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.PostBean"%>
<%@page import="model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home-Dota Forum</title>
    </head>
    <body>
        <div id="wrapper">
            <%

                String temp = (String) request.getParameter("menu");
                String sort = "1";
                if (request.getParameter("menu") == null) {
                    temp = "1";
                }
                if(request.getParameter("sort")!=null){
                    sort = request.getParameter("sort");
                }
            %>
            <div id="header-wrapper">
                <jsp:include page="header.jsp?menu=<%=temp%>"/>
            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
                            <jsp:include page="content.jsp?menu=<%=temp%>&sort=<%=sort%>"/>
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
        </div>
        <div id="copyright" class="5grid-layout">
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
