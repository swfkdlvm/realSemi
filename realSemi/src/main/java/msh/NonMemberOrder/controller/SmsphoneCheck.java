package msh.NonMemberOrder.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import common.controller.AbstractController;

public class SmsphoneCheck extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String phoneNumber = request.getParameter("phoneNumber");
		Random rand  = new Random(); //랜덤숫자 생성하기 !!
        String numStr = "";
        
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        CertifiedPhoneNumber certifiedPhoneNumber = new CertifiedPhoneNumber();
		certifiedPhoneNumber.certifiedPhoneNumber(phoneNumber, numStr); //휴대폰 api 쪽으로 가기 !!
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(numStr);

		return;
		
	}//end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {--
	
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {

		String api_key = "NCSLRDWQFNSCUTQS";
        String api_secret = "MZLCXR3RFVZP99UROOP5CNBWBFC9WEBN";
        Message coolsms = new Message(api_key, api_secret);

      
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    
        params.put("from", "01027165039");   
        params.put("type", "SMS");
        params.put("text", " + 인증번호는" +"["+ numStr + "]" + "입니다 ");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject)coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
		
	}//end of public void certifiedPhoneNumber(String phoneNumber, String numStr) {---
}
