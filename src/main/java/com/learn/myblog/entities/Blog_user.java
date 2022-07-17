package com.learn.myblog.entities;

public class Blog_user {
	private int id;
	private String nameString;
	private String emailString;
	private String passwordString;
	private String aboutString;
	private String profileString;
	public Blog_user(int id, String nameString, String emailString, String passwordString, String aboutString) {
		super();
		this.id = id;
		this.nameString = nameString;
		this.emailString = emailString;
		this.passwordString = passwordString;
		this.aboutString = aboutString;
	}
	public Blog_user(String nameString, String emailString, String passwordString, String aboutString) {
		super();
		this.nameString = nameString;
		this.emailString = emailString;
		this.passwordString = passwordString;
		this.aboutString = aboutString;
	}
	public String getProfileString() {
		return profileString;
	}
	public void setProfileString(String profileString) {
		this.profileString = profileString;
	}
	public Blog_user() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameString() {
		return nameString;
	}
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getEmailString() {
		return emailString;
	}
	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}
	public String getPasswordString() {
		return passwordString;
	}
	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}
	public String getAboutString() {
		return aboutString;
	}
	public void setAboutString(String aboutString) {
		this.aboutString = aboutString;
	}
	
}
