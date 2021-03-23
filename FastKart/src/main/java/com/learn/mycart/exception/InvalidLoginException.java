package com.learn.mycart.exception;

public class InvalidLoginException extends NullPointerException{

	public InvalidLoginException(String msg) {
		super(msg);
	}
}
