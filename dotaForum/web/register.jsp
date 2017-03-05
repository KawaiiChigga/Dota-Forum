<%-- 
    Document   : register
    Created on : Feb 25, 2017, 12:48:55 PM
    Author     : Tuyu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign Up</title>

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
    </head>
    <body>
        <div class="container">
            <div class="row text-center " style="padding-top:10px;">
                <div class="col-md-12">
                    <div class="12u" id="logo"> <!-- Logo -->
                        <h1><a href="#" class="mobileUI-site-name" style="color:#B22F2F;">Dofu</a></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <%
                        String warning = (String) request.getAttribute("warningRegister");
                        if (warning != null) {
                            out.println("&nbsp&nbsp&nbsp"+warning);
                        }
                        request.setAttribute("warningRegister", "");
                    %>
                    <div class="panel-body">

                        <form method="post" action="/dotaForum/RegisterServlet">
                            <div class="form-group col-md-6">
                                <label for="first_name">First name:</label>
                                <input type="text" class="form-control" name = "first_name" placeholder="First name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="last_name">Last name:</label>
                                <input type="text" class="form-control" name = "last_name" placeholder="Last name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="username">Username:</label> (Can't be changed)<span class="alert-danger"><?php echo $nameErr; ?></span>
                                <input type="text" class="form-control" name = "username" placeholder="Username">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Email address:</label><span class="alert-danger"><?php echo $emailErr; ?></span>
                                <input type="email" class="form-control" name="email" placeholder="Email address">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="password">Password:</label><span class="alert-danger"><?php echo $passErr; ?></span>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                                <%
                                    String passWarning = request.getParameter("warningPassLength");
                                    if (passWarning != null) {
                                        out.print(passWarning);
                                    }
                                    
                                %>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="password2">Re-type Password:</label><span class="alert-danger"><?php echo $pass2Err; ?></span>
                                <input type="password" class="form-control" name = "password2" placeholder="Re-type password">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="gender">Gender</label> &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="gender" value="L"> Male
                                <input type="radio" name="gender" value="M"> Female
                                <span class="alert-danger"><?php echo $genderErr; ?></span>
                            </div>
                            <div class="form-group col-md-12">
                                <center>
                                    <br><input type="checkbox" name="terms_condition" value="1"><a href="terms.htm"> Terms & Condition</a><br><br>
                                    <input type='submit' name="submit" value='Sign Up!' class="btn btn-primary">
                                    <span class="alert-success"><?php echo $done; ?></span>
                                </center>
                            </div>
                            <div class="form-group col-md-12">
                                <center>
                                    <a href="login.jsp">Back to Login</a>
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
