package com.hx.hxjob.service;

import com.hx.hxjob.dao.PositionMapper;
import com.hx.hxjob.model.Position;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.PageUtil;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/16 15:15
 */
@Service
public class PositionService {
    @Resource
    private PositionMapper positionMapper;
    public Map<String, Object> getPositionPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        /*获得请求的参数,处理分页的效果（1-15）*/
        PageUtil.dealPageParamForLayer(params);
        List<Position> positions = this.positionMapper.getPositionPage(params);
        for (Position position : positions) {
            try {
                position.setDecEntryId(Des.encrypt(position.getId() + ""));
                position.setId(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        result.put("rows", positions);
        result.put("total", this.positionMapper.getPositionPageCount(params));

        return result;
    }
}
