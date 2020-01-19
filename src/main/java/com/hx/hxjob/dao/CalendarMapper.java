package com.hx.hxjob.dao;
/*
 * @program: smartBR
 * @description:
 * @author: yu.God
 * @create: 2019-05-22 23:13
 **/


import com.hx.hxjob.model.ApplyCalendar;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CalendarMapper {
    List<ApplyCalendar> examList(Map<String, String> params);

    int  examListCount(Map<String, String> params);


    void addCalendar(Map<String, Object> datas);

    void addSign(Map<String, Object> datas);

    void addExam(Map<String, Object> datas);


    ApplyCalendar editExam(String code);

    void deleteExam(String code);

    ApplyCalendar selectExam(String id);

    void deleteSign(String code);

    void deleteMain(String code);

    String getLastExamCode();

    void editCalendar(Map<String, Object> params);

    void editCalendarSign(Map<String, Object> datas);

    void editCalendarExam(Map<String, Object> datas);

}
