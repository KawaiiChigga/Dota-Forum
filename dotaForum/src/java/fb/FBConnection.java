/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 *
 * @author Tuyu
 */
public class FBConnection {
    //sesuaikan dengan app ID dan Secret masing-masing
    /*
        punya ci fina
        1764067310482232
        42552db9e0c4207f7de70a7046c4349a
    */
	public static final String FB_APP_ID = "1463138227061323";
	public static final String FB_APP_SECRET = "61527971ec17741d85740ff72306d477";
	public static final String REDIRECT_URI = "http://localhost:8080/dotaForum/fbhome";

	static String accessToken = "";

	public String getFBAuthUrl() {
		String fbLoginUrl = "";
		try {
			fbLoginUrl = "http://www.facebook.com/dialog/oauth?" + "client_id="
					+ FBConnection.FB_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(FBConnection.REDIRECT_URI, "UTF-8")
					+ "&scope=";
                        String scope=URLEncoder.encode("email,public_profile,"
                                + "user_about_me,user_birthday,user_relationships", "UTF-8");
                        fbLoginUrl+=scope;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbLoginUrl;
	}

	public String getFBGraphUrl(String code) {
		String fbGraphUrl = "";
		try {
			fbGraphUrl = "https://graph.facebook.com/oauth/access_token?"
					+ "client_id=" + FBConnection.FB_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(FBConnection.REDIRECT_URI, "UTF-8")
					+ "&client_secret=" + FB_APP_SECRET + "&code=" + code;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbGraphUrl;
	}

	public String getAccessToken(String code) {
		if ("".equals(accessToken)) {
			URL fbGraphURL;
			try {
				fbGraphURL = new URL(getFBGraphUrl(code));
			} catch (MalformedURLException e) {
				e.printStackTrace();
				throw new RuntimeException("Invalid code received " + e);
			}
			URLConnection fbConnection;
			StringBuffer b = null;
			try {
				fbConnection = fbGraphURL.openConnection();
				BufferedReader in;
				in = new BufferedReader(new InputStreamReader(
						fbConnection.getInputStream()));
				String inputLine;
				b = new StringBuffer();
				while ((inputLine = in.readLine()) != null)
					b.append(inputLine );
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("Unable to connect with Facebook "
						+ e);
			}
                        JSONObject obj = (JSONObject) JSONValue.parse(b.toString());
			accessToken = (String) obj.get("access_token");
                        System.out.println(accessToken);
			if (accessToken.startsWith("{")) {
				throw new RuntimeException("ERROR: Access Token Invalid: "
						+ accessToken);
			}
		}
                System.out.println(accessToken);
		return accessToken;
	}
}
