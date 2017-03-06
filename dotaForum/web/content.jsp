<%-- 
    Document   : isiPost
    Created on : Mar 6, 2017, 12:42:02 AM
    Author     : asus
--%>

<%@page import="model.Post"%>
<%@page import="model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="controller.CommentBean"%>
<%@page import="controller.UserBean"%>
<%@page import="controller.PostBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div id="menu" class="12u">
                <ul>
                    <li class="current_page_item" style="float:left;">Hot</li>
                    <li style="float:left;">Top</li>
                    <li style="float:left;">New</li>
                    <li style="float:right;">1234</li>
                </ul>
            </div>
        </section>
        <section>
            <div class="post">
                <table border="1 solid black">
                    <%
                        PostBean pb = new PostBean();
                        UserBean ub = new UserBean();
                        CommentBean cb = new CommentBean();
                        ArrayList<Post> p = new ArrayList<Post>();
                        if (request.getParameter("menu").equals("1")) {
                            p = pb.getAllPost();
                        } else {
                            p = pb.getPostByCategory(request.getParameter("menu"));
                        }
                        for (int i = 0; i < p.size(); i++) {
                            User u = ub.getUserById(p.get(i).getUser().getIdUser());
                            ArrayList<Comment> c = new ArrayList<Comment>();
                            c = cb.getCommentById(p.get(i).getIdPost());
                    %>

                    <p style="font-size:20px"><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>"><%= p.get(i).getJudul()%></a></p>
                    <p style="font-size:15px">By <%= u.getUsername()%></p>
                    <p style="font-size:12px">Posted in: <%= p.get(i).getDateTime()%></p>
                    <p><a href="#"><%= p.get(i).getLikePost()%> Likes</a> -  
                        <a href="#"><%= p.get(i).getDislikePost()%> Dislikes</a></p>
                    <p><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>">Comment (<%= c.size()%>)</a></p>
                    <hr>

                    <%
                        }
                    %>
                </table>
            </div>
        </section>
    </body>
</html>
