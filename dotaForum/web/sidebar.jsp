<%-- 
    Document   : sidebar
    Created on : Mar 7, 2017, 1:47:54 PM
    Author     : Tuyu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
