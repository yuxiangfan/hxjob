package com.hx.hxjob.controller.h5;


import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.enums.YesOrNoEnum;
import com.hx.hxjob.model.*;
import com.hx.hxjob.service.*;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.MyEscape;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("h5views")
public class H5Controller {

    @Autowired
    private SystemConfig systemConfig;

    @Autowired
    private PositionService positionService;

    @Autowired
    private SelectorService selectorService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private MemberTestService memberTestService;


    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("hotPoss", this.positionService.getPcHotPosition());
        return "pcH5Plus/index";
    }


    /*用户职业收藏信息*/
    @RequestMapping("save/{code}")
    @ResponseBody
    public Map<String, Object> savePositionAndMember(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.savePositionAndMember(code, member);
    }

    @RequestMapping("posDatas")
    @ResponseBody
    public Map<String,Object> posDatas(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.positionService.getPoss(params, member);
    }


    @RequestMapping("pos")
    public String position(Model model, @RequestParam() Map<String, String> params) {
        model.addAttribute("industries", this.organizationService.getIndustries());
        List<City> cities = this.organizationService.getCities();
        model.addAttribute("cities", cities);
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("systemConfig", systemConfig);
        if (!StringUtils.isEmpty(params.get("sc"))) {
            model.addAttribute("searchContent", MyEscape.unescape(params.get("sc")));
        }
        return "pcH5Plus/job";
    }

    @RequestMapping("posd/{code}")
    public String positionDetail(@PathVariable String code, Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("code", code);
        Model pos = model.addAttribute("pos", this.positionService.getPosByCode(code));
        System.out.println(pos);
        return "pcH5Plus/detail_job";
    }

    /*index界面显示的热度*/
    @RequestMapping("orgsIndexDatas")
    @ResponseBody
    public List<Organization> orgsIndexDatas(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgsIndexDatas(params, member);
    }


    @RequestMapping("orgPraise/{code}")
    @ResponseBody
    public Map<String, Object> orgPraise(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgPraise(code, member);
    }

    @RequestMapping("orgCollect/{code}")
    @ResponseBody
    public Map<String, Object> orgCollect(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCollect(code, member);
    }

    /*index显示评论热度*/
    @RequestMapping("getIndexRemark")
    @ResponseBody
    public Map<String, Object> getIndexRemark(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getIndexRemark(params, member);
    }


    @RequestMapping("praiseRemark/{id}")
    @ResponseBody
    public Map<String, Object> praiseRemark(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.savePraiseRemark(id, member);
    }


/*
    @RequestMapping("tocomment/{code}")
    public String tocomment(@PathVariable String code, Model model, HttpSession session) {

        Member member = this.getMember(session);

        OrganizationRemark organizationComment = this.organizationService.getOrganizationCommentByCodeAndMemberid(code, member.getId() + "");

        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        model.addAttribute("cities", this.organizationService.getCities());
        return "H5/comment";
    }*/

    @RequestMapping("tocomment/{code}")
    public String commentPage(@PathVariable String code, Model model, HttpSession session) {
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("orgcode", code);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        return "pcH5Plus/remark";
    }

    @RequestMapping("org")
    public String org(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        model.addAttribute("industries", this.organizationService.getIndustries());
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("systemConfig", systemConfig);
        params.put("ishot", YesOrNoEnum.YES.name());
//		model.addAttribute("orgs", this.organizationService.getOrgs(params,member));
        return "pcH5Plus/company";
    }

    @RequestMapping("orgDatas")
    @ResponseBody
    public Map<String, Object> orgDatas(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getOrgs(params, member);
    }

    /*获得机构*/
    @RequestMapping("getH5Org")
    @ResponseBody
    public Map<String,Object> getOrgsHot(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getOrgs(params, member);
    }

    /*点评*/

    @RequestMapping("userOrgComment")
    @ResponseBody
    public Map<String, Object> userOrgComment(@RequestParam() Map<String, Object> params, MultipartFile memberPhoto, MultipartFile imgUpload, HttpServletRequest request, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.userOrgComment(params, imgUpload, member, request);
    }

    private Member getMember(HttpSession session) {
        Object obj = session.getAttribute(Constant.MEMBER);
        if (obj == null) {
            //for test
//			Member member = new Member();
//			member.setId(1);
//			return member;
            return null;
        } else {
            return (Member) obj;
        }
    }


    @RequestMapping("tocommentlist/{code}")
    public String commentListPage(@PathVariable String code, Model model) {
        model.addAttribute("orgcode", code);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        model.addAttribute("systemConfig", systemConfig);
        return "pcH5Plus/detail_company";
    }

    /*评论列表*/
    @RequestMapping("orgComments")
    @ResponseBody
    public Map<String, Object> orgComments(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgComments(params, member);
    }

    /*显示推荐评论*/
    @RequestMapping("orgCommentsRecommend")
    @ResponseBody
    public Map<String, Object> orgCommentsRecommend(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsRecommend(params, member);
    }

    /*显示在职评论*/
    @RequestMapping("orgCommentsOnJob")
    @ResponseBody
    public Map<String, Object> orgCommentsOnJob(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsOnJob(params, member);
    }

    /*显示实习评论*/
    @RequestMapping("orgCommentsPractice")
    @ResponseBody
    public Map<String, Object> orgCommentsPractice(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsPractice(params, member);
    }

    @RequestMapping("everyoneSay/{orgcode}")
    @ResponseBody
    public Organization everyoneSay(@PathVariable String orgcode, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.everyoneSay(orgcode, member);
    }

    @RequestMapping("totest")
    public String totest(Model model) {
        return "H5/totest";
    }

    @RequestMapping("character")
    public String character(Model model) {
        return "pcH5Plus/test";
    }

    @RequestMapping("toCharacter")
    public String toCharacter(Model model) {
        return "pcH5Plus/test1";
    }


    @RequestMapping(value = "docharacter", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> docharacter(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.docharacter(params, member);
    }


    @RequestMapping("poscom")
    public String poscom(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("hotPoss", this.positionService.getPcHotPosition());
        return "pcH5Plus/detail_Form";
    }

    @RequestMapping("selector")
    public String selector(Model model) {
        return "pcH5Plus/good";
    }


    @RequestMapping("about")
    public String about(Model model) {
        return "H5/about";
    }

    /*显示前台新闻到h5*/
    @RequestMapping("selectorList")
    @ResponseBody
    public Map<String, Object> selectorList(@RequestParam() Map<String, String> params) {
        return this.selectorService.getACPageForPC(params);
    }

    /*获取新闻详情页*/
    @RequestMapping("toNewsDetails/{id}")
    public String toNewsDetails(@PathVariable int id, Model model) {
        model.addAttribute("NewsDetails", this.selectorService.toAdviceDetails(id));
        return "pcH5Plus/detail_article";
    }

    /*显示在前台的Job*/
    @RequestMapping("posIndexDatas")
    @ResponseBody
    public List<Position> posIndexDatas(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        List<Position> poss = this.positionService.posIndexDatas(params, member);
        System.out.println(poss);
        return poss;
    }

    @RequestMapping("selectorDetail/{id}")
    public String selectorDetail(@PathVariable String id, Model model, HttpSession session) {
        Member member = this.getMember(session);

        if (member != null) {
            member = this.memberService.getMemberByName(member.getUsername());
        }

        ArticleCurriculum ac = this.selectorService.getArticleCurriculumById(id);

        ac.setCollectFlag(false);

        if (member != null && !CollectionUtils.isEmpty(member.getaCCollects())) {
            for (ACCollect aCCollect : member.getaCCollects()) {
                try {
                    if (Des.encrypt(aCCollect.getAcid() + "").equals(ac.getDesEntryId())) {
                        ac.setCollectFlag(true);
                        break;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        model.addAttribute("ac", ac);
        model.addAttribute("systemConfig", this.systemConfig);
        return "H5/selector-detail";
    }

    @RequestMapping("acCollect/{id}")
    @ResponseBody
    public Map<String, Object> acCollect(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.selectorService.acCollect(id, member);
    }

    @RequestMapping(value = "doposcom", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doposcom(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.doposcom(params, member);
    }


    @RequestMapping("tolearn/{id}")
    public String tolearn(Model model, HttpSession session, @PathVariable String id) {
        model.addAttribute("systemConfig", systemConfig);
        ArticleCurriculum ac = this.selectorService.getArticleCurriculumById(id);
        model.addAttribute("ac", this.selectorService.getArticleCurriculumById(id));
        if (YesOrNoEnum.YES.name().equals(ac.getNeedpay())) {
            //支付页面
            return "H5/selector-pay";
        } else {
            //详情内容
            return "H5/selector-content";
        }

    }

    @RequestMapping("finalScore")
    @ResponseBody
    public Map<String, Object> finalScore(Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.finalScore(member);
    }


    /*考试日历*/
    @RequestMapping("calendar")
    public String calendar() {
        return "pcH5Plus/day";
    }


    /*考试日历和报名日历*/
    @RequestMapping("examCalendar")
    @ResponseBody
    public Map<String, Object> examCalendar(@RequestParam() Map<String, String> params) {
        return this.memberService.getExamCalendar(params);
    }

    @RequestMapping("openApplyForm/{code}")
    public String openApplyForm(@PathVariable String code, Model model) {
        model.addAttribute("applyList", this.memberService.applyList(code));
        return "pcH5Plus/detail_day_tableA";
    }

    @RequestMapping("openExamForm/{code}")
    public String openExamForm(@PathVariable String code, Model model) {
        model.addAttribute("examList", this.memberService.examList(code));
        return "pcH5Plus/detail_day_tableB";
    }
    /*打开链接*/
    @RequestMapping("openExam/{code}")
    @ResponseBody
    public Map<String, Object> openExam(@PathVariable String code, Model model, @RequestParam() Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        result.put("msg", code);
        return result;
    }
}
