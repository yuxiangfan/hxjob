package com.hx.hxjob.controller.manager;

import com.hx.hxjob.service.MemberTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @Program: com.hx.hxjob.controller.manager
 * @Description:  测评controller
 * @Created: 2020/02/12 20:40
 */
@Controller
@RequestMapping("test")
public class MemberTestController {
    @Autowired
    private MemberTestService memberTestService;

    @RequestMapping("character")
    public String character() {

        return "manager/character";
    }


    @RequestMapping("posAcom")
    public String posAcom() {

        return "manager/posAcom";
    }


    /**
    * @Description 性格测评列表页
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    **/
    @RequestMapping("posAcomPage")
    @ResponseBody
    public Map<String,Object> posAcomPage(@RequestParam()Map<String,String> params) {
        return this.memberTestService.getMemberPosAcomPage(params);
    }
    /**
    * @Description 性格测评详情页
    * @Params [model, id]
    * @Return java.lang.String
    **/
    @RequestMapping("posAcomD/{id}")
    public String posAcomD(Model model, @PathVariable String id) {
        model.addAttribute("test", this.memberTestService.getPosAndComTestById(id));
        return "manager/poscom-detail";
    }
    /**
    * @Description TODO
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    **/
    @RequestMapping("characterPage")
    @ResponseBody
    public Map<String,Object> characterPage(@RequestParam()Map<String,String> params) {
        return this.memberTestService.characterPage(params);
    }
    @RequestMapping("characterDetail/{memberid}")
    public String characterDetail(Model model,@PathVariable String memberid) {
        model.addAttribute("characterDetails", this.memberTestService.getCharacterDetail(memberid));
        return "manager/character-detail";
    }
}
