
package com.hx.hxjob.util;

import java.util.Random;

/**
*@Author TerencePK
*@Date 2017年5月23日
*@Note 
*/
public class RandomUtils {
	
	public static final String UPPERCASE = "UPPERCASE";//大写
	public static final String LOWERCASE = "LOWERCASE";//小写
	public static final String MIXED= "MIXED";//大小写混合
	
	/**
	 * 获取随机code（数字加大写英文字母）
	 * @param length
	 * @return
	 */
	public static String getRandomCode(int length){
		Random r = new Random();
		byte[] randomValue = new byte[length];
		for(int i=0;i<length;i++){
			int type = (int)(Math.random()*3);
			if(type==0){
				randomValue[i] = (byte)(r.nextInt(10) + 48);
			}
			if(type==1){
				randomValue[i] = (byte)(r.nextInt(26) + 65);
			}
			if(type==2){
				randomValue[i] = (byte)(r.nextInt(26) + 97);
			}
		}
		return new String(randomValue);
	}
	
	/**
	 * 随机字母code
	 * @param length
	 * type 
	 * @return
	 */
	public static String getRandomLetterCode(int length,String type){
		byte[] b = new byte[length];
		int baseOn = 0;
		if(RandomUtils.UPPERCASE.equals(type)){
			baseOn = 65;
		}
		else if(RandomUtils.LOWERCASE.equals(type)){
			baseOn = 97;
		}
		else if(!RandomUtils.MIXED.equals(type)){
			return null;
		}
		Random r = new Random();
		for(int i=0;i<length;i++){
			if(RandomUtils.MIXED.equals(type)){
				baseOn = r.nextInt(2) == 0 ? 65 : 97;
			}
			b[i] = (byte)(r.nextInt(26) + baseOn);
		}
		return new String(b);
	}
	
	/**
	 * 随机数字code
	 * @param length
	 * @return
	 */
	public static String getRandomNumber(int length){
		byte[] b = new byte[length];
		Random r = new Random();
		for(int i=0;i<length;i++){
			b[i] = (byte)(r.nextInt(10) + 48);
		}	
		return new String(b);
	}
	
	
	public static void main(String[] args){
		for(int i=0;i<100;i++){
			System.out.println(RandomUtils.getRandomNumber(6));
		}
	}
	
}
