package com.group6.shopping.api;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseInfo {
	private String code;
	private String message;
	private Response response;
	
	@Getter
	@Setter
	static final class Response{
		private String access_token;
		private int now;
		private int expired_at;
	}


	public ResponseInfo(String code, String message, Response response) {
		super();
		this.code = code;
		this.message = message;
		this.response = response;
	}
	
	public ResponseInfo() {
		
	}
}
