<%---
    Document   : profile
    Created on : Feb 25, 2017, 1:33:50 PM
    Author     : Asus
---%>

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
                                <%
                                    ArrayList<User> data = (ArrayList<User>)
                                    request.getAttribute("dataProfile");
                                 %>
                                <div class="post">
                                <table border="1 solid black">
                                <tr>
                                    <td>
                                       First Name:
                                    </td>
                                    <td>
                                        <%=data.get(0).getFirstName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Last Name:
                                    </td>
                                    <td>
                                        <%=data.get(0).getLastName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Level: 
                                    </td>
                                    <td>
                                        <%=data.get(0).getLevel()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date Joined: 
                                    </td>
                                    <td>
                                        <%=data.get(0).getDateTime()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Gender: 
                                    </td>
                                    <td>
                                        <%=data.get(0).getJenisKelamin()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        E-mail: 
                                    </td>
                                    <td>
                                        <%=data.get(0).getEmail()%>
                                    </td>
                                </tr>
<<<<<<< HEAD
            <%
               User tmp = data.get(0);
                out.println("<tr>");
                out.println("<td>"+tmp.getFirstName()+"</td>");
                out.println("<td>"+tmp.getLastName()+"</td>");
                out.println("<td>"+tmp.getLevel()+"</td>");
               out.println("<td>"+tmp.getJenisKelamin()+"</td>");
                out.println("<td>"+tmp.getEmail()+"</td>");
                out.println("</tr>");
                out.println("</table>");
                
                for(int i=0;i<post.size();i++){
                    out.println(post.get(i).getJudul());
                    out.println(post.get(i).getDateTime());
                    out.println(post.get(i).getLikePost());
                    out.println(post.get(i).getDislikePost());
                }
            %>
        
=======
                                    </table>
                                    <table border="1 solid black">
                                        <%
                                            PostBean pb = new PostBean();
<<<<<<< HEAD
                                            ArrayList<Post> p = pb.getProfilePost(data.get(0).getUsername());
=======
                                            ArrayList<Post> p = pb.getAllPost();
>>>>>>> origin/master
                                            for (int i = 0; i < p.size(); i++) {
                                        %>

                                        <tr>
                                            <td><%=p.get(i).getJudul()%></td>
                                            <td colspan="2"><%=p.get(i).getIsi()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                    </table>
                                 </div>
>>>>>>> origin/master
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
            <jsp:include page="copyright.jsp"/>
        </div>
    </body>
</html>
