package com.hx.hxjob.controller.pc;

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
    @Autowired
    private PositionService positionService;
    @Autowired
    private SelectorService selectorService;
    @Autowired
    private MemberTestService memberTestService;

    @Autowired
    private MemberService memberService;

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

    /**
     * @Description 查询机构列表数据
     * @Params [params, model, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgDatas")
    @ResponseBody
    public Map<String, Object> orgDatas(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getOrgs(params, member);
    }

    /**
     * @Description 查询机构热度
     * @Params [params, model, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("getOrgsHot")
    @ResponseBody
    public Map<String, Object> getOrgsHot(@RequestParam() Map<String, String> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getOrgsHot(params, member);
    }

    /**
     * @Description 首页机构热度查询
     * @Params [params, session]
     * @Return java.util.List<com.hx.hxjob.model.Organization>
     **/
    @RequestMapping("orgsIndexDatas")
    @ResponseBody
    public List<Organization> orgsIndexDatas(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgsIndexDatas(params, member);
    }

    /**
     * @Description 机构点赞查询
     * @Params [code, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgPraise/{code}")
    @ResponseBody
    public Map<String, Object> orgPraise(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgPraise(code, member);
    }

    /**
     * @Description 机构收藏查询
     * @Params [code, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgCollect/{code}")
    @ResponseBody
    public Map<String, Object> orgCollect(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCollect(code, member);
    }

    /**
     * @Description 展示用户评论页
     * @Params [code, model, session]
     * @Return java.lang.String
     **/
    @RequestMapping("tocomment/{code}")
    public String commentPage(@PathVariable String code, Model model, HttpSession session) {
        Member member = this.getMember(session);
        model.addAttribute("cities", this.organizationService.getCities());
        model.addAttribute("orgcode", code);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        return "pcPlus/remark";
    }

    /**
     * @Description 用户评论数据提交
     * @Params [params, imgUpload, request, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("userOrgComment")
    @ResponseBody
    public Map<String, Object> userOrgComment(@RequestParam() Map<String, Object> params, MultipartFile imgUpload, HttpServletRequest request, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.userOrgComment(params, imgUpload, member, request);
    }

    /**
     * @Description 展示评论列表
     * @Params [code, model, session]
     * @Return java.lang.String
     **/
    @RequestMapping("tocommentlist/{code}")
    public String commentListPage(@PathVariable String code, Model model, HttpSession session) {
        Member member = this.getMember(session);
        model.addAttribute("orgcode", code);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        /*计算成长，工作量，氛围，以及满意度*/
        model.addAttribute("systemConfig", systemConfig);
        /*判断是否评论过*/
        model.addAttribute("whetherRemark", this.organizationService.whetherRemark(code, member));
        return "pcPlus/detail_company";
    }

    /**
     * @Description 显示首页评论列表
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("getIndexRemark")
    @ResponseBody
    public Map<String, Object> getIndexRemark(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.getIndexRemark(params, member);
    }

    /**
     * @Description 显示评论列表
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgComments")
    @ResponseBody
    public Map<String, Object> orgComments(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgComments(params, member);
    }

    /**
     * @Description 设置私信功能
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("replyOk")
    @ResponseBody
    public Map<String, Object> replyOk(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.replyOk(params, member);
    }

    /**
     * @Description 显示推荐评论
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgCommentsRecommend")
    @ResponseBody
    public Map<String, Object> orgCommentsRecommend(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsRecommend(params, member);
    }

    /**
     * @Description 显示在职评论
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgCommentsOnJob")
    @ResponseBody
    public Map<String, Object> orgCommentsOnJob(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsOnJob(params, member);
    }

    /**
     * @Description 显示实习评论
     * @Params [params, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("orgCommentsPractice")
    @ResponseBody
    public Map<String, Object> orgCommentsPractice(@RequestParam() Map<String, String> params, HttpSession session) {
        Member member = this.getMember(session);
        return this.organizationService.orgCommentsPractice(params, member);
    }

    @RequestMapping("psocom")
    public String psocom(@PathVariable String code, Model model) {
        model.addAttribute("orgcode", code);
        model.addAttribute("org", this.organizationService.getOrganization(code));
        model.addAttribute("systemConfig", systemConfig);
        return "pc/comment-list";
    }

    @RequestMapping("pos")
    public String position(Model model, @RequestParam() Map<String, String> params) {
        model.addAttribute("industries", this.organizationService.getIndustries());
        List<City> cities = this.organizationService.getCities();
        model.addAttribute("cities", cities);
        model.addAttribute("systemConfig", systemConfig);
        if (!StringUtils.isEmpty(params.get("sc"))) {
            model.addAttribute("searchContent", MyEscape.unescape(params.get("sc")));
            List<String> positionList = positionService.getPositionByTitle(MyEscape.unescape(params.get("sc")));
            if (positionList.size() == 0) {
                return "pcPlus/head_company";
            }
        }
        if (!StringUtils.isEmpty(params.get("scd"))) {
            model.addAttribute("searchContentId", MyEscape.unescape(params.get("scd")));
        }
        /*判断当用户查询数据不为职业时返回机构页面查询*/
        return "pcPlus/head_job";
    }

    @RequestMapping("posDatas")
    @ResponseBody
    public Map<String, Object> posDatas(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.positionService.getPoss(params, member);
    }

    /*热度*/
    @RequestMapping("getPossHot")
    @ResponseBody
    public Map<String, Object> getPossHot(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.positionService.getPossHot(params, member);
    }

    /**
     * @Description 显示在前台的job
     * @Params [params, model, session]
     * @Return java.util.List<com.hx.hxjob.model.Position>
     **/
    @RequestMapping("posIndexDatas")
    @ResponseBody
    public List<Position> posIndexDatas(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        List<Position> poss = this.positionService.posIndexDatas(params, member);
        return poss;
    }

    /**
     * @Description 显示在前台的job
     * @Params [code, model]
     * @Return java.lang.String
     **/
    @RequestMapping("posDetail/{code}")
    public String posDetail(@PathVariable String code, Model model) {
        model.addAttribute("code", code);
        model.addAttribute("systemConfig", systemConfig);
        Model pos = model.addAttribute("pos", this.positionService.getPosByCode(code));
        Model brOriginal2 = model.addAttribute("brOriginal2", this.selectorService.brOriginal2());
        return "pcPlus/detail_job";
    }

    /**
     * @Description 显示热门职业
     * @Params [model]
     * @Return java.lang.String
     **/
    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("hotPoss", this.positionService.getPcHotPosition());
        return "pcPlus/index";
    }

    @RequestMapping("poscom")
    public String poscom(Model model, HttpSession session) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("hotPoss", this.positionService.getPcHotPosition());
        return "pcPlus/detail_Form";
    }

    @RequestMapping(value = "doposcom", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doposcom(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.doposcom(params, member);
    }

    /**
     * @Description 得分统计
     * @Params [model, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("finalScore")
    @ResponseBody
    public Map<String, Object> finalScore(Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.finalScore(member);
    }

    @RequestMapping("finalScoreSub")
    @ResponseBody
    public Map<String, Object> finalScoreSub(Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.finalScoreSub(member);
    }

    @RequestMapping("poslist/{code}")
    public String positionlist(@PathVariable String code, Model model, HttpSession session) {
        model.addAttribute("systemConfig", systemConfig);
        model.addAttribute("orgcode", code);
        model.addAttribute("data", this.positionService.getOrgPosiitons(code));
        model.addAttribute("org", this.organizationService.getOrganization(code));
        return "pc/position-list";
    }

    @RequestMapping("character")
    public String character(Model model, HttpSession session) {
        return "pcPlus/head_test";
    }

    @RequestMapping("toCharacter")
    public String toCharacter() {
        return "pcPlus/detail_test1";
    }

    @RequestMapping(value = "docharacter", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> docharacter(@RequestParam() Map<String, Object> params, Model model, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.docharacter(params, member);
    }

    @RequestMapping(value = "alreadAssess", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alreadAssess(HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.alreadAssess(member);
    }

    @RequestMapping(value = "repeat", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> repeat(HttpSession session) {
        Member member = this.getMember(session);
        return this.memberTestService.repeat(member);
    }

    @RequestMapping("selector")
    public String selector(Model model, HttpSession session) {
        model.addAttribute("systemConfig", systemConfig);
        return "pcPlus/head_good";
    }

    /*显示在前台的原创信息*/
    @RequestMapping("brOriginal")
    @ResponseBody
    public List<Advice> brOriginal(@RequestParam() Map<String, String> param) {
        List<Advice> map = this.selectorService.brOriginal(param);
        return map;
    }

    /**
     * @Description 获取公告数据到前台
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("selectorList")
    @ResponseBody
    public Map<String, Object> selectorList(@RequestParam() Map<String, String> params) {
        return this.selectorService.getACPageForPC(params);
    }

    /**
     * @Description 获取公告详情页
     * @Params [id, model]
     * @Return java.lang.String
     **/
    @RequestMapping("toAdviceDetails/{id}")
    public String toAdviceDetails(@PathVariable int id, Model model) {
        model.addAttribute("AdviceDetails", this.selectorService.toAdviceDetails(id));
        return "pcPlus/detail_article";
    }

    /**
     * @Description 获取所属
     * @Params [cid, model]
     * @Return java.lang.String
     **/
    @RequestMapping("toAdviceList/{cid}")
    public String toAdviceList(@PathVariable int cid, Model model) {
        model.addAttribute("ac", this.selectorService.getArticleCommand(cid));
        model.addAttribute("commandNumber", this.selectorService.getCommandNumber(cid));
        /*获取热门所属信息（title,关注人数，新闻列表）*/
        model.addAttribute("hotCommand", this.selectorService.gethotCommandList());
        model.addAttribute("commandNumberOfHot", this.selectorService.getCommandNumberOfHot());
        model.addAttribute("systemConfig", systemConfig);
        return "pcPlus/detail_good";
    }

    /**
     * @Description 获取新闻对应的所属列表
     * @Params [id, httpSession]
     * @Return java.util.List<com.hx.hxjob.model.ArticleCommand>
     **/
    @RequestMapping("goodsList/{id}")
    @ResponseBody
    public List<ArticleCommand> getGoodsList(@PathVariable int id, HttpSession httpSession) {
        Member member = this.getMember(httpSession);
        return this.selectorService.getGoodsList(id, member);
    }

    /**
     * @Description 给所属添加关注信息
     * @Params [id, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("attention/{id}")
    @ResponseBody
    public Map<String, Object> attention(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.selectorService.attention(id, member);
    }

    @RequestMapping("detailBeckham")
    public String detailBeckham() {
        return "pcPlus/detail_beckham";
    }

    @RequestMapping("detailDownload")
    public String detailDownload() {
        return "pcPlus/detail_download";
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
        return "pc/selector-detail";
    }

    @RequestMapping("acCollect/{id}")
    @ResponseBody
    public Map<String, Object> acCollect(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.selectorService.acCollect(id, member);
    }

    /**
     * @Description 界面切换
     * @Params [model, session, id]
     * @Return java.lang.String
     **/
    @RequestMapping("tolearn/{id}")
    public String tolearn(Model model, HttpSession session, @PathVariable String id) {
        model.addAttribute("systemConfig", systemConfig);
        ArticleCurriculum ac = this.selectorService.getArticleCurriculumById(id);
        if (YesOrNoEnum.YES.name().equals(ac.getNeedpay())) {
            //支付页面
            return "pc/selector-pay";
        } else {
            model.addAttribute("ac", this.selectorService.getArticleCurriculumById(id));
            //详情内容
            return "pc/selector-content";
        }
    }

    @RequestMapping("about")
    public String about() {
        return "pc/about";
    }

    /**
     * @Description 存储用户和用户绑定的职业信息
     * @Params [code, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("save/{code}")
    @ResponseBody
    public Map<String, Object> savePositionAndMember(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.savePositionAndMember(code, member);
    }

    /**
     * @Description 删除储存
     * @Params [code, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("deleteSave/{code}")
    @ResponseBody
    public Map<String, Object> deleteSave(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.deleteSave(code, member);
    }

    /**
     * @Description 删除机构连接
     * @Params [code, session]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("deleteCollectOrg/{code}")
    @ResponseBody
    public Map<String, Object> deleteCollectOrg(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.deleteCollectOrg(code, member);
    }

    /**
     * @Description 得到中心评论
     * @Params [session]
     * @Return java.util.List<com.hx.hxjob.model.OrganizationRemark>
     **/
    @RequestMapping("getRemark")
    @ResponseBody
    public List<OrganizationRemark> getRemark(HttpSession session) {
        Member member = this.getMember((session));
        return this.memberService.getRemark(member);
    }

    /**
     * @Description 删除个人中心点评及所属
     * @Params [id]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("deleteRemark/{id}")
    @ResponseBody
    public Map<String, Object> deleteRemark(@PathVariable String id) {
        return this.memberService.deleteRemark(id);
    }

    /**
     * @Description 我赞过的
     * @Params [session]
     * @Return java.util.List<com.hx.hxjob.model.Member>
     **/
    @RequestMapping("alreadyPraise")
    @ResponseBody
    public List<Member> alreadyPraise(HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.alreadyPraise(member);
    }

    /**
     * @Description 显示回复信息
     * @Params [session]
     * @Return java.util.List<com.hx.hxjob.model.organizationReply>
     **/
    @RequestMapping("letter")
    @ResponseBody
    public List<organizationReply> letter(HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.letter(member);
    }

    /**
     * @Description 清空评论
     * @Params [id]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("clearLetter/{id}")
    @ResponseBody
    public Map<String, Object> clearLetter(@PathVariable String id) {
        return this.memberService.clearLetter(id);
    }

    @RequestMapping("getMenJobWhether/{code}")
    @ResponseBody
    public SavePositionMember getMenJobWhether(@PathVariable String code, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.getMenJobWhether(code, member);
    }

    @RequestMapping("getNewWhether/{id}")
    @ResponseBody
    private ArticleCommandAttention getNewWhether(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.getNewWhether(id, member);
    }

    @RequestMapping("praiseRemark/{id}")
    @ResponseBody
    public Map<String, Object> praiseRemark(@PathVariable String id, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.savePraiseRemark(id, member);
    }

    @RequestMapping("everyoneSay/{orgcode}")
    @ResponseBody
    public Organization everyoneSay(@PathVariable String orgcode, HttpSession session) {
        Member member = this.getMember(session);
        return this.memberService.everyoneSay(orgcode, member);
    }

    /**
     * @Description 提取用户绑定的机构信息
     * @Params [id]
     * @Return java.util.List<com.hx.hxjob.model.Organization>
     **/
    @RequestMapping("orgRefresh/{id}")
    @ResponseBody
    public List<Organization> orgGet(@PathVariable Integer id) {
        return this.memberService.orgGet(id);
    }

    /**
     * @Description 提取用户绑定的职业信息
     * @Params [id]
     * @Return java.util.List<com.hx.hxjob.model.Position>
     **/
    @RequestMapping("getPositionSave/{id}")
    @ResponseBody
    public List<Position> posGet(@PathVariable Integer id) {
        return this.memberService.posGet(id);
    }

    /**
     * @Description 显示考试日历
     * @Params []
     * @Return java.lang.String
     **/
    @RequestMapping("calendar")
    public String calendar() {
        return "pcPlus/head_day";
    }

    /**
     * @Description 考试日历和报名日历
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("examCalendar")
    @ResponseBody
    public Map<String, Object> examCalendar(@RequestParam() Map<String, String> params) {
        return this.memberService.getExamCalendar(params);
    }

    /*打开链接*/
    @RequestMapping("openExam/{code}")
    @ResponseBody
    public Map<String, Object> openExam(@PathVariable String code, Model model, @RequestParam() Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        result.put("msg", code);
        return result;
    }

    @RequestMapping("openApplyForm/{code}")
    public String openApplyForm(@PathVariable String code, Model model) {
        model.addAttribute("applyList", this.memberService.applyList(code));
        return "pcPlus/detail_day_tableA";
    }

    @RequestMapping("openExamForm/{code}")
    public String openExamForm(@PathVariable String code, Model model) {
        model.addAttribute("examList", this.memberService.examList(code));
        return "pcPlus/detail_day_tableB";
    }

    /**
     * @Description 百度云下载连接
     * @Params [params]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     **/
    @RequestMapping("downList")
    @ResponseBody
    public Map<String, Object> downList(@RequestParam() Map<String, String> params) {
        return this.memberService.downList(params);
    }
}
