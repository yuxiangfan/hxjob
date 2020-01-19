package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.dao.CalendarMapper;
import com.hx.hxjob.model.ApplyCalendar;
import com.hx.hxjob.system.CodeGenerator;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description: 日历
 * @created: 2020/01/19 14:42
 */
public class CalendarService {
    @Resource
    private CalendarMapper calendarMapper;

    public Map<String, Object> examList(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        PageUtil.dealPageParamForLayer(params);
        List<ApplyCalendar> list = this.calendarMapper.examList(params);
        result.put("rows", list);
        result.put("total", this.calendarMapper.examListCount(params));
        return result;
    }

    public Map<String, Object> addCalendar(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));

            if (StringUtils.isEmpty((String) datas.get("applyTime"))) {
                result.put("code", -1);
                result.put("msg", "报名时间未填");
                return result;
            }
            /*单个考试进行编码*/
            datas.put("applyCode", CodeGenerator.getInstance().generateExamCode());
            /*插入总信息*/
            this.calendarMapper.addCalendar(datas);
            /*插入报名信息*/
            this.calendarMapper.addSign(datas);
            /*插入考试信息*/
            if ("1".equals(datas.get("examStatus"))) {
                this.calendarMapper.addExam(datas);
            }
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    public Object editExam(String code) {
        ApplyCalendar edit = this.calendarMapper.editExam(code);
        return edit;
    }

    public Map<String, Object> editCalendar(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
        /*单个考试进行编码*/
        this.calendarMapper.editCalendar(datas);
        this.calendarMapper.editCalendarSign(datas);
        this.calendarMapper.editCalendarExam(datas);
        result.put("code", "0");
        result.put("msg", "编辑成功");
        return result;
    }

    public Map<String, Object> deleteExam(String code) {
        Map<String, Object> result = new HashMap<>();
        this.calendarMapper.deleteSign(code);
        this.calendarMapper.deleteExam(code);
        this.calendarMapper.deleteMain(code);
        result.put("code", "0");
        result.put("msg", "删除成功");
        return result;
    }
}
