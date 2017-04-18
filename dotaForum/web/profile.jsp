<%---
    Document   : profile
    Created on : Feb 25, 2017, 1:33:50 PM
    Author     : Asus
---%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.util.ArrayList"%>
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
                                    JSONObject data = (JSONObject) request.getAttribute("dataProfile");
                                    HttpSession sessionLogin = request.getSession();
                                    JSONObject sessionUser = (JSONObject) sessionLogin.getAttribute("user");
                                %>
                                <div class="post">
                                    <table border="1 solid black">
                                        <tr>
                                            <th><p style="font-size:30px">Profile</p></th>
                                                <th><p><a href="directMsgServlet?userid=<%= data.get("id_user").toString() %>">Message(s)</p></a></th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">First Name:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.get("first_name").toString()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Last Name:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.get("last_name").toString()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Level:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.get("level").toString()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Date Joined:</p> 
                                            </td>
                                            <td>
                                                <%
                                                    String time = "";
                                                    time = data.get("date_time").toString();
                                                %>
                                                <p style="font-size:15px"><%= time%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">Gender:</p> 
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.get("jenis_kelamin").toString()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p style="font-size:15px">E-mail:</p>
                                            </td>
                                            <td>
                                                <p style="font-size:15px"><%=data.get("email").toString()%></p>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                        if (sessionUser.get("username").toString().equals(data.get("username").toString())) {
                                    %>
                                    <a href="editprofile.jsp?userid=<%=data.get("id_user").toString()%>">Edit Profile</a> -
                                    <a href="stats.jsp?username=<%=data.get("username").toString()%>">Show Stats</a>
                                    <br>
                                    <h3><jsp:include page="shareFB.jsp"/></h3>
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
                                            JSONArray post = jc.getProfilePost(data.get("id_user").toString());
                                            for (int i = 0; i < post.size(); i++) {
//                                                ArrayList<Comment> c = new ArrayList<Comment>();
                                                JSONObject obj = (JSONObject) post.get(i);
                                                JSONArray c = jc.getCommentById(obj.get("id_post").toString());
//                                                c = cb.getCommentById(p.get(i).getIdPost());
                                                time = obj.get("date_time").toString();
                                        %>

                                        <tr>
                                            <td>
                                                <p style="font-size:20px"><a href="comment.jsp?post=<%=obj.get("id_post").toString()%>"><%= obj.get("judul").toString()%></a></p>
                                                <p style="font-size:15px">By <%= data.get("username").toString()%></p>
                                                <p style="font-size:12px">Posted in: <%= time%></p>
                                                <p><%= obj.get("like_post").toString()%> Likes -  
                                                    <%= obj.get("dislike_post").toString()%> Dislikes</p>
                                        <right>
                                            <%
                                                if (sessionUser.get("username").toString().equals(data.get("username").toString())) {
                                            %>
                                            <a href="edit.jsp?post=<%= obj.get("id_post").toString()%> %>">Edit Post</a>
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
