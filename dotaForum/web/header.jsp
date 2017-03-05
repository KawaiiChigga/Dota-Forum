<%-- 
    Document   : header
    Created on : Mar 5, 2017, 8:41:49 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

        <header id="header">
            <div class="5grid-layout">


                <%
                    HttpSession Login = request.getSession(false);

                    if (Login.getAttribute("check") != null) {
                %>

                <p>
                    <a href="LogoutServlet">Log out</a>
                    <a href="ProfileServlet">Profile</a>
                </p>
                <%                            } else {
                %><p>
                    <a href="login.jsp">Log In</a>&nbsp&nbsp&nbsp
                    <a href="register.jsp">Register</a>
                </p>
                <%
                    }
                %>
                <div class="row">
                    <div class="12u" id="logo"> <!-- Logo -->
                        <h1><a href="index.jsp" class="mobileUI-site-name">Dofu</a></h1>
                    </div>

                </div>
            </div>
            <div class="5grid-layout">
                <div class="row">
                    <div class="12u" id="menu">
                        <div id="menu-wrapper">
                            <nav class="mobileUI-site-nav">
                                <ul>
                                    <li class="current_page_item"><a href="">All</a></li>
                                    <li><a href="">Chat</a></li>
                                    <li><a href="">Competitive</a></li>
                                    <li><a href="">Custom Game</a></li>
                                    <li><a href="">Media</a></li>
                                    <li><a href="">Recruitment</a></li>
                                    <li><a href="">Strategy</a></li>
                                    <li><a href="">Profile</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>