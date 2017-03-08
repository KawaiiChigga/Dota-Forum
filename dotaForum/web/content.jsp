<%-- 
    Document   : isiPost
    Created on : Mar 6, 2017, 12:42:02 AM
    Author     : asus
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <noscript>
        <link rel="stylesheet" href="css/5grid/core.css" />
        <link rel="stylesheet" href="css/5grid/core-desktop.css" />
        <link rel="stylesheet" href="css/5grid/core-1200px.css" />
        <link rel="stylesheet" href="css/5grid/core-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />

        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        </noscript>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script src="css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.openerWidth=52"></script>
    </head>
    <body>
        <div class="5grid-layout">
            <div class="row">
                <div class="12u" id="menu">
                    <div id="menu-wrapper">
                        <nav class="mobileUI-site-nav">
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
                                <li class="<%=temp[0]%>" style="float:left;"><a href="index.jsp?sort=1&menu=<%= jenis%>">Top</a></li>
                                <li class="<%=temp[1]%>" style="float:left;"><a href="index.jsp?sort=2&menu=<%= jenis%>">New</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>               
        <br>
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
                            p = pb.getPostByCategory(request.getParameter("menu"), type);
                        }
                        for (int i = 0; i < p.size(); i++) {
                            User u = ub.getUserById(p.get(i).getUser().getIdUser());
                            ArrayList<Comment> c = new ArrayList<Comment>();
                            c = cb.getCommentById(p.get(i).getIdPost());
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm");
                            String time = "";
                            time = sdf.format(p.get(i).getDateTime());
                    %>
                    <div onclick="window.location = 'comment.jsp?post=<%=p.get(i).getIdPost()%>';" style="cursor: pointer;">
                        <p style="font-size:25px"><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>"> <%= p.get(i).getJudul()%></a></p>
                        <p style="font-size:15px"><a href="ProfileServlet?userid=<%= u.getIdUser()%>">By <%= u.getUsername()%></a></p>
                        <p style="font-size:13px">Posted on: <%= time%></p>
                        <p><%= p.get(i).getLikePost()%> Likes -  
                            <%= p.get(i).getDislikePost()%> Dislikes</p>
                        <p><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>">Comment(s) (<%= c.size()%>)</a></p>
                        <hr>
                    </div>
                    <%
                        }
                    %>
                </table>
            </div>
        </section>
    </body>
</html>
