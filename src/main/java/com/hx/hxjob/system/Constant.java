package com.hx.hxjob.system;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class Constant {

	
	public static Map<String,Object> loginStatus = new HashMap<String,Object>();
	
	public static final long OUT_TIME = 60*60*1000;//1小时
	
	public static final long DAY_MILLIS = 24*60*60*1000;//24小时
	
	public static String regUsername = "^([a-z]|[A-Z]|[0-9]){5,20}$";
	
	public static String regMobile = "^1[3,4,5,7,8,9]\\d{9}$";
	
	public static SimpleDateFormat sdf_yyyymmdd = new SimpleDateFormat("yyyyMMdd");
	
	public static SimpleDateFormat sdf_yyyy_mm_dd = new SimpleDateFormat("yyyy-MM-dd");
	
	public static SimpleDateFormat sdf_normal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static SimpleDateFormat sdf_yyyymmddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
	
	public static String MEMBER = "MEMBER";
	
	public static String SYSTEM_USER = "SYSTEM_USER";
	
	public static Pattern patternNumber = Pattern.compile("^\\d+|[1-9][0-9]*\\.\\d+$");
	
	public static Pattern patternSort = Pattern.compile("^-*\\d+$");
	
	public static String[] GROWTH = {"","慢","较慢","一般","较快","极快"};
	
	public static String[] WORKLOAD = {"","高频率加班","工作日加班","偶尔加班","不加班日常饱和","清闲"};
	
	public static String[] ENVIRONMENT = {"","恶劣","堪忧","一般","舒适","极优"};
	
	public static String[] SATISFACTION = {"","","极不满意（一分钟都不想多呆）","一般、不满意（一有机会就要跳槽）","满意（短期内不考虑跳槽、希望能够拿到offer）","非常满意（简直想在这里工作一辈子）"};
	
}
