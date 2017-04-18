<%-- 
    Document   : test_server
    Created on : Apr 17, 2017, 5:06:17 PM
    Author     : Tuyu
--%>

<%@page import="java.util.Date"%>
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
            NewJerseyClient jc = new NewJerseyClient();
            JSONObject u = jc.getPostById("8");
            out.println(u.get("id_post").toString());
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

//            NewJerseyClient jc = new NewJerseyClient();
//            JSONArray c = jc.getAllPost("new");
//            JSONObject post = jc.getPostById("9");
//            JSONObject user = jc.getUserById(post.get("id_user").toString());
//            out.println(post.get("date_time").toString());
//            out.println(jc.getCommentById("9"));
//            out.println("-------------------------------\n");
//            JSONArray c = jc.getCommentById("9");
//            for(int i=0;i<c.size();i++){
//                JSONObject ob = (JSONObject) c.get(i);
//                out.println(ob.get("id_post").toString()+"\n");
//            }
//            boolean dis = jc.checkDislikeUser("8", "16");
//            out.println(dis);
//
//            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm:ss");
//            String time = "";
//            time = sdf.format(new Date());
//            out.println(time);
//            dis = jc.checkDislikeUser("8", "16");
//            out.println(dis);
%>
    </body>
</html>
