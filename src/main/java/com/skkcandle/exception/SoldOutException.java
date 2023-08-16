package com.skkcandle.exception;

public class SoldOutException extends RuntimeException {
	public SoldOutException() {
		
	}
	
	public SoldOutException(String message) {
		super(message);
	}
}
