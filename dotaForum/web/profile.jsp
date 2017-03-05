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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
    </head>
    <body>
        <div id="wrapper">
            <div id="header-wrapper">
                <header id="header">
                    <div class="5grid-layout">
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
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
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
                                        ArrayList<User> data = (ArrayList<User>)
                                        request.getAttribute("dataProfile");
                                        ArrayList<Post> post = (ArrayList<Post>)
                                        request.getAttribute("dataProfile");
                                        
                                        %>
                                <tr>
                                    <td>
                                       First Name:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Last Name:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Level: 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date Joined: 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Gender: 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        E-mail: 
                                    </td>
                                </tr>
            <%
                User tmp = data.get(0);
                out.println("<tr>");
                out.println("<td>"+tmp.getFirstName()+"</td>");
                out.println("<td>"+tmp.getLastName()+"</td>");
                out.println("<td>"+tmp.getLevel()+"</td>");
                out.println("<td>"+tmp.getDateTime()+"</td>");
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
                                    </table>
                                    <table border="1 solid black">
                                        <tr>
                                            <th>Judul</th>
                                            <th colspan="2">Isi</th>
                                        </tr>
                                        <%
                                            PostBean pb = new PostBean();
                                            ArrayList<Post> p = pb.getProfilePost();
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
                    <div class="6u" id="box1">
                        <section>
                            <h2>Maecenas luctus lectus</h2>
                            <div>
                                <p><img src="images/pics05.jpg" alt="" width="180" height="120" class="imgleft">In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. Donec placerat odio vel elit. Nullam ante orci, pellentesque eget, tempus quis, ultrices in, est. Curabitur sit amet nulla. Nam in massa. Sed vel tellus. Curabitur sem urna, consequat vel, suscipit in, mattis placerat, nulla. Sed ac leo. Pellentesque imperdiet. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. </p>
                            </div>
                        </section>
                    </div>
                    <div class="3u" id="box2">
                        <section>
                            <h2>Donec dictum metus</h2>
                            <ul class="style4">
                                <li class="first"><a href="#">Pellentesque quis elit non lectus gravida blandit sed dolore.</a></li>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></li>
                                <li><a href="#">Phasellus nec erat sit amet nibh pellentesque congue.</a></li>
                                <li><a href="#">Cras vitae metus aliquam risus pellentesque pharetra.</a></li>
                            </ul>
                        </section>
                    </div>
                    <div class="3u" id="box3">
                        <section>
                            <h2>Nulla luctus eleifend</h2>
                            <ul class="style4">
                                <li class="first"><a href="#">Pellentesque quis elit non lectus gravida blandit sed dolore.</a></li>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></li>
                                <li><a href="#">Phasellus nec erat sit amet nibh pellentesque congue.</a></li>
                                <li><a href="#">Cras vitae metus aliquam risus pellentesque pharetra.</a></li>
                            </ul>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <div id="copyright" class="5grid-layout">
            <section>
                <p>&copy; DoFu (Dota Forum) | Images: <a href="http://fotogrph.com/">Fotogrph</a> | Design: <a href="http://templated.co/">TEMPLATED</a></p>
            </section>
        </div>
    </body>
</html>
