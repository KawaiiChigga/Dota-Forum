<%-- 
    Document   : comment
    Created on : Mar 1, 2017, 5:39:17 AM
    Author     : Tuyu
--%>

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
        <title>Dota Forum</title>
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
        <!--[if IE 9]><link rel="stylesheet" href="css/style-ie9.css" /><![endif]-->
    </head>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <jsp:include page="header.jsp"/>
                <%
                    String fail = (String) request.getAttribute("fail");
                    String err = "";
                    if (fail != null) {
                        if (fail.equals("0")) {
                            err = "Comment not added";
                        } else if (fail.equals("1")) {
                            err = "Comment succesfully added";
                        } else {
                            err = "";
                        }
                    }

                    int idpost = -1;
                    if (request.getParameter("post") != null) {
                        idpost = Integer.parseInt(request.getParameter("post"));
                    }
                %>
            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
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
                                        <%                                            PostBean pb = new PostBean();
                                            UserBean ub = new UserBean();
                                            CommentBean cb = new CommentBean();
                                            Post p = pb.getPostById(idpost);
                                            ArrayList<Comment> c = cb.getCommentById(idpost);
                                            User u = ub.getUserById(p.getUser().getIdUser());
                                        %>
                                        <p><%= u.getFullName()%> - <%= p.getDateTime()%></p>
                                        <p><%= p.getJudul()%></p>
                                        <p><%= p.getIsi()%></p>
                                        <p><a href="#"><%= p.getLikePost()%></a> -  
                                            <a href="#"><%= p.getDislikePost()%></a></p>
                                        <hr><hr>
                                        <h2>Comments : </h2>
                                        <%
                                            for (int i = 0; i < c.size(); i++) {
                                                u = ub.getUserById(c.get(i).getUser().getIdUser());
                                        %>
                                        <div>
                                            <p><%= u.getFullName()%> - <%= c.get(i).getDateTime()%></p>
                                            <p><%= c.get(i).getIsiComment()%></p>
                                            <hr>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </table>
                                    <br><br>
                                    <form method="POST" action="CommentServlet" id="post_disc">
                                        <h2>Post Comment!</h2>
                                        <center>
                                            <input type="hidden" name="id_post" value="<%= idpost%>"> 
                                            <textarea placeholder="What do you wanna say?" name="isi_comment" id="post_disc" style="border-radius:5px;" rows="15"> </textarea><br><br>
                                            <input type="submit" name="post_disc" value="Comment!" style="width:70%;height:50px;border-radius:5px;"><br><br>
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
                                        <form method="post" action="#">
                                            <li><input class="search" type="text" name="search" placeholder="Search"></li>
                                            <li><input style="width:100%;border-radius:5px;" type="submit" name="newpost" value="Start a new discussion" formaction="post.jsp"></li>
                                            <li><input style="width:100%;border-radius:5px;" type="submit" name="feedback" value="Feedback and Support"></li>
                                            <li><input style="width:100%;border-radius:5px;" type="submit" name="rules" value="Forum Rules"></li>
                                            <li>
                                                <div style="width:100%">
                                                    <p><b>Please be kind to your fellow forum users.</b></p>
                                                    <p>Administrators/Moderators reserve the right to move, change or delete any content at any time if they feel it is inappropiate or unsuitable. </p>
                                                </div>
                                            </li>
                                        </form>
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
            <section>
                <jsp:include page="copyright.jsp"/>
            </section>
        </div>
    </body>
</html>
