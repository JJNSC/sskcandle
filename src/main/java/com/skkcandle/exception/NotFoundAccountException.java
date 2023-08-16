package com.skkcandle.exception;

public class NotFoundAccountException extends RuntimeException {
	public NotFoundAccountException() {
		
	}
	
	public NotFoundAccountException(String message) {
		super(message);
	}
}
