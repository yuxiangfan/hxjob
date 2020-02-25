package com.hx.hxjob.dao;

import com.hx.hxjob.model.PosAndComTest;
import com.hx.hxjob.model.PositionCompetionTest;
import com.hx.hxjob.model.SchoolMajorBen;
import com.hx.hxjob.model.SelectGrade;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberTestMapper {


    public List<PosAndComTest> getPosAndComTest(Map<String, String> params);

    public int getPosAndComTestCount(Map<String, String> params);

    public void addPoscomTest(Map<String, Object> params);

    /*	public void addEdus(@Param(value="edus")List<Map<String,Object>> edus,@Param(value="testid")String testid);*/

    /*	public void addExps(@Param(value="exps")List<Map<String,Object>> exps,@Param(value="testid")String testid);*/

    public void addPros(@Param(value = "pros") List<Map<String, Object>> pros, @Param(value = "testid") String testid);

    public void addCers(@Param(value = "cers") List<Map<String, Object>> cers, @Param(value = "testid") String testid);

    public void addSels(@Param(value = "sels") List<Map<String, Object>> sels, @Param(value = "testid") String testid);

    public int getPoscomTestByMemberid(String memberid);

    public PosAndComTest getPosAndComTestById(String id);

    public void addCharacter(Map<String, Object> params);

    public void addCharacterDetail(@Param(value = "character") List<Map<String, Object>> character, @Param(value = "testid") String testid);

    public int getCharacter(String memberid);

    public List<Map<String, Object>> getCharacterMember(Map<String, String> params);

    public int getCharacterMemberCount(Map<String, String> params);

    public List<Map<String, Object>> getMemberCharacters(String memberid);

    void addSchoolBen(Map<String, Object> datas);

    void addSchoolShuo(Map<String, Object> datas);

    void addSkillBook(Map<String, Object> datas);

    void addlanguageBook(Map<String, Object> datas);

    void addHighBook(Map<String, Object> datas);

    void addNationBook(Map<String, Object> datas);

    void addPracticeUnit(Map<String, Object> datas);

    int finalScore(@Param("memberid") String memberid);

    void setfinalScore(@Param("memberid") String memberid, @Param("finalScore") int finalScore);

    int defeatCompetitionPeople(@Param("memberid") String memberid);

    SchoolMajorBen getGoodBad(@Param("memberid") String memberid);

    PositionCompetionTest getSuggest(String memberid);

    SelectGrade getSelectGrade(@Param(value = "testid") int testid);

    Integer getTestId(int id);

    void clearGrade(int id);

    void clearTopic(int testId);

    int finalScoreSub(String memberid);
}
