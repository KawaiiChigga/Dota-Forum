<%-- 
    Document   : post
    Created on : Feb 25, 2017, 12:47:54 PM
    Author     : Tuyu
--%>

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
                err = "Post succesfully added";
            } else if (fail.equals("1")) {
                err = "Post not added";
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
                                <div class="post">
                                    <form method="POST" action="postServlet" id="post_disc">
                                        <h2>Post it!</h2>
                                        <p style="color:red"><b><%=err%></b><p>
                                        <center>
                                            <input type="text" name="post_title" placeholder="Post Title" style="width:50%;height:30px;border-radius:5px;"><br><br>
                                            <select name="category" style="width:50%;height:30px;border-radius:5px;">
                                                <option value="Chat">Chat</option>
                                                <option value="Competitive">Competitive</option>
                                                <option value="Custom Game">Custom Game</option>
                                                <option value="Media">Media</option>
                                                <option value="Recruitment">Recruitment</option>
                                                <option value="Strategy">Strategy</option>
                                            </select>
                                            <textarea placeholder="What do you wanna say?" name="post_isi" id="post_disc" style="border-radius:5px;" rows="15"> </textarea><br><br>
                                            <input type="submit" name="post_disc" value="Post it!" style="width:70%;height:50px;border-radius:5px;"><br><br>
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
