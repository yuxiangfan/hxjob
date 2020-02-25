package com.hx.hxjob.dao;

import com.hx.hxjob.model.Download;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @Program: com.hx.hxjob.dao
 * @Description:
 * @Created: 2020/02/12 19:51
 */
@Mapper
public interface DownloadMapper {
    void addDown(Map<String, String> params);

    List<Download> downList(Map<String, String> params);

    int downListCount(Map<String, String> params);

    Download editDown(String id);

    void submitEditDown(Map<String, String> params);

    void deleteDown(String id);
}
