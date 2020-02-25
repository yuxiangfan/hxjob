package com.hx.hxjob.model;

import java.util.List;

public class PosAndComTest {

	private int id;
	private String name;
	private String gender;
	private String birthday;
	private String nativePlace;
	private String politicalBackground;
	private String contact;
	private String createtime;
	private String score;
	private String result;
	
	private Member member;
	private List<EducationalBackground> educationalBackground;
	private List<InternshipExperience> internshipExperience;
	private List<SocialPractice> socialPractice;
	private List<Certificate> certificate;
	private List<SelfEvaluation> selfEvaluation;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getNativePlace() {
		return nativePlace;
	}
	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	public String getPoliticalBackground() {
		return politicalBackground;
	}
	public void setPoliticalBackground(String politicalBackground) {
		this.politicalBackground = politicalBackground;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public List<EducationalBackground> getEducationalBackground() {
		return educationalBackground;
	}
	public void setEducationalBackground(List<EducationalBackground> educationalBackground) {
		this.educationalBackground = educationalBackground;
	}
	public List<InternshipExperience> getInternshipExperience() {
		return internshipExperience;
	}
	public void setInternshipExperience(List<InternshipExperience> internshipExperience) {
		this.internshipExperience = internshipExperience;
	}
	public List<SocialPractice> getSocialPractice() {
		return socialPractice;
	}
	public void setSocialPractice(List<SocialPractice> socialPractice) {
		this.socialPractice = socialPractice;
	}
	public List<Certificate> getCertificate() {
		return certificate;
	}
	public void setCertificate(List<Certificate> certificate) {
		this.certificate = certificate;
	}
	public List<SelfEvaluation> getSelfEvaluation() {
		return selfEvaluation;
	}
	public void setSelfEvaluation(List<SelfEvaluation> selfEvaluation) {
		this.selfEvaluation = selfEvaluation;
	}
	
	
}
