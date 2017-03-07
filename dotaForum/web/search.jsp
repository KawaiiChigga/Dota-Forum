<%-- 
    Document   : search
    Created on : Mar 7, 2017, 10:08:37 PM
    Author     : Tuyu
--%>

<%@page import="model.User"%>
<%@page import="model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="model.Post"%>
<%@page import="model.Post"%>
<%@page import="model.Post"%>
<%@page import="controller.CommentBean"%>
<%@page import="controller.UserBean"%>
<%@page import="controller.PostBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search-Dota Forum</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <jsp:include page="header.jsp"/>
            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
                            <h2 style="font-size:25px;">Search Result(s):</h2>
                            <hr>
                            <%
                                String search = request.getParameter("search");
                                PostBean pb = new PostBean();
                                UserBean ub = new UserBean();
                                CommentBean cb = new CommentBean();
                                ArrayList<Post> p = new ArrayList<Post>();
                                p = pb.getPostSearch(search);
                                if (p.size() == 0) {
                                    %>
                                    <p>No result found for "<%= search %>"</p>
                            <%
                                } else {
                                    for (int i = 0; i < p.size(); i++) {
                                        User u = ub.getUserById(p.get(i).getUser().getIdUser());
                                        ArrayList<Comment> c = new ArrayList<Comment>();
                                        c = cb.getCommentById(p.get(i).getIdPost());
                            %>

                            <p style="font-size:20px"><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>"><%= p.get(i).getJudul()%></a></p>
                            <p style="font-size:15px"><a href="ProfileServlet?userid=<%= u.getIdUser()%>">By <%= u.getUsername()%></a></p>
                            <p style="font-size:12px">Posted in: <%= p.get(i).getDateTime()%></p>
                            <p><a href="#"><%= p.get(i).getLikePost()%> Likes</a> -  
                                <a href="#"><%= p.get(i).getDislikePost()%> Dislikes</a></p>
                            <p><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>">Comment (<%= c.size()%>)</a></p>
                            <hr>

                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <div class="3u">
                        <div id="sidebar2">
                            <jsp:include page="sidebar.jsp"/>
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
