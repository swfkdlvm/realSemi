package msh.NonMemberOrder.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
public class CertifiedPhoneNumber {

	public void certifiedPhoneNumber(String phoneNumber, String numStr) {

		String api_key = "NCSLRDWQFNSCUTQS";
        String api_secret = "MZLCXR3RFVZP99UROOP5CNBWBFC9WEBN";
        Message coolsms = new Message(api_key, api_secret);

      
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    
        params.put("from", "01027165039");   
        params.put("type", "SMS");
        params.put("text", " + 작성할내용" +"["+ numStr + "]" + "내용 ");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	JSONObject obj = (JSONObject)coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
		
	}
	
}
