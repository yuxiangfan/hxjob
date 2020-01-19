package com.hx.hxjob.dao;

import com.hx.hxjob.model.Advice;
import com.hx.hxjob.model.ArticleCommand;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/19 15:18
 */
@Mapper
public interface AdviceMapper {

    List<Advice> getAdvicePage(Map<String, String> params);

    int getAdvicePageCount(Map<String, String> params);

    List<ArticleCommand> getAuthor();

    int addAdvice(Map<String, Object> advice);


    Advice getAdviceById(String id);

    int editAdvice(Map<String, Object> datas);

    int deleteAdvice(String id);
}
