package com.hx.hxjob.dao;


import com.hx.hxjob.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Mapper
public interface SelectorMapper {


    public List<ArticleCurriculum> getArticleCurriculumPage(Map<String, String> params);

    List<ArticleCommand> getArticleCommandPage(Map<String, String> params);

    public int getArticleCurriculumPageCount(Map<String, String> params);

    public int getArticleCommandPageCount(Map<String, String> params);

    public void addAc(Map<String, Object> asDatas);

    public void addACO(Map<String, Object> acoDatas);

    public ArticleCurriculum getArticleCurriculumById(String id);

    public void editAc(Map<String, Object> asDatas);

    public void deleteAc(String id);

    void addACO(ArticleCommand articleCommand);

    ArticleCommand getCommandById(String cid);

    void editACO(ArticleCommand articleCommand);

    void deleteCommand(String cid);

    List<Advice> indexNewAdvices(Map<String, String> params);

    public List<Advice> getArticleCurriculumPageForPC(Map<String, String> params);

    public int getArticleCurriculumPageCountForPC(Map<String, String> params);

    Advice toAdviceDetails(int id);

    ArticleCommand getArticleCommand(int cid);

    int getCommandNumber(int cid);

    List<ArticleCommand> gethotCommandList();

    List<ArticleCommand> getCommandNumberOfHot();

    List<ArticleCommand> getGoodsList(int id);

    Member getMemberByUsername(String username);

    ArticleCommandAttention getArticleCommandByMemberId(@Param("id") String id, @Param("memberid") String memberid);

    int deleteArticleCommandByMemberId(@Param("id") String id, @Param("memberid") String memberid);

    int addArticleCommandByMemberId(@Param("id") String id, @Param("memberid") String memberid);

    public int getMemberACCollect(@Param(value = "acid") String acid, @Param(value = "memberid") String memberid);

    public int acCollect(@Param(value = "acid") String acid, @Param(value = "memberid") String memberid);
}
