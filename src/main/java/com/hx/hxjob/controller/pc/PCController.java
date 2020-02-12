package com.hx.hxjob.controller.pc;

import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.enums.YesOrNoEnum;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.service.OrganizationService;
import com.hx.hxjob.system.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: com.hx.hxjob.controller.pc
 * @description:
 * @created: 2020/01/20 11:16
 */
@Controller
@RequestMapping("pcviews")
public class PCController {
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private SystemConfig systemConfig;

    private Member getMember(HttpSession session) {
        Object obj = session.getAttribute(Constant.MEMBER);
        if (obj == null) {
            return null;
        } else {
            return (Member) obj;
        }
    }

    /**
     * @Description 回显机构基本信息
     * @Params [params, model, session]
     * @Return java.lang.String
     * @Date 2020/1/20 11:18
     **/
    @RequestMapping("org")
    public String org(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        model.addAttribute("industries", this.organizationService.getIndustries());
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("systemConfig", systemConfig);
        params.put("ishot", YesOrNoEnum.YES.name());
        return "pcPlus/head_company";
    }

    @RequestMapping("orgDatas")
    @ResponseBody
    public Map<String, Object> orgDatas(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getOrgs(params, member);
    }

}
