package com.hx.hxjob.controller.manager;

import com.hx.hxjob.service.CalendarService;
import com.hx.hxjob.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.manager
 * @description: 考试后台
 * @created: 2020/01/19 14:37
 */
@RequestMapping("calendar")
@Controller
public class CalendarController {
    @Resource
    private OrganizationService organizationService;

    @Resource
    private CalendarService calendarService;

    @RequestMapping("exam")
    /**
    * @Description 展示考试日历到前台
    * @Params [model]
    * @Return java.lang.String
    * @Date 2020/1/19 14:43
    **/
    public String examMap(Model model) {
        model.addAttribute("organizations", this.organizationService.getOrganizations());
        return "manager/calendar";
    }

    @RequestMapping("examList")
    @ResponseBody
    /**
    * @Description 考试列表页面
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:48
    **/
    public Map<String, Object> examList(@RequestParam() Map<String, String> params) {
        return this.calendarService.examList(params);
    }

    @RequestMapping("addExam")
    /**
    * @Description 新增考试日历到前台
    * @Params [model]
    * @Return java.lang.String
    * @Date 2020/1/19 14:49
    **/
    public String addExam(Model model) {
        return "manager/new-calendar";
    }

    /*新增考试*/
    @RequestMapping("addCalendar")
    @ResponseBody
    /**
    * @Description 新增考试日历
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:55
    **/
    public Map<String, Object> addCalendar(@RequestParam() Map<String, String> params) {
        return this.calendarService.addCalendar(params);
    }

    @RequestMapping("editExam/{code}")
    /**
    * @Description 编辑数据——>回显数据
    * @Params [model, code]
    * @Return java.lang.String
    * @Date 2020/1/19 14:54
    **/
    public String editExam(Model model, @PathVariable String code) {
        model.addAttribute("Calendar", this.calendarService.editExam(code));
        model.addAttribute("code", code);
        return "manager/new-calendar";
    }

    @RequestMapping("editCalendar")
    @ResponseBody
    /**
    * @Description 编辑考试
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:57
    **/
    public Map<String, Object> editCalendar(@RequestParam() Map<String, String> params) {
        return this.calendarService.editCalendar(params);
    }
    @RequestMapping("deleteExam/{code}")
    @ResponseBody
    /**
    * @Description 删除考试
    * @Params [code]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    * @Date 2020/1/19 14:58
    **/
    public Map<String, Object> deleteExam(@PathVariable String code) {
        return this.calendarService.deleteExam(code);
    }
}
