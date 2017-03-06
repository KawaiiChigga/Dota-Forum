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
        <title>Post-Dota Forum</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <jsp:include page="header.jsp"/>
                <%                    String fail = (String) request.getAttribute("fail");
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
                                        <%
                                            PostBean pb = new PostBean();
                                            UserBean ub = new UserBean();
                                            CommentBean cb = new CommentBean();
                                            Post p = pb.getPostById(idpost);
                                            ArrayList<Comment> c = cb.getCommentById(idpost);
                                            User u = ub.getUserById(p.getUser().getIdUser());
                                        %>
                                        <%=err%>
                                        <p style="font-size:25px"><%= p.getJudul()%></p>
                                        <p style="font-size:15px">By <%= u.getUsername()%></p>
                                        <p style="font-size:12px">Posted in: <%= p.getDateTime()%></p>
                                        <p style="font-size:20px"><%= p.getIsi()%></p>
                                        <%
                                            session = request.getSession(false);
                                            session.setAttribute("post", p);
                                        %>
                                        <p><a href="LikeServlet">Likes (<%= p.getLikePost()%>)</a> -  
                                            <a href="DislikeServlet">Dislikes (<%= p.getDislikePost()%>)</a></p>
                                        <hr><hr>
                                        <p style="font-size:20px">Comments : </p>
                                        <%

                                            for (int i = 0; i < c.size(); i++) {
                                                u = ub.getUserById(c.get(i).getUser().getIdUser());
                                        %>
                                        <div>
                                            <p style="font-size:25px"><%= p.getJudul()%></p>
                                            <p style="font-size:20px"><%= u.getUsername()%></p>
                                            <p style="font-size:15px"><%= c.get(i).getIsiComment()%></p>
                                            <p><a href="#">reply</a></p>
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
