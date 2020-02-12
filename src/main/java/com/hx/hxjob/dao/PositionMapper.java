package com.hx.hxjob.dao;

import com.hx.hxjob.model.Organization;
import com.hx.hxjob.model.Position;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 17:47
 */
public interface PositionMapper {
    List<Position> getPositionPage(Map<String, String> params);

    Object getPositionPageCount(Map<String, String> params);

    void addPosition(Position position);

    Position getPositionById(String id);

    void editPosition(Position position);

    void deletePosition(String positionid);

    List<Position> getPositionList();

    List<String> getOrgOfList();

    void insertJobExcel(List<Position> list);

    List<Organization> getOrgList();

    String getLastPosCode();

}
