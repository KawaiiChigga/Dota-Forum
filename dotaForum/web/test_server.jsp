<%-- 
    Document   : test_server
    Created on : Apr 17, 2017, 5:06:17 PM
    Author     : Tuyu
--%>

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
//            JSONObject u = (JSONObject) JSONValue.parse(jc.getUser("17"));
            JSONObject u = jc.getUserById("17");
            out.println(u.get("first_name").toString());
            
//            JSONArray arr = (JSONArray) JSONValue.parse(jc.getAllUser());
//            for (int i = 0; i < arr.size(); i++) {
//                JSONObject ob = 
//            }

            JSONObject insert = new JSONObject();
            insert.put("first_name", "tuyu");
        %>
    </body>
</html>
