package com.learn.mycart.entities;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int courseId;
private String courseTitle;
private String courseDesc;
private String coursePhoto;
private int coursePrice;
private int courseDiscount;
private int courseQuantity;
@ManyToOne
private Category category;

public Course() {
	super();
}

public int getCourseId() {
	return courseId;
}

public void setCourseId(int courseId) {
	this.courseId = courseId;
}

public String getCourseTitle() {
	return courseTitle;
}

public void setCourseTitle(String courseTitle) {
	this.courseTitle = courseTitle;
}

public String getCourseDesc() {
	return courseDesc;
}

public void setCourseDesc(String courseDesc) {
	this.courseDesc = courseDesc;
}

public String getCoursePhoto() {
	return coursePhoto;
}

public void setCoursePhoto(String coursePhoto) {
	this.coursePhoto = coursePhoto;
}

public int getCoursePrice() {
	return coursePrice;
}

public int setCoursePrice(int coursePrice) {
	return this.coursePrice = coursePrice;
}

public int getCourseDiscount() {
	return courseDiscount;
}

public int setCourseDiscount(int courseDiscount) {
	return this.courseDiscount = courseDiscount;
}

public int getCourseQuantity() {
	return courseQuantity;
}

public int setCourseQuantity(int courseQuantity) {
	return this.courseQuantity = courseQuantity;
}

public Category getCategory() {
	return category;
}

public void setCategory(Category category) {
	this.category = category;
}

public Course(String courseTitle, String courseDesc, String coursePhoto,int courcePrice, int courseDiscount, int courseQuantity,
		Category category) {
	super();
	this.courseTitle = courseTitle;
	this.courseDesc = courseDesc;
	this.coursePhoto = coursePhoto;
	this.coursePrice=courcePrice;
	this.courseDiscount = courseDiscount;
	this.courseQuantity = courseQuantity;
	this.category = category;
}
public Course(int courseId, String courseTitle, String courseDesc, String coursePhoto,int courcePrice, int courseDiscount,
		int courseQuantity) {
	super();
	this.courseId = courseId;
	this.courseTitle = courseTitle;
	this.courseDesc = courseDesc;
	this.coursePhoto = coursePhoto;
	this.coursePrice=courcePrice;
	this.courseDiscount = courseDiscount;
	this.courseQuantity = courseQuantity;
}

@Override
public String toString() {
	return "Course [courseId=" + courseId + ", courseTitle=" + courseTitle + ", courseDesc=" + courseDesc
			+ ", coursePhoto=" + coursePhoto + ", coursePrice=" + coursePrice + ", courseDiscount=" + courseDiscount
			+ ", courseQuantity=" + courseQuantity + ", category=" + category + ", getCategory()=" + getCategory()
			+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}
public int getCoursePriceAfterDiscount() {
	int d=this.coursePrice-this.courseDiscount;
	return d;
}

}
