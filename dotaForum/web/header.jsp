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
                                    <%
                                        String temp[] = new String[8];
                                        System.out.println(request.getParameter("menu"));
                                        if (request.getParameter("menu") != null) {

                                            String jenis = request.getParameter("menu");

                                            if (jenis.equals("1")) {
                                                temp[0] = "current_page_item";
                                            } else if (jenis.equals("2")) {
                                                temp[1] = "current_page_item";
                                            } else if (jenis.equals("3")) {
                                                temp[2] = "current_page_item";
                                            } else if (jenis.equals("4")) {
                                                temp[3] = "current_page_item";
                                            } else if (jenis.equals("5")) {
                                                temp[4] = "current_page_item";
                                            } else if (jenis.equals("6")) {
                                                temp[5] = "current_page_item";
                                            } else if (jenis.equals("7")) {
                                                temp[6] = "current_page_item";
                                            } else if (jenis.equals("8")) {
                                                temp[7] = "current_page_item";
                                            }
                                        } else {
                                            temp[0] = "current_page_item";
                                        }
                                    %>

                                    <li class="<%=temp[0]%>"><a href="index.jsp?menu=1">All</a></li>
                                    <li class="<%=temp[1]%>"><a href="index.jsp?menu=2">Chat</a></li>
                                    <li class="<%=temp[2]%>"><a href="index.jsp?menu=3">Competitive</a></li>
                                    <li class="<%=temp[3]%>"><a href="index.jsp?menu=4">Custom Game</a></li>
                                    <li class="<%=temp[4]%>"><a href="index.jsp?menu=5">Media</a></li>
                                    <li class="<%=temp[5]%>"><a href="index.jsp?menu=6">Recruitment</a></li>
                                    <li class="<%=temp[6]%>"><a href="index.jsp?menu=7">Strategy</a></li>
                                    <li class="<%=temp[7]%>"><a href="index.jsp?menu=8">Profile</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>