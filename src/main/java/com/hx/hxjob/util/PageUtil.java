package com.hx.hxjob.util;

import org.springframework.util.StringUtils;

import java.util.Map;

public class PageUtil {

	public static void dealPageParamForLayer(Map<String,String> params) {
		
		if(StringUtils.isEmpty(params.get("page"))) {
			params.put("page", "1");
		}
		if(StringUtils.isEmpty(params.get("limit"))) {
			params.put("limit", "15");
		}
		
		params.put("offset", (Integer.valueOf(params.get("page")) - 1)*Integer.valueOf(params.get("limit")) + "");
	}
	
}
