<%-- 
    Document   : comment
    Created on : Mar 1, 2017, 5:39:17 AM
    Author     : Tuyu
--%>

<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post-Dota Forum</title>
    </head>
    <body>
        <script src=jquery-1.11.3.min.js></script>
        <script>
            $(document).ready(function () {
                $("#formComment").hide();
                $("#btnComment").click(function () {
                    $("#formComment").toggle(750);
                });
            });
        </script>
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
                    String idpost = "";
                    if (request.getParameter("post") != null) {
                        idpost = request.getParameter("post");
                    }
                %>
            </div>
            <div id="page-wrapper" class="5grid-layout">
                <div class="row">
                    <div class="9u">
                        <div id="content">
                            <section>
                                <div class="post">
                                    <table border="1 solid black">
                                        <%
                                            NewJerseyClient jc = new NewJerseyClient();
                                            JSONObject post = jc.getPostById(idpost);
                                            JSONObject user = jc.getUserById(post.get("id_user").toString());

                                            int idPost = Integer.parseInt(post.get("id_post").toString());
                                            JSONArray comment = jc.getCommentById(Integer.toString(idPost));
                                            ArrayList<Integer> idUserComment = new ArrayList();
                                            int idUser;
                                            for (int i = 0; i < comment.size(); i++) {
                                                JSONObject obj = (JSONObject) comment.get(i);
                                                idUser = Integer.parseInt(obj.get("id_user").toString());

                                                idUserComment.add(idUser);
                                            }
                                            System.out.println(idUserComment.size());
                                            int u = Integer.parseInt(user.get("id_user").toString());

                                            String date_time = "";
                                            date_time = post.get("date_time").toString();
                                            String[] date = date_time.split("T");
                                            String[] time = date[1].split(":");
                                            date_time = date[0] + " " + time[0] + ":" + time[1];
                                        %>
                                        <%=err%>

                                        <p style="font-size:25px"><%= post.get("judul").toString()%></p>
                                        <p style="font-size:20px">By <%= user.get("username")%></p>
                                        <p style="font-size:12px">Posted in: <%= date_time%></p>
                                        <p style="font-size:20px"><%= post.get("isi").toString()%></p>
                                        <%
                                            session = request.getSession(false);
                                            if (session.getAttribute("check") != null) {
                                        %>  <p>
                                            <a href="LikeServlet?user=<%=u%>&post=<%=post.get("id_post").toString()%>">Likes (<%= post.get("like_post").toString()%>)</a> -  
                                            <a href="DislikeServlet?user=<%=u%>&post=<%=post.get("id_post").toString()%>">Dislikes (<%= post.get("dislike_post").toString()%>)</a>
                                        </p>

                                        <%
                                        } else {
                                        %>
                                        <p><a href="#">Likes (<%= post.get("like_post").toString()%>)</a> -  
                                            <a href="#">Dislikes (<%= post.get("dislike_post").toString()%>)</a></p>

                                        <%
                                            }
                                        %>

                                        <hr><hr>
                                        <p style="font-size:20px">Comments : </p>
                                        <%
                                            for (int i = 0; i < comment.size(); i++) {
                                                JSONObject tempUser = jc.getUserById(idUserComment.get(i).toString());
//                                                int u = ub.getUserById(idUserComment.get(i));
                                                JSONObject obj = (JSONObject) comment.get(i);
                                                date_time = "";
                                                date_time = obj.get("date_time").toString();
                                                date = date_time.split("T");
                                                time = date[1].split(":");
                                                date_time = date[0] + " " + time[0] + ":" + time[1];
                                        %>
                                        <div>
                                            <p style="font-size:20px"><a href="ProfileServlet?userid=<%= tempUser.get("id_user")%>"><%= tempUser.get("username")%></a> - 
                                                <b style="font-size:15px">Commented in: <%= date_time%></b>
                                            </p>
                                            <p style="font-size:15px"><%= obj.get("isi_comment").toString()%></p>
                                            <hr>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </table>
                                    <br><br>
                                    <form method="POST" action="CommentServlet" id="formComment">
                                        <p style="font-size:20px">Post a Comment!</p>
                                        <center>
                                            <input type="hidden" name="id_post" value="<%= idpost%>"> 
                                            <textarea placeholder="What do you wanna say?" name="isi_comment" id="post_disc" style="border-radius:5px;" rows="5"> </textarea>
                                        </center><br><br>
                                        <center>
                                            <input type="submit" name="post_disc" value="Post Comment" style="width:80%;height:30px;border-radius:5px;"><br><br>
                                        </center>
                                    </form>
                                    <center><button style="border-radius:5px;width:80%;height:40px;background-color:#193149;color:whitesmoke;font-family:Trebuchet MS;font-size:20px;" id="btnComment">Comment Post</button></center>
                                </div>
                            </section>
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
            <section>
                <jsp:include page="copyright.jsp"/>
            </section>
        </div>
    </body>
</html>
