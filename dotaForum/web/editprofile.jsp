<%-- 
    Document   : editprofile
    Created on : Mar 7, 2017, 3:05:33 PM
    Author     : Asus
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.NewJerseyClient"%>
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
                        <h1><a href="index.jsp?menu=1" class="mobileUI-site-name" style="color:#B22F2F;">Dofu</a></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <%
                        String warning = (String) request.getAttribute("warningRegister");
                        if (warning != null) {
                            out.println("&nbsp&nbsp&nbsp" + warning);
                        }
                        request.setAttribute("warningRegister", "");
                        NewJerseyClient jc = new NewJerseyClient();
//                        UserBean ub = new UserBean();
                        int uid = Integer.parseInt(request.getParameter("userid"));
                        JSONObject temp = jc.getUserById(Integer.toString(uid));
//                        User temp = (User) ub.getUserById(uid);
%>
                    <div class="panel-body">

                        <form method="post" action="EditProfileServlet?userid=<%=uid%>">
                            <div class="form-group col-md-6">
                                <label for="first_name">First name:</label>
                                <input type="text" class="form-control" name = "first_name" value="<%=temp.get("first_name").toString()%>" placeholder="First name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="last_name">Last name:</label>
                                <input type="text" class="form-control" name = "last_name" value="<%=temp.get("last_name").toString()%>" placeholder="Last name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Email address:</label><span class="alert-danger"><?php echo $emailErr; ?></span>
                                <input type="email" class="form-control" name="email" value="<%=temp.get("email").toString()%>" placeholder="Email address">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="password">New Password:</label><span class="alert-danger"><?php echo $passErr; ?></span>
                                <input type="password" class="form-control" name="password" placeholder="Password" value="<%=temp.get("password").toString()%>">
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
                                <%                                    String gender = temp.get("jenis_kelamin").toString();
                                    if (gender.equals("L")) {
                                %>
                                <input type="radio" name="gender" value="L" checked="checked"> Male
                                <input type="radio" name="gender" value="P" > Female
                                <%
                                } else {
                                %>
                                <input type="radio" name="gender" value="L" > Male
                                <input type="radio" name="gender" value="P" checked="checked"> Female
                                <%
                                    }
                                %>


                                <span class="alert-danger"><?php echo $genderErr; ?></span>
                            </div>
                            <div class="form-group col-md-12">
                                <center>
                                    <input type='submit' name="submit" value='Edit Profile' class="btn btn-primary">
                                    <span class="alert-success"><?php echo $done; ?></span>
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

