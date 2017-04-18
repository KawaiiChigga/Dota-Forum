/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 * Jersey REST client generated for REST resource:CobaWS [cobaWS]<br>
 * USAGE:
 * <pre>
 *        NewJerseyClient client = new NewJerseyClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Tuyu
 */
public class NewJerseyClient {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://127.0.0.1:8000/";
//    private static final String BASE_URI = "http://192.168.50.1:8000/";

    public NewJerseyClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }
    // ? -> query
    // / -> path

//---------------------------- USER ----------------------------
    public JSONObject getUserById(String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("user").path(pk);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONObject) JSONValue.parse(json);
    }
    
    public boolean checkUser(String username, String email) {
        WebTarget resource = webTarget;
        resource = resource.path("user").path("check").path(username).path(email+"/");
        String json = "";
        json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        if ((JSONObject) JSONValue.parse(json)!=null) {
            return true;
        } else {
            return false;
        }
    }

    public boolean insertUser(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("user/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONObject checkLogIn(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("user").path("login/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(Entity.json(obj.toJSONString()), String.class);
        return (JSONObject) JSONValue.parse(json);
    }

    public boolean updateUser(JSONObject obj, String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("user").path(pk);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

//---------------------------- REPLY ----------------------------
    public JSONArray getReplyByCommentId(String id_comment) {
        WebTarget resource = webTarget;
        resource = resource.path("reply").path(id_comment);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public boolean insertReply(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("reply");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public boolean deleteReply(String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("reply").path("delete").path(pk);
        Response json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get();
        return true;
    }

//---------------------------- POST ----------------------------
    public boolean insertPost(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("post/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public boolean updatePost(JSONObject obj, String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path(pk+"/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONObject getPostById(String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path(pk);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONObject) JSONValue.parse(json);
    }

    public JSONArray getAllPost(String jenis) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path(jenis);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }
    
    public JSONArray getPostByUser(String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path("user").path(id_user);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public JSONArray getPostByCategory(String jenis, String sort) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path("category").path(jenis).path(sort);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public JSONArray getProfilePost(String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path("profile").path(id_user);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public JSONArray getPostSearch(String judul) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path("search").path(judul);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }
    
    public boolean deletePost(String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("post").path("delete").path(pk);
        Response json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get();
        return true;
    }
//---------------------------- MESSAGE ----------------------------
    public boolean insertMessage(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("message");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONArray getInbox(String id_receiver) {
        WebTarget resource = webTarget;
        resource = resource.path("message").path("inbox").path(id_receiver);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }
    
    public JSONArray getMsgBySender(String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("message").path("sender").path(id_user);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }
    
    public JSONArray getMsgByReceiver(String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("message").path("receiver").path(id_user);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public JSONArray getMsgFromId(String id_sender, String id_receiver) {
        WebTarget resource = webTarget;
        resource = resource.path("message").path("inbox").path(id_sender).path(id_receiver);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

//---------------------------- CATEGORIES ----------------------------
    public JSONObject getCategory(String category) {
        WebTarget resource = webTarget;
        resource = resource.path("categories").path(category+"/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONObject) JSONValue.parse(json);
    }

//---------------------------- COMMENT ----------------------------
    public boolean insertComment(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("comment/");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONArray getCommentById(String id_post) {
        WebTarget resource = webTarget;
        resource = resource.path("comment").path(id_post);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }
    
    public JSONArray getCommentByUser(String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("comment").path("user").path(id_user);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public boolean deleteComment(String pk) {
        WebTarget resource = webTarget;
        resource = resource.path("reply").path("delete").path(pk);
        Response json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get();
        return true;
    }

//---------------------------- LIKE ----------------------------
    public boolean addLike(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("likes");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONArray getAllLikes(String id_post) {
        WebTarget resource = webTarget;
        resource = resource.path("likes").path(id_post);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public boolean checkLikeUser(String id_post, String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("likes").path("check").path(id_post).path(id_user);
        String json = "";
        json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        if (!json.equals("")) {
            return true;
        } else {
            return false;
        }
    }

    public boolean deleteLike(String id_post, String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("likes").path("delete").path(id_post).path(id_user);
        Response json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get();
        return true;
    }

    public boolean addDislike(JSONObject obj) {
        WebTarget resource = webTarget;
        resource = resource.path("dislike");
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(obj.toJSONString()), String.class);
        return true;
    }

    public JSONArray getAllDislike(String id_post) {
        WebTarget resource = webTarget;
        resource = resource.path("dislikes").path(id_post);
        String json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONArray) JSONValue.parse(json);
    }

    public boolean checkDislikeUser(String id_post, String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("dislikes").path("check").path(id_post).path(id_user);
        String json = "";
        json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        JSONObject obj = (JSONObject) JSONValue.parse(json);
        return Boolean.parseBoolean(obj.get("message").toString());
    }

    public boolean deleteDislike(String id_post,String id_user) {
        WebTarget resource = webTarget;
        resource = resource.path("dislikes").path("delete").path(id_post).path(id_user);
        Response json = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get();
        return true;
    }

//---------------------------- USER ----------------------------
    public void close() {
        client.close();
    }

}
