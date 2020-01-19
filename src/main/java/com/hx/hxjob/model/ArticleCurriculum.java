package com.hx.hxjob.model;

import java.math.BigDecimal;

public class ArticleCurriculum {

	private int id;
	private String desEntryId;
	private String type;
	private String title;
	private String author;
	private String image;
	private String content;
	private String createtime;
	private int paycount;
	private int readcount;
	private String ishot;
	private int sort;
	private String publishtime;
	private String shelftime;
	private String isrecommend;
	private String difficulty;
	private String duration;
	private String chapters;
	private String needpay;
	private BigDecimal amount;
	private String brief;
	
	private boolean collectFlag;


	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public int getPaycount() {
		return paycount;
	}
	public void setPaycount(int paycount) {
		this.paycount = paycount;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIshot() {
		return ishot;
	}
	public void setIshot(String ishot) {
		this.ishot = ishot;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getDesEntryId() {
		return desEntryId;
	}
	public void setDesEntryId(String desEntryId) {
		this.desEntryId = desEntryId;
	}
	public String getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public String getShelftime() {
		return shelftime==null?"":shelftime;
	}
	public void setShelftime(String shelftime) {
		this.shelftime = shelftime;
	}
	public String getIsrecommend() {
		return isrecommend;
	}
	public void setIsrecommend(String isrecommend) {
		this.isrecommend = isrecommend;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getChapters() {
		return chapters;
	}
	public void setChapters(String chapters) {
		this.chapters = chapters;
	}
	public String getNeedpay() {
		return needpay;
	}
	public void setNeedpay(String needpay) {
		this.needpay = needpay;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public boolean isCollectFlag() {
		return collectFlag;
	}
	public void setCollectFlag(boolean collectFlag) {
		this.collectFlag = collectFlag;
	}
	
	
}
