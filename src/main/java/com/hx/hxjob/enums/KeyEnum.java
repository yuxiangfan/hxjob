package com.hx.hxjob.enums;

public enum KeyEnum {

	MD5("sbrsory"),DES("JYY5201314");
	
	private String key;
	
	private KeyEnum(String key) {
		this.key = key;
	}
	
	public String getKey() {
		return this.key;
	}
	
}
