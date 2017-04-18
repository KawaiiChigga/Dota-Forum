<%-- 
    Document   : login
    Created on : Feb 25, 2017, 12:46:01 PM
    Author     : Tuyu
--%>

<%@page import="fb.FBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Log in</title>

        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

        <link rel="stylesheet" href="css/5grid/core.css" />
        <link rel="stylesheet" href="css/5grid/core-desktop.css" />
        <link rel="stylesheet" href="css/5grid/core-1200px.css" />
        <link rel="stylesheet" href="css/5grid/core-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row text-center " style="padding-top:100px;">
                <div    class="col-md-12">
                    <div class="12u" id="logo"> <!-- Logo -->
                        <h1><a href="index.jsp?menu=1" class="mobileUI-site-name" style="color:#B22F2F;">Dofu</a></h1>
                    </div>
                </div>
            </div>
            <div class="row ">

                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <%
                        String warning = (String) request.getAttribute("warning");
                        String registerBerhasil = (String) request.getAttribute("berhasil");
                        boolean accBaru = false;
                        if (warning != null) {
                            out.println("&nbsp&nbsp&nbsp&nbsp" + warning);
                        }
                        if (registerBerhasil != null) {
                            out.println("&nbsp&nbsp&nbsp&nbsp" + registerBerhasil);
                            accBaru = true;
                        }
                        request.setAttribute("berhasil", null);
                        FBConnection fbConnection = new FBConnection();
                    %>
                    <div class="panel-body">
                        <form action="login" method="post">
                            <hr />
                            <div class="form-group input-group"
                                 style="height: 32px; width: 61px;">
                                <center>
                                    <a href="<%=fbConnection.getFBAuthUrl()%>">
                                        <img src="img/facebookloginbutton.png" alt=""/>
                                    </a> 
                                </center>
                            </div>
                            <center><h5>OR</h5></center>
                            <br>
                            <%
                                HttpSession loginSession = request.getSession();

                                String x = "";
                                String y = "";
                                if (loginSession.getAttribute("check") != null) {
                                    x = (String) request.getAttribute("username");
                                    y = (String) request.getAttribute("password");
                                } else if (accBaru) {
                                    x = (String) request.getAttribute("username");
                                }
                                loginSession.invalidate();
                            %>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                <input type="text" class="form-control" placeholder="Your Username" name="username" value="<%=x%>"/>
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>

                                <input type="password" class="form-control"  placeholder="Your Password" name="password" value="<%=y%>"/>
                            </div>
                            <div class="form-group">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="remember" value="yes"/> Remember me
                                </label>
                            </div>
                            <input type="submit" value="Login Now" name="login" class="btn btn-primary">
                            <hr>
                            Don't Have account ? <a href="register.jsp">Sign Up</a> here
                        </form>
                    </div>
                </div>   
            </div>

        </div>
    </body>
</html>
