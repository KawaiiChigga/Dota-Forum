<%-- 
    Document   : test_share
    Created on : Apr 18, 2017, 9:27:10 PM
    Author     : Tuyu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Your Website Title</title>
        <!-- You can use Open Graph tags to customize link previews.
        Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
        <!--http://localhost:8080/dotaForum/index.jsp?menu=1&sort=1-->
        <meta property="og:url"           content="https://web.facebook.com/cgt31" />
        <meta property="og:type"          content="website" />
        <meta property="og:title"         content="Share Facebook" />
        <meta property="og:description"   content="Your description" />
        <meta property="og:image"         content="img/facebookloginbutton.png" />
    </head>
    <body>
        <!-- Load Facebook SDK for JavaScript -->
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1463138227061323";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

        <!-- Your share button code -->
        <div class="fb-share-button" 
             data-href="https://web.facebook.com/cgt31" 
             data-layout="button_count">
        </div>

    </body>
</html>
