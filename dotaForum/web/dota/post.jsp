<%-- 
    Document   : post
    Created on : Feb 25, 2017, 12:47:54 PM
    Author     : Tuyu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post</title>
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
                                        <ul>
                                            <li class="current_page_item"><a href="">All</a></li>
                                            <li><a href="">Chat</a></li>
                                            <li><a href="">Competitive</a></li>
                                            <li><a href="">Custom Game</a></li>
                                            <li><a href="">Media</a></li>
                                            <li><a href="">Recruitement</a></li>
                                            <li><a href="">Strategy</a></li>
                                        </ul>
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
                                <div class="post">
                                    <form method="post" action="#" id="post_disc">
                                        <center>
                                            <input type="text" name="post_title" placeholder="Post Title" id="post_disc"><br><br>
                                            <textarea placeholder="What do you wanna say?" id="post_disc" rows="15"> </textarea><br><br>
                                            <input type="submit" name="post_disc" value="Post it!" id="post_disc"><br>
                                            <input type="submit" name="post_cancel" value="Cancel" id="post_disc"><br>
                                        </center>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="3u">
                        <div id="sidebar2">
                            <section>
                                <div class="sbox1">
                                    <ul class="style1">
                                        <li><input class="search" type="text" name="search" placeholder="Search"></li>
                                        <li><input style="width:100%;border-radius:5px;" type="button" name="newpost" value="Start a new discussion"></li>
                                        <li><input style="width:100%;border-radius:5px;" type="button" name="newpost" value="Feedback and Support"></li>
                                        <li><input style="width:100%;border-radius:5px;" type="button" name="newpost" value="Forum Rules"></li>
                                        <li>
                                            <div style="width:100%">
                                                <p><b>Please be kind to your fellow forum users.</b></p>
                                                <p>Administrators/Moderators reserve the right to move, change or delete any content at any time if they feel it is inappropiate or unsuitable. </p>
                                            </div>
                                        </li>
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
