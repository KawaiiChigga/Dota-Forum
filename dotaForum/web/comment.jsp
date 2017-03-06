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
                <header id="header">
                    <div class="5grid-layout">
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
                            HttpSession Login = request.getSession(false);
                            String check = (String) Login.getAttribute("check");
                            if (check != null) {
                        %>
                        <p>
                            <a href="LogoutServlet">Log out</a>
                            <a href="ProfileServlet">Profile</a>
                        </p>
                        <%                            } else {
                        %>
                        <p>
                            <a href="login.jsp">Log In</a>&nbsp&nbsp&nbsp
                            <a href="register.jsp">Register</a>
                        </p>
                        <%
                            }
                            int idpost = -1;
                            if (request.getParameter("post") != null) {
                                idpost = Integer.parseInt(request.getParameter("post"));
                            }
                        %>
                        <div class="row">
                            <div class="12u" id="logo"> <!-- Logo -->
                                <h1><a href="#" class="mobileUI-site-name">Dofu</a></h1>
                            </div>

                        </div>
                    </div>
                    <div class="5grid-layout">
                        <div class="row">
                            <div class="12u" id="menu">
                                <div id="menu-wrapper">
                                    <nav class="mobileUI-site-nav">
                                        <ul>
                                            <li class="current_page_item"><a href="">All</a></li>
                                            <li><a href="">Chat</a></li>
                                            <li><a href="">Competitive</a></li>
                                            <li><a href="">Custom Game</a></li>
                                            <li><a href="">Media</a></li>
                                            <li><a href="">Recruitment</a></li>
                                            <li><a href="">Strategy</a></li>
                                            <li style="float:right;"><a href="profile.jsp">Profile</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
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
                                        <%
                                            PostBean pb = new PostBean();
                                            UserBean ub = new UserBean();
                                            CommentBean cb = new CommentBean();
                                            Post p = pb.getPostById(idpost);
                                            ArrayList<Comment> c = cb.getCommentById(idpost);
                                            User u = ub.getUserById(p.getUser().getIdUser());
                                        %>
                                        
                                        <p style="font-size:25px"><%= p.getJudul()%></p>
                                        <p style="font-size:15px">By <%= u.getUsername()%></p>
                                        <p style="font-size:12px">Posted in: <%= p.getDateTime()%></p>
                                        <p style="font-size:20px"><%= p.getIsi()%></p>
                                        <p><a href="#">Likes (<%= p.getLikePost()%>)</a> -  
                                            <a href="#">Dislikes (<%= p.getDislikePost()%>)</a></p>
                                        <hr><hr>
                                        <p style="font-size:20px">Comments : </p>
                                        <%

                                            for (int i = 0; i < c.size(); i++) {
                                                u = ub.getUserById(c.get(i).getUser().getIdUser());
                                        %>
                                        <div>
                                            <p style="font-size:20px"><%= u.getUsername()%> - <%= c.get(i).getDateTime()%></p>
                                            <p style="font-size:15px"><%= c.get(i).getIsiComment()%></p>
                                            <hr>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </table>
                                    <br><br>
                                    <form method="POST" action="CommentServlet" id="post_disc">
                                        <p style="font-size:20px">Post A Comment!</p>
                                        <center>
                                            <input type="hidden" name="id_post" value="<%= idpost%>"> 
                                            <textarea placeholder="What do you wanna say?" name="isi_comment" id="post_disc" style="border-radius:5px;" rows="5"> </textarea>
                                        </center><br><br>
                                        <left>
                                            <input type="submit" name="post_disc" value="Post Comment" style="width:30%;height:30px;border-radius:5px;"><br><br>
                                        </left>
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
                    <div class="6u" id="box1">
                        <section>
                            <h2>Maecenas luctus lectus</h2>
                            <div>
                                <p><img src="images/pics05.jpg" alt="" width="180" height="120" class="imgleft">In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. Donec placerat odio vel elit. Nullam ante orci, pellentesque eget, tempus quis, ultrices in, est. Curabitur sit amet nulla. Nam in massa. Sed vel tellus. Curabitur sem urna, consequat vel, suscipit in, mattis placerat, nulla. Sed ac leo. Pellentesque imperdiet. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. </p>
                            </div>
                        </section>
                    </div>
                    <div class="3u" id="box2">
                        <section>
                            <h2>Donec dictum metus</h2>
                            <ul class="style4">
                                <li class="first"><a href="#">Pellentesque quis elit non lectus gravida blandit sed dolore.</a></li>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></li>
                                <li><a href="#">Phasellus nec erat sit amet nibh pellentesque congue.</a></li>
                                <li><a href="#">Cras vitae metus aliquam risus pellentesque pharetra.</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="3u" id="box3">
                        <section>
                            <h2>Nulla luctus eleifend</h2>
                            <ul class="style4">
                                <li class="first"><a href="#">Pellentesque quis elit non lectus gravida blandit sed dolore.</a></li>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></li>
                                <li><a href="#">Phasellus nec erat sit amet nibh pellentesque congue.</a></li>
                                <li><a href="#">Cras vitae metus aliquam risus pellentesque pharetra.</a></li>
                            </ul>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <section>
                <p>&copy; DoFu (Dota Forum) | Images: <a href="http://fotogrph.com/">Fotogrph</a> | Design: <a href="http://templated.co/">TEMPLATED</a></p>
            </section>
        </div>
    </body>
</html>