<%-- 
    Document   : edit
    Created on : Mar 7, 2017, 1:33:13 PM
    Author     : Asus
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.NewJerseyClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post Dota Forum</title>
    </head>
    <%

        String fail = (String) request.getAttribute("fail");
        String err = "";
        if (fail != null) {
            if (fail.equals("0")) {
                err = "Post succesfully edited";
            } else if (fail.equals("1")) {
                err = "Post not edited";
            } else {
                err = "";
            }
        }
    %>
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
                                    HttpSession sessionLogin = request.getSession();
                                    JSONObject sessionUser = (JSONObject) sessionLogin.getAttribute("user");
                                    int id = Integer.parseInt(request.getParameter("post"));
                                    NewJerseyClient jc = new NewJerseyClient();
                                    JSONObject post = jc.getPostById(Integer.toString(id));
//                                    PostBean pb = new PostBean();
//                                    Post p = pb.getPostById(id);
                                %>
                                <div class="post">
                                    <form method="POST" action="EditServlet?postid=<%=post.get("id_post").toString()%>" id="post_disc">
                                        <h2>Post it!</h2>
                                        <p style="color:red"><b><%=err%></b><p>
                                        <center>
                                            <input type="text" name="post_title" placeholder="Post Title" value="<%=post.get("judul").toString() %>" style="width:50%;height:30px;border-radius:5px;"><br><br>
                                            
                                            <input type="hidden" name="userid" value="<%= sessionUser.get("id_user").toString() %>">
                                            <textarea placeholder="What do you wanna say?" name="post_isi" id="post_disc" style="border-radius:5px;" rows="15"><%=post.get("isi").toString() %></textarea><br><br>
                                            <input type="submit" name="post_disc" value="Edit Post" style="width:70%;height:50px;border-radius:5px;"><br><br>
                                            <input type="submit" name="post_cancel" value="Cancel" style="width:70%;height:30px;border-radius:5px;" formaction="index.jsp"><br>
                                        </center>
                                    </form>
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
