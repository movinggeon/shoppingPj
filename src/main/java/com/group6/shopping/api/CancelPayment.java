package com.group6.shopping.api;

import java.io.IOException;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;

public class CancelPayment {
	
	private String accessToken;
	
	public CancelPayment() {
		this.accessToken = new AccessToken().getAccessToken();
		System.out.println("엑세스 토큰 -> " + accessToken);
	}
	
	public void doCanelPayment(String reason, String imp_uid, int amount) {
		System.out.println(reason);
		System.out.println(imp_uid);
		System.out.println(amount);
		
    	try {
    		
    		char quotes = '\u0022';
    		
	    	String url = "https://api.iamport.kr/payments/cancel";
	    	String data = "{" +
	    			quotes + "reason" +quotes + ":" + quotes + reason + quotes + "," +
	    			quotes + "imp_uid" +quotes + ":" + quotes + imp_uid + quotes + "," +
	    			quotes + "amount" +quotes + ":" + quotes + amount + quotes
	    			+ "}";
	    	
	    	//System.out.println("data : " + data);
	    	
	    	OkHttpClient client = new OkHttpClient();
	    	RequestBody requestBody = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), data);
	    	
	    	Request.Builder builder = new Request.Builder().url(url)
	    			.addHeader("Authorization", "Bearer " + accessToken)
	    			.post(requestBody);
	    	
	    	
	    	Request request = builder.build();
	    	
	    	Response response = client.newCall(request).execute();
	    	if(response.isSuccessful()) {
	    		ResponseBody body = response.body();
	    		if(body != null) {
	    			String stringJson = body.string();
	//    			
	    			System.out.println(stringJson);
	//    			//System.out.println(stringJson); //json을 문자열로 받음
	//    			
	//    			Gson gson = new Gson();
	//    			
	//    			ResponseInfo responseInfo = gson.fromJson(stringJson, ResponseInfo.class);
	//    			//System.out.println(responseInfo.getResponse().getAccess_token());
	//    			
	//    			this.accessToken = responseInfo.getResponse().getAccess_token();
	    		}else {
	    			System.out.println("에러");
	    		}
	    	}else {
	    		System.out.println("결제취소api 못받아옴");
	    	}
    	}catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("환불 완료");
	}
}
