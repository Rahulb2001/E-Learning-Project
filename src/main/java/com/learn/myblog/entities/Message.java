package com.learn.myblog.entities;

public class Message {
	private String contentString;
	private String typeString;
	private String cssclassString;
	
	public Message(String contentString, String typeString, String cssclassString) {
		super();
		this.contentString = contentString;
		this.typeString = typeString;
		this.cssclassString = cssclassString;
	}

	public String getContentString() {
		return contentString;
	}

	public void setContentString(String contentString) {
		this.contentString = contentString;
	}

	public String getTypeString() {
		return typeString;
	}

	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}

	public String getCssclassString() {
		return cssclassString;
	}

	public void setCssclassString(String cssclassString) {
		this.cssclassString = cssclassString;
	}
	

}
