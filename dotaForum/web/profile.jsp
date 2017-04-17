<%---
    Document   : profile
    Created on : Feb 25, 2017, 1:33:50 PM
    Author     : Asus
---%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Comment"%>
<%@page import="controller.CommentBean"%>
<%@page import="controller.PostBean"%>
<%@page import="model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Dota Forum</title>
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
                            <section>
                                <%
                                    User data = (User) request.getAttribute("dataProfile");
                                    HttpSession sessionLogin = request.getSession();
                                    User sessionUser = (User) sessionLogin.getAttribute("user");
                                %>
                                <div class="post">
                                    <table border="1 solid black">
                                        <tr>
                                            <th><p style="font-size:30px">Profile</p></th>
                                            <th><p><a href="directMsgServlet?userid=<%= data.getIdUser()%>">Message(s)</p></a></th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">First Name:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.getFirstName()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Last Name:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.getLastName()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Level:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.getLevel()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Date Joined:</p> 
                                            </td>
                                            <td>
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm");
                                                    String time = "";
                                                    time = sdf.format(data.getDateTime());
                                                %>
                                                <p style="font-size:15px"><%= time%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Gender:</p> 
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.getJenisKelamin()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">E-mail:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.getEmail()%></p>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                        if (sessionUser.getUsername().equals(data.getUsername())) {
                                    %>
                                    <a href="editprofile.jsp?userid=<%=data.getIdUser()%>">Edit Profile</a>
                                    <%
                                        }
                                    %>
                                    <hr><hr>
                                    <table border="1 solid black">
                                        <%
                                            NewJerseyClient jc = new NewJerseyClient();

//                                            PostBean pb = new PostBean();
//                                            CommentBean cb = new CommentBean();
//                                            ArrayList<Post> p = pb.getProfilePost(data.getIdUser());
                                            JSONArray post = jc.getProfilePost(data.getIdUser().toString());
                                            for (int i = 0; i < post.size(); i++) {
//                                                ArrayList<Comment> c = new ArrayList<Comment>();
                                                JSONObject obj = (JSONObject) post.get(i);
                                                JSONArray c = jc.getCommentById(obj.get("id_post").toString());
//                                                c = cb.getCommentById(p.get(i).getIdPost());
                                                time = sdf.format(obj.get("date_time"));
                                        %>

                                        <tr>
                                            <td>
                                                <p style="font-size:20px"><a href="comment.jsp?post=<%=obj.get("id_post").toString()%>"><%= obj.get("judul").toString()%></a></p>
                                                <p style="font-size:15px">By <%= data.getUsername()%></p>
                                                <p style="font-size:12px">Posted in: <%= time%></p>
                                                <p><%= obj.get("like_post").toString()%> Likes -  
                                                    <%= obj.get("dislike_post").toString()%> Dislikes</p>
                                        <right>
                                            <%
                                                if (sessionUser.getUsername().equals(data.getUsername())) {
                                            %>
                                            <a href="edit.jsp?post=<%=obj.get("id_post").toString()%>">Edit Post</a>
                                            <form method="post" action="DeleteServlet?post=<%=obj.get("id_post").toString()%>">
                                                <input type='submit' name="delete" value='Delete Post'/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </right>
                                        <p><a href="comment.jsp?post=<%=obj.get("id_post").toString()%>">Comment(s) (<%= c.size()%>)</a></p>
                                        <hr>
                                        </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                    </table>
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
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
