package com.hx.hxjob.service;

import com.hx.hxjob.dao.DownloadMapper;
import com.hx.hxjob.model.Download;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Program: com.hx.hxjob.service
 * @Description:
 * @Created: 2020/02/12 19:34
 */
@Service
public class DownloadService {

    @Resource
    private DownloadMapper downloadMapper;

    public Map<String, Object> addDown(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();

        try {
            result = this.checkParams(params);
            if ((int) result.get("code") < 0) {
                return result;
            }
            /*新增下载链接*/
            this.downloadMapper.addDown(params);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    private Map<String, Object> checkParams(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        if (StringUtils.isEmpty(params.get("title"))) {
            result.put("code", -1);
            result.put("msg", "下载标题未填");
            return result;
        } else if (StringUtils.isEmpty(params.get("link"))) {
            result.put("code", -1);
            result.put("msg", "百度云链接未填");
            return result;
        } else if (StringUtils.isEmpty(params.get("code"))) {
            result.put("code", -1);
            result.put("msg", "百度云下载码未填");
            return result;
        }
        result.put("code", 0);
        result.put("msg", "OK");
        return result;
    }


    public Map<String, Object> downList(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        PageUtil.dealPageParamForLayer(params);
        List<Download> list = this.downloadMapper.downList(params);
        result.put("rows", list);
        result.put("total", this.downloadMapper.downListCount(params));
        return result;
    }

    public Download editDown(String id) {
        return this.downloadMapper.editDown(id);
    }

    public Map<String, Object> submitEditDown(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        try {
            result = this.checkParams(params);
            if ((int) result.get("code") < 0) {
                return result;
            }
            this.downloadMapper.submitEditDown(params);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> deleteDown(String id) {
        Map<String, Object> result = new HashMap<>();
        this.downloadMapper.deleteDown(id);
        result.put("code", "0");
        result.put("msg", "删除成功");
        return result;
    }
}
