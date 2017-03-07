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
                    <%
                        String temp[] = new String[2];
                        String type = "top";
                        if (request.getParameter("sort") != null) {
                            String jenis = request.getParameter("sort");
                            if (jenis.equals("1")) {
                                temp[0] = "current_page_item";
                                type = "top";
                            } else if (jenis.equals("2")) {
                                temp[1] = "current_page_item";
                                type = "new";
                            }
                        } else {
                            temp[0] = "current_page_item";
                        }
                        String jenis = request.getParameter("menu");
                    %>
                    <li class="<%=temp[0]%>" style="float:left;"><a href="index.jsp?sort=1&menu=<%= jenis %>">Top</a></li>
                    <li class="<%=temp[1]%>" style="float:left;"><a href="index.jsp?sort=2&menu=<%= jenis %>">New</a></li>
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
                            p = pb.getAllPost(type);
                        } else {
                            p = pb.getPostByCategory(request.getParameter("menu"),type);
                        }
                        for (int i = 0; i < p.size(); i++) {
                            User u = ub.getUserById(p.get(i).getUser().getIdUser());
                            ArrayList<Comment> c = new ArrayList<Comment>();
                            c = cb.getCommentById(p.get(i).getIdPost());
                    %>

                    <p style="font-size:20px"><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>"><%= p.get(i).getJudul()%></a></p>
                    <p style="font-size:15px"><a href="ProfileServlet?userid=<%= u.getIdUser()%>">By <%= u.getUsername()%></p>
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
