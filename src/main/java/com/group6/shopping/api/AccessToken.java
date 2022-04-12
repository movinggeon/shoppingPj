package com.group6.shopping.api;

import java.io.IOException;

import com.google.gson.Gson;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;

public class AccessToken {
	
	private String accessToken;
	
    public AccessToken(){
    	
    	try {
	    	String url = "https://api.iamport.kr/users/getToken";
	    	String data = "{\"imp_key\": \"9763427430805677\", \"imp_secret\":\"f7134f8b9c6ca8a441d72144e8ff10d54dc4ae1998b93f0c21939467672ff732844621f97febf4c2\"}";
	    	
	    	OkHttpClient client = new OkHttpClient();
	    	RequestBody requestBody = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), data);
	    	
	    	Request.Builder builder = new Request.Builder().url(url)
	    			.post(requestBody);
	    	
	    	Request request = builder.build();
	
	    	Response response = client.newCall(request).execute();
	    	if(response.isSuccessful()) {
	    		ResponseBody body = response.body();
	    		if(body != null) {
	    			String stringJson = body.string();
	    			
	    			//System.out.println(stringJson); //json을 문자열로 받음
	    			
	    			Gson gson = new Gson();
	    			
	    			ResponseInfo responseInfo = gson.fromJson(stringJson, ResponseInfo.class);
	    			//System.out.println(responseInfo.getResponse().getAccess_token());
	    			
	    			this.accessToken = responseInfo.getResponse().getAccess_token();
	    		}else {
	    			System.out.println("에러");
	    		}
	    	}
	    	
    	}catch (IOException e) {
			// TODO: handle exception
		}
    	
    }
    
    public String getAccessToken() {
    	return accessToken;
    }
    
    public void getInfo(){
    	
    	try {
	    	String url = "https://api.iamport.kr/payments/imp_728586134075";
	    	
	    	OkHttpClient client = new OkHttpClient();
	    	Request.Builder builder = new Request.Builder().url(url)
	    			.addHeader("Authorization", "Bearer " + accessToken);
	    	
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
	    	}
    	}catch (IOException e) {
			System.out.println(e.getMessage());
		}
    	
    }
  
}
