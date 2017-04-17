<%-- 
    Document   : test_server
    Created on : Apr 17, 2017, 5:06:17 PM
    Author     : Tuyu
--%>

<%@page import="model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.NewJerseyClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
//            NewJerseyClient jc = new NewJerseyClient();
////            JSONObject u = (JSONObject) JSONValue.parse(jc.getUser("17"));
//            JSONObject u = jc.getUserById("17");
//            out.println(u.get("first_name").toString());
//            
////            JSONArray arr = jc.getReplyByCommentId("8");
////            for (int i = 0; i < arr.size(); i++) {
////                JSONObject ob = (JSONObject) arr.get(i);
////                String id = ob.get("id_user").toString();
////            }
//
//            JSONObject update = new JSONObject();
//            update.put("first_name", "tuyu");
////            jc.insertUser(update,id);

            NewJerseyClient jc = new NewJerseyClient();
            JSONObject post = jc.getPostById("9");
            JSONObject user = jc.getUserById(post.get("id_user").toString());
            out.println(post.get("date_time").toString());
            out.println(jc.getCommentById("9"));
            out.println("-------------------------------\n");
            JSONArray c = jc.getCommentById("9");
            for(int i=0;i<c.size();i++){
                JSONObject ob = (JSONObject) c.get(i);
                out.println(ob.get("id_comment").toString()+"\n");
            }
        %>
    </body>
</html>
