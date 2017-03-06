<%-- 
    Document   : index
    Created on : Feb 25, 2017, 12:40:04 PM
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
<<<<<<< HEAD
        <title>DotaForum</title>
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
=======
        <title>Home-Dota Forum</title>
>>>>>>> origin/master
    </head>
    <body>
        <div id="wrapper">
            <%
               String temp = request.getParameter("menu");
            %>
            <div id="header-wrapper">
<<<<<<< HEAD
                <header id="header">
                    <div class="5grid-layout">


                        <%
                            HttpSession Login = request.getSession(false);
                            String check = (String) Login.getAttribute("check");
                            if (check != null) {
                        %>
                        <p>
                            <a href="LogoutServlet">Log out</a>
                        </p>
                        <%                            } else {
                        %>
                        <p>
                            <a href="login.jsp">Log In</a>&nbsp&nbsp&nbsp
                            <a href="register.jsp">Register</a>
                        </p>
                        <%
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
=======
                <jsp:include page="header.jsp?menu=<%=temp%>"/>
>>>>>>> origin/master
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
                                            ArrayList<Post> p = pb.getAllPost();
                                            for (int i = 0; i < p.size(); i++) {
                                                User u = ub.getUserById(p.get(i).getUser().getIdUser());
                                                ArrayList<Comment> c = new ArrayList<Comment>();
                                                c = cb.getCommentById(p.get(i).getIdPost());
                                        %>
                                        <div>
                                            <p><%= u.getFullName()%> - <%= p.get(i).getDateTime()%></p>
                                            <p><%= p.get(i).getJudul()%></p>
                                            <p><%= p.get(i).getIsi()%></p>
                                            <p><a href="#"><%= p.get(i).getLike()%></a> -  
                                                <a href="#"><%= p.get(i).getDislike()%></a></p>
                                            <p><a href="comment.jsp?post=<%=p.get(i).getIdPost()%>">Comment (<%= c.size()%>)</a></p>
                                            <hr>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </table>
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
                                            <li><input style="width:100%;border-radius:5px;" type="submit" name="newpost" value="Start a new discussion" formaction="postServlet" formmethod="get"></li>
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
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
