package com.hx.hxjob.dao;


import com.hx.hxjob.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

}
