package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.dao.MemberTestMapper;
import com.hx.hxjob.model.*;
import com.hx.hxjob.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class MemberTestService {

    @Autowired
    private MemberTestMapper memberTestMapper;

    String[] gender = {"男"};
    String[] nativePlace = {"北京", "上海", "广州", "深圳", "黑龙江哈尔滨", "吉林长春", "辽宁沈阳", " 内蒙古呼和浩特", "河北石家庄", "新疆乌鲁木齐", "甘肃兰州",
            "黑龙江西宁", "陕西西安", " 宁夏银川", " 河南郑州", "山东济南", "山西太原", "安徽合肥", "湖北武汉", "湖南长沙", "江苏南京", "四川成都",
            "贵州贵阳", "云南昆明", "广西南宁", "西藏拉萨", "浙江杭州", "江西南昌", "广东广州", "福建福州", "台湾台北", "海南海口", "香港", "澳门"}; /*1.5分*/
    String[] PoliticalBackground = {"中共党员", "其他党派", "群众", "其他"};/*1.5分*/
    String[] school1 = {"清华大学", "北京大学", "武汉大学", "浙江大学",
            "复旦大学",
            "中国人民大学",
            "上海交通大学",
            "南京大学"};
    String[] school2 = {"中山大学", "吉林大学", "北京师范大学", "华中科技大学", "四川大学", "中国科学技术大学", "南开大学", "山东大学", "中南大学", "西安交通大学", "厦门大学", "哈尔滨工业大学",
            "北京航空航天大学", "同济大学", "天津大学", "华东师范大学", "东南大学", "北京理工大学", "重庆大学", "西南财经大学", "中央财经大学", "对外经济贸易大学", "中国政法大学",
            "北京协和医学院"};
    String[] school3 = {"中国农业大学", "华南理工大学", "湖南大学", "西北工业大学", "大连理工大学", "东北大学", "兰州大学", "中国海洋大学", "电子科技大学", "西北农林科技大学",
            "中央民族大学", "中南财经政法大学", "暨南大学", "北京交通大学", "北京邮电大学"};
    String[] school4 = {"广西大学", "中国药科大学", "长安大学", "上海财经大学", "华东理工大学", "苏州大学", "南京航空航天大学", "郑州大学", "华中师范大学", "南京农业大学", "西南大学",
            "武汉理工大学", "上海大学", "南京理工大学", "东北师范大学", "江南大学", "西安电子科技大学", "华中农业大学", "西南交通大学", "华北电力大学（北京）", "北京科技大学", "北京化工大学", "东华大学",
            "南京师范大学", "华南师范大学", "西北大学", "陕西师范大学", "哈尔滨工程大学", "河海大学", "南昌大学", "北京工业大学", "湖南师范大学", "福州大学", "合肥工业大学", "云南大学",
            "安徽大学", "太原理工大学", "贵州大学", "北京林业大学", "东北林业大学", "新疆大学", "中国传媒大学", "四川农业大学", "天津医科大学", "辽宁大学", "东北农业大学", "河北工业大学",
            "北京中医药大学", "上海外国语大学", "大连海事大学", "北京外国语大学", "内蒙古大学", "石河子大学", "海南大学", "延边大学", "宁夏大学", "中央音乐学院", "北京体育大学", "青海大学"};
    String[] majorBen1 = {"金融学/国际金融", "金融工程/计量经济学", "经济学/国际贸易", "财务管理/会计", "统计学/数学", "法学", "计算机科学/软件工程"};
    String[] majorBen2 = {"物理/化学/生物等基础学科", "工商管理", "企业管理", "市场营销", "电子商务", "信息系统"};
    String[] majorBen3 = {"外语", "历史", "中文", "艺术类", "社会学", "心理学", "其他文史类专业"};
    String[] nationBook = {"国家级奖学金/学生干部/大赛获奖", "省级奖学金/学生干部/大赛获奖", "校级奖学金/学生干部/大赛获奖", "无或其他"}; /*奖学金*/
    String[] skillBook = {"计算机相关证书", "司法相关证书", "金融相关证书", "从业资格"};
    String[] languageBook = {"英文4/6级", "托福/雅思", "托业", "Office", "C# JAVA", "无"};
    String[] highBook = {"国家一级运动员/演员", "国家二级运动员/演员", "省级运动员/演员"};
    String[] company1 = {};
    String[] company2 = {};

    public Map<String, Object> getMemberPosAcomPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();

        PageUtil.dealPageParamForLayer(params);

        result.put("rows", this.memberTestMapper.getPosAndComTest(params));
        result.put("total", this.memberTestMapper.getPosAndComTestCount(params));

        return result;
    }


    @Transactional
    public synchronized Map<String, Object> doposcom(Map<String, Object> params, Member member) {
        Map<String, Object> result = new HashMap<String, Object>();

        if (member == null) {
            result.put("code", -9);
            result.put("msg", "用户未登录");
            return result;
        }

        String dataStr = (String) params.get("datas");

        try {

            //查询用户是否已有测评数据
            int count = this.memberTestMapper.getPoscomTestByMemberid(member.getId() + "");
            if (count > 0) {
                result.put("code", -1);
                result.put("msg", "你已完成测评");
                return result;
            }

            Map<String, Object> datas = JSON.parseObject(dataStr);


            /*主体数据*/
            String gender1 = (String) datas.get("gender");
            String nativePlace1 = (String) datas.get("native_place");
            String political_background1 = (String) datas.get("political_background");
            String birthday = (String) datas.get("birthday");

            if (Arrays.asList(gender).contains(gender1)) {
                datas.put("genderGrade", "5");
            } else {
                datas.put("genderGrade", "0");
            }
            if (Arrays.asList(nativePlace).contains(nativePlace1)) {
                datas.put("nativePlaceGrade", "1.5");
            } else {
                datas.put("nativePlaceGrade", "0");
            }
            if (Arrays.asList(PoliticalBackground).contains(political_background1)) {
                datas.put("politicalBackgroundGrade", "1.5");
            } else {
                datas.put("politicalBackgroundGrade", "0");
            }
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
            String format = dateFormat.format(date);
            /*计算时间差*/
            Date frome = DateFormat.getDateInstance().parse(format);
            Date to = DateFormat.getDateInstance().parse(birthday);
            Calendar calFrom = Calendar.getInstance();
            calFrom.setTime(frome);
            calFrom.set(Calendar.DAY_OF_MONTH, 1);
            calFrom.set(Calendar.DATE, 1);
            Calendar calTo = Calendar.getInstance();
            calTo.setTime(to);
            calFrom.set(Calendar.DAY_OF_MONTH, 1);
            calTo.set(Calendar.DATE, 1);
            int countDay = 0;
            while (calFrom.before(calTo)) {
                calFrom.add(Calendar.YEAR, 1);
                count++;
            }
            if (countDay < 26) {
                datas.put("birthdayGrade", "2");
            } else {
                datas.put("birthdayGrade", "1");
            }

            /*大赛，社会实践，项目经历*/
            String exchange_student = (String) datas.get("exchange_student");
            String social_sractice = (String) datas.get("social_sractice");
            if (exchange_student != null) {
                datas.put("exchangeStudentGrade", 2);
            }
            if (social_sractice != null) {
                datas.put("socialSracticeGrade", 2);
            }

            //插入测评主体数据
            datas.put("memberid", member.getId());
            this.memberTestMapper.addPoscomTest(datas);

            /*=================================================================================*/

            //教育背景分数判断(本科)
            String school = (String) datas.get("school");
            if (Arrays.asList(school1).contains(school)) {
                datas.put("schoolGrade", "10");
            } else if (Arrays.asList(school2).contains(school)) {
                datas.put("schoolGrade", "8");
            } else if (Arrays.asList(school3).contains(school)) {
                datas.put("schoolGrade", "6");
            } else if (Arrays.asList(school4).contains(school)) {
                datas.put("schoolGrade", "3");
            } else {
                datas.put("schoolGrade", "1");
            }
            String major_ben = (String) datas.get("major_ben");
            if (Arrays.asList(majorBen1).contains(major_ben)) {
                datas.put("majorBenGrade", "7");
            } else if (Arrays.asList(majorBen2).contains(major_ben)) {
                datas.put("majorBenGrade", "5");
            } else if (Arrays.asList(majorBen3).contains(major_ben)) {
                datas.put("majorBenGrade", "2");
            } else {
                datas.put("majorBenGrade", "2");
            }

            this.memberTestMapper.addSchoolBen(datas);
            //专业分数判断
            //教育背景分数判断(硕士)
            String school_plus = (String) datas.get("school_plus");
            if (Arrays.asList(school1).contains(school_plus)) {
                datas.put("schoolPlusGrade", "10");
            } else if (Arrays.asList(school2).contains(school_plus)) {
                datas.put("schoolPlusGrade", "8");
            } else if (Arrays.asList(school3).contains(school_plus)) {
                datas.put("schoolPlusGrade", "6");
            } else if (Arrays.asList(school4).contains(school_plus)) {
                datas.put("schoolPlusGrade", "3");
            } else {
                datas.put("schoolPlusGrade", "1");
            }
            String major_shuo = (String) datas.get("major_shuo");
            //专业分数判断
            if (Arrays.asList(majorBen1).contains(major_shuo)) {
                datas.put("majorShuoGrade", "8");
            } else if (Arrays.asList(majorBen2).contains(major_shuo)) {
                datas.put("majorShuoGrade", "5");
            } else if (Arrays.asList(majorBen3).contains(major_shuo)) {
                datas.put("majorShuoGrade", "2");
            } else {
                datas.put("majorShuoGrade", "2");
            }

            if (Arrays.asList(majorBen1).contains(major_ben) && Arrays.asList(majorBen1).contains(major_shuo)) {
                datas.put("majorGroupGrade", "5");
            } else if (Arrays.asList(majorBen1).contains(major_ben) && Arrays.asList(majorBen2).contains(major_shuo)) {
                datas.put("majorGroupGrade", "5");
            } else if (Arrays.asList(majorBen1).contains(major_ben) && Arrays.asList(majorBen3).contains(major_shuo)) {
                datas.put("majorGroupGrade", "5");
            } else if (Arrays.asList(majorBen2).contains(major_ben) && Arrays.asList(majorBen2).contains(major_shuo)) {
                datas.put("majorGroupGrade", "3");
            } else {
                datas.put("majorGroupGrade", "2");
            }
            this.memberTestMapper.addSchoolShuo(datas);

            /*=========================================================================================*/

            /*证书*/
            String skill_book1 = (String) datas.get("skill_book1");
            if (Arrays.asList(skillBook).contains(skill_book1)) {
                datas.put("skillBookGrade1", "11");
            }
            String skill_book2 = (String) datas.get("skill_book2");
            if (Arrays.asList(skillBook).contains(skill_book2)) {
                datas.put("skillBookGrade2", "7");
            }
            String skill_book3 = (String) datas.get("skill_book3");
            if (Arrays.asList(skillBook).contains(skill_book3)) {
                datas.put("skillBookGrade3", "7");
            }
            String skill_book4 = (String) datas.get("skill_book4");
            if (Arrays.asList(skillBook).contains(skill_book4)) {
                datas.put("skillBookGrade4", "4");
            }
            this.memberTestMapper.addSkillBook(datas);

            /*语言证书*/
            String language_book1 = (String) datas.get("language_book1");
            if (Arrays.asList(languageBook).contains(language_book1)) {
                datas.put("languageBookGrade1", "1");
            }
            String language_book2 = (String) datas.get("language_book2");
            if (Arrays.asList(languageBook).contains(language_book2)) {
                datas.put("languageBookGrade2", "1");
            }
            String language_book3 = (String) datas.get("language_book3");
            if (Arrays.asList(languageBook).contains(language_book3)) {
                datas.put("languageBookGrade3", "1");
            }
            String language_book4 = (String) datas.get("language_book4");
            if (Arrays.asList(languageBook).contains(language_book4)) {
                datas.put("languageBookGrade4", "1");
            }
            this.memberTestMapper.addlanguageBook(datas);

            /*其他技能*/
            String high_book = (String) datas.get("high_book");

            if (Arrays.asList(highBook).contains(high_book)) {
                datas.put("highBookGrade", "2");
            }
            this.memberTestMapper.addHighBook(datas);

            /*专业考试证书*/
            String nation_book1 = (String) datas.get("nation_book1");
            if (Arrays.asList(nationBook).contains(nation_book1)) {
                datas.put("nationBookGrade1", "2");
            }

            String nation_book2 = (String) datas.get("nation_book2");
            if (Arrays.asList(nationBook).contains(nation_book2)) {
                datas.put("nationBookGrade2", "2");
            }

            String nation_book3 = (String) datas.get("nation_book3");
            if (Arrays.asList(nationBook).contains(nation_book3)) {
                datas.put("nationBookGrade3", "1");
            }
            String nation_book4 = (String) datas.get("nation_book4");
            if (Arrays.asList(nationBook).contains(nation_book4)) {
                datas.put("nationBookGrade4", "1");
            }
            this.memberTestMapper.addNationBook(datas);

            /*实习单位*/
            String practice_unit_one = (String) datas.get("practice_unit_one");
            if (Arrays.asList(company1).contains(practice_unit_one)) {
                datas.put("practiceUnitOneGrade", "5");
            } else if (Arrays.asList(company2).contains(practice_unit_one)) {
                datas.put("practiceUnitOneGrade", "3");
            } else {
                datas.put("practiceUnitOneGrade", "1");
            }
            String practice_unit_two = (String) datas.get("practice_unit_two");
            if (Arrays.asList(company1).contains(practice_unit_two)) {
                datas.put("practiceUnitTwoGrade", "4");
            } else if (Arrays.asList(company2).contains(practice_unit_two)) {
                datas.put("practiceUnitTwoGrade", "2");
            } else {
                datas.put("practiceUnitTwoGrade", "1");
            }

            String practice_unit_three = (String) datas.get("practice_unit_three");
            if (Arrays.asList(company1).contains(practice_unit_three)) {
                datas.put("practiceUnitThreeGrade", "2");
            } else if (Arrays.asList(company2).contains(practice_unit_three)) {
                datas.put("practiceUnitThreeGrade", "1");
            } else {
                datas.put("practiceUnitThreeGrade", "0");
            }

            if (Arrays.asList(company1).contains(practice_unit_one) && Arrays.asList(company1).contains((practice_unit_two))) {
                datas.put("practiceGroupUnit", 3);
            } else {
                datas.put("practiceGroupUnit", 1);
            }

            this.memberTestMapper.addPracticeUnit(datas);


            result.put("code", 0);
            result.put("msg", "提交成功");

        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }

        return result;
    }


    public PosAndComTest getPosAndComTestById(String id) {
        return this.memberTestMapper.getPosAndComTestById(id);
    }


    @Transactional
    public synchronized Map<String, Object> docharacter(Map<String, Object> params, Member member) {
        Map<String, Object> result = new HashMap<String, Object>();

        if (member == null) {
            result.put("code", -9);
            result.put("msg", "用户未登录");
            return result;
        }

        String dataStr = (String) params.get("datas");

        try {

            int count = this.memberTestMapper.getCharacter(member.getId() + "");


            Map<String, Object> test = new HashMap<String, Object>();
            test.put("memberid", member.getId());

            List<Object> datas = JSON.parseArray(dataStr);

            List<Map<String, Object>> dataMaps = new ArrayList<Map<String, Object>>();

            for (Object obj : datas) {
                Map<String, Object> data = (Map<String, Object>) obj;
                dataMaps.add(data);
            }
            if (count == 0) {
                if (dataMaps.size() < 30) {
                    result.put("code", -1);
                    result.put("msg", "您当前填写的题目未满30题,请填满再提交");
                    return result;
                }
                this.memberTestMapper.addCharacter(test);
                this.memberTestMapper.addCharacterDetail(dataMaps, String.valueOf((long) test.get("id")));
                result.put("code", 1);
                result.put("msg", "提交成功，点击【评估结果】查看评估");
                return result;
            } else {
                /*评分算法*/
                Integer id = memberTestMapper.getTestId(member.getId());
                SelectGrade selectGrade = this.memberTestMapper.getSelectGrade(id);
                if (selectGrade.getOne() < 9 && selectGrade.getOne() < 9 && selectGrade.getThree() < 9 && selectGrade.getFour() < 9) {
                    result.put("code", 0);
                    result.put("msg1", "根据您的信息填写，系统判定结果:");
                    result.put("msg2", "被测者性格色彩较为平均，是一个复杂型选手");
                    result.put("msg3", "对评估结果不满意？点击下方重新评估");
                    return result;
                } else {
                    result.put("code", 2);
                    result.put("msg1", "根据您的信息填写，系统判定结果:");
                    result.put("msg2", "被测者性格倾向性较为明显，是一个倾向性选手");
                    result.put("msg3", "对评估结果不满意？点击下方重新评估");
                    return result;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }

        return result;
    }

    public Map<String, Object> repeat(Member member) {
        Map<String, Object> result = new HashMap<>();

        if (member != null) {
            Integer testId = memberTestMapper.getTestId(member.getId());
            /*清除题目*/
            memberTestMapper.clearTopic(testId);
            /*请除评分*/
            memberTestMapper.clearGrade(member.getId());
            result.put("code", 0);
        }
        return result;
    }

    public Map<String, Object> alreadAssess(Member member) {
        Map<String, Object> result = new HashMap<>();
        if (member != null) {
            Integer id = memberTestMapper.getTestId(member.getId());
            if (id != null) {
                result.put("code", 0);
            }
        }
        return result;
    }

    public Map<String, Object> characterPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();

        PageUtil.dealPageParamForLayer(params);

        result.put("rows", this.memberTestMapper.getCharacterMember(params));
        result.put("total", this.memberTestMapper.getCharacterMemberCount(params));

        return result;
    }

    public List<Map<String, Object>> getCharacterDetail(String memberid) {
        return this.memberTestMapper.getMemberCharacters(memberid);
    }


    public Map<String, Object> finalScore(Member member) {
        Map<String, Object> result = new HashMap<>();
        if (member != null) {
            String memberid = String.valueOf(member.getId());
            int finalScore = this.memberTestMapper.finalScore(memberid);
            this.memberTestMapper.setfinalScore(memberid, finalScore);
            int defeat = this.memberTestMapper.defeatCompetitionPeople(memberid);
            SchoolMajorBen goodBad = this.memberTestMapper.getGoodBad(memberid);
            PositionCompetionTest suggest = this.memberTestMapper.getSuggest(memberid);
            if (goodBad != null) {
                if (Arrays.asList(majorBen1).contains(goodBad.getMajorBen())) {
                    result.put("recommend1", "金融,经济学，国际贸易，财务管理等工作");
                } else if (Arrays.asList(majorBen2).contains(goodBad.getMajorBen())) {
                    result.put("recommend1", "计算机科学/软件工程，工商管理，企业管理，市场营销等工作");
                } else {
                    result.put("recommend1", "暂无更好的推荐");
                }
            }
            if (suggest.getSkillBook1() == null) {
                result.put("suggest1", "您需要更高级别的专业考试证书!");
            } else if (suggest.getLanguageBook1() == null) {
                result.put("suggest1", "也许您可以提升一下英语水平呢!");
            } else if (suggest.getPracticeUnitOne() == null) {
                result.put("suggest1", "提高一下实习经验会超越更多对手哦！");
            } else {
                result.put("suggest1", "您很优秀，可以更优秀");
            }
            if (finalScore >= 90 && finalScore < 100) {
                result.put("contend", "特别有竞争力");
            } else if (finalScore < 90 && finalScore > 60) {
                result.put("contend", "有竞争力");
            } else {
                result.put("contend", "没有竞争力");
            }
            result.put("finalScore", finalScore);
            result.put("defeat", defeat);
            result.put("suggest", suggest);
            result.put("goodBad", goodBad);
        }
        return result;
    }

    public Map<String, Object> finalScoreSub(Member member) {
        Map<String, Object> result = new HashMap<>();
        if (member != null) {
            String memberid = String.valueOf(member.getId());
            int score = this.memberTestMapper.finalScoreSub(memberid);
            if (score != 0) {
                result.put("code",-1);
            }
        }
        return result;
    }
}
