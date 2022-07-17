package com.learn.mycart.videos;

public class Video {
	private String videolink;
	private String coursecategory;
	
	public Video(String videolink, String coursecategory) {
		super();
		this.videolink = videolink;
		this.coursecategory = coursecategory;
	}
	public String getVideolink() {
		return videolink;
	}
	public void setVideolink(String videolink) {
		this.videolink = videolink;
	}
	public String getCoursecategory() {
		return coursecategory;
	}
	public void setCoursecategory(String coursecategory) {
		this.coursecategory = coursecategory;
	}
	

}
