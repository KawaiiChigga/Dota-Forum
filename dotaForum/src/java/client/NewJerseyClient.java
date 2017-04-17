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

    public NewJerseyClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }

    public JSONObject getUserById(String id){
        WebTarget resource = webTarget;
        // ? -> query
        // / -> path
        resource = resource.path("user").path(id);
        String a = resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
        return (JSONObject) JSONValue.parse(a);
    }
    
    public String insertUser(JSONObject id){
        WebTarget resource = webTarget;
        // ? -> query
        // / -> path
        resource = resource.path("user");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(Entity.json(id.toJSONString()), String.class);
    }

    public void close() {
        client.close();
    }
    
}
