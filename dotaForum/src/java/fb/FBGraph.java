/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fb;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class FBGraph {

    private String accessToken;

    public FBGraph(String accessToken) {
        this.accessToken = accessToken;
        System.out.println(accessToken);
    }

    public String getFBGraph() {
        String graph = null;
        try {
            String data = URLEncoder.encode("id,first_name,last_name,email", "UTF-8");
            //String gs = URLEncoder.encode("gender","UTF-8");
            String g = "https://graph.facebook.com/me?access_token=" + accessToken
                    + "&fields=" + data;
            System.out.println(g);
            URL u = new URL(g);
            URLConnection c = u.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    c.getInputStream()));
            String inputLine;
            StringBuffer b = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                b.append(inputLine + "\n");
            }
            in.close();
            graph = b.toString();
            System.out.println(graph);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("ERROR in getting FB graph data. " + e);
        }
        return graph;
    }

    public HashMap<String, String> getGraphData(String fbGraph) {
        HashMap<String, String> fbProfile = new HashMap();
        try {
            JSONObject json = (JSONObject) JSONValue.parse(fbGraph);
            fbProfile.put("id", (String) json.get("id"));
            fbProfile.put("first_name", (String) json.get("first_name"));
            fbProfile.put("last_name", (String) json.get("last_name"));
            fbProfile.put("password", accessToken);
            if (json.containsKey("email")) {
                fbProfile.put("email", (String) json.get("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("ERROR in parsing FB graph data. " + e);
        }
        return fbProfile;
    }

    public boolean unlinkAccount() {
        try {
            String data = URLEncoder.encode("id,first_name,last_name,email,acces_token", "UTF-8");
            String g = "https://graph.facebook.com/v2.6/me?access_token=" + accessToken + "&fields=" + data + "&account_linking_token=";
            URL u = new URL(g);
            URLConnection c = u.openConnection();
            return false;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
    }
}
