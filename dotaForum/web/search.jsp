<%-- 
    Document   : search
    Created on : Mar 7, 2017, 10:08:37 PM
    Author     : Tuyu
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="client.NewJerseyClient"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search-Dota Forum</title>
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
                            <h2 style="font-size:25px;">Search Result(s):</h2>
                            <hr>
                            <%
                                String search = request.getParameter("search");
                                NewJerseyClient jc = new NewJerseyClient();
//                                PostBean pb = new PostBean();
//                                UserBean ub = new UserBean();
//                                CommentBean cb = new CommentBean();
//                                ArrayList<Post> p = new ArrayList<Post>();
                                JSONArray post = jc.getPostSearch(search);
//                                p = pb.getPostSearch(search);
                                if (post.size() <=0) {
                            %>
                            <p>No result found for "<%= search%>"</p>
                            <%
                            } else {
                                for (int i = 0; i < post.size(); i++) {
                                    JSONObject obj = (JSONObject) post.get(i);
                                    JSONObject user = jc.getUserById(obj.get("id_user").toString());
//                                    User u = ub.getUserById(p.get(i).getUser().getIdUser());
//                                    ArrayList<Comment> c = new ArrayList<Comment>();
                                    JSONArray c = jc.getCommentById(obj.get("id_post").toString());
//                                    c = cb.getCommentById(p.get(i).getIdPost());
%>

                            <p style="font-size:20px"><a href="comment.jsp?post=<%=obj.get("id_post")%>"><%= obj.get("judul").toString()%></a></p>
                            <p style="font-size:15px"><a href="ProfileServlet?userid=<%= user.get("id_user").toString()%>">By <%= user.get("username").toString()%></a></p>
                            <p style="font-size:12px">Posted in: <%= obj.get("date_time").toString()%></p>
                            <p><a href="#"><%= obj.get("like_post").toString()%> Likes</a> -  
                                <a href="#"><%= obj.get("dislike_post").toString()%> Dislikes</a></p>
                            <p><a href="comment.jsp?post=<%=obj.get("id_post").toString()%>">Comment (<%= c.size()%>)</a></p>
                            <hr>

                            <%
                                    }
                                }
                            %>
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
