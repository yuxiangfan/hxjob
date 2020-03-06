package com.hx.hxjob.dao;

import com.hx.hxjob.model.Organization;
import com.hx.hxjob.model.Position;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.dao
 * @description:
 * @created: 2020/01/16 17:47
 */
public interface PositionMapper {
    public List<Position> getPositionPage(Map<String, String> params);

    public int getPositionPageCount(Map<String, String> params);

    public void addPosition(Position position);

    public void editPosition(Position position);

    public Position getPositionById(String id);

    public void deletePosition(String positionid);

    public String getLastPosCode();

    public List<Position> getPcPositions(Map<String, Object> params);

    public String getHotPosKeyWords(String id);

    void insertJobExcel(@Param("list") List<Position> list);

    List<Position> getPositionList();

    List<Organization> getOrgList();

    List<String> getOrgOfList();


    List<String> getPositionByTitle(String sc);

    int getPcPositionCount(Map<String, Object> params);

    List<Position> getPcPositionsHot(Map<String, Object> params);

    int getPcPositionsCount(Map<String, Object> params);

    List<Position> posIndexDatas(Map<String, Object> params);

    public Position getPositionByCode(String code);

    public List<Map<String, Object>> getPcHotPos();

    public List<Position> getPositionByOrgCode(String orgcode);

    List<Position> getAllPosByOrg(String orgCode);
}
