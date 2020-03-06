package com.hx.hxjob.service;

import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.dao.PositionMapper;
import com.hx.hxjob.model.City;
import com.hx.hxjob.model.Member;
import com.hx.hxjob.model.Position;
import com.hx.hxjob.model.SavePositionMember;
import com.hx.hxjob.system.CodeGenerator;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/16 15:15
 */
@Service
public class PositionService {
    @Resource
    private PositionMapper positionMapper;

    @Resource
    private MemberMapper memberMapper;

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

    public Map<String, Object> addNewPosition(Position position) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            position.setCode(CodeGenerator.getInstance().generatePosCode());
            result = this.checkPosition(position);
            if ((int) result.get("code") < 0) {
                return result;
            }
            this.positionMapper.addPosition(position);
            result.put("id", Des.encrypt(position.getId() + ""));
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    /**
     * @Description 校验插入机构数据
     * @Params [position]
     * @Return java.util.Map<java.lang.String, java.lang.Object>
     * @Date 2020/1/16 19:02
     **/
    public Map<String, Object> checkPosition(Position position) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty(position.getTitle())) {
            result.put("code", -1);
            result.put("msg", "标题未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getOrgcode())) {
            result.put("code", -1);
            result.put("msg", "机构未选");
            return result;
        }
        if (StringUtils.isEmpty(position.getType())) {
            result.put("code", -1);
            result.put("msg", "类型未选");
            return result;
        }
        if (StringUtils.isEmpty(position.getAddress())) {
            result.put("code", -1);
            result.put("msg", "工作地点未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getDepartment())) {
            result.put("code", -1);
            result.put("msg", "工作部门未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getDuty())) {
            result.put("code", -1);
            result.put("msg", "岗位职责未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getRequirement())) {
            result.put("code", -1);
            result.put("msg", "岗位要求未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getContact())) {
            result.put("code", -1);
            result.put("msg", "联系方式未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getShelftime())) {
            result.put("code", -1);
            result.put("msg", "下架时间未填");
            return result;
        }
        if (StringUtils.isEmpty(position.getRindex())) {
            position.setRindex("5");
        } else if (!Constant.patternNumber.matcher(position.getRindex()).matches()) {
            result.put("code", -1);
            result.put("msg", "指数格式有误");
            return result;
        } else if (Double.valueOf(position.getRindex()) < 0 || Double.valueOf(position.getRindex()) > 5) {
            result.put("code", -1);
            result.put("msg", "推荐指数数值应在0-5");
            return result;
        }
        if (StringUtils.isEmpty(position.getPublishtime())) {
            position.setPublishtime(Constant.sdf_normal.format(new Date()));
        }
        result.put("code", 0);
        result.put("msg", "OK");
        return result;
    }

    public Position getPositionById(String decEntryId) {
        String id = "";
        try {
            id = Des.decrypt(decEntryId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return this.positionMapper.getPositionById(id);
    }

    public Map<String, Object> editPosition(Position position) {
        Map<String, Object> result = new HashMap<String, Object>();

        try {
            String decEntryId = position.getDecEntryId();
            if (StringUtils.isEmpty(decEntryId)) {
                result.put("code", -1);
                result.put("msg", "参数缺失");
                return result;
            }
            position.setId(Integer.valueOf(Des.decrypt(position.getDecEntryId())));
            result = this.checkPosition(position);
            if ((int) result.get("code") < 0) {
                return result;
            }
            this.positionMapper.editPosition(position);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> deletePosition(String positionid) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            positionid = Des.decrypt(positionid);
            this.positionMapper.deletePosition(positionid);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    /*职业报表导入*/
    public List<Position> readJobExcel(InputStream inp) {
        List<Position> inPositionList = new ArrayList<>();
        String cellStr = null;
        Workbook wb = null;
        try {
            wb = WorkbookFactory.create(inp);
            Sheet sheet = wb.getSheetAt(0);
            System.out.println("头部:" + sheet.getLastRowNum());
            //开始读取数据
            for (int i = 0; i < sheet.getLastRowNum(); i++) {
                System.out.println("i:" + i);
                Position inJob = new Position();
                Position addinJob = new Position();
                //获得行数据
                Row row = sheet.getRow(i + 1);
                System.out.println(row);
                if (row == null) {
                    //row为空，不处理
                    continue;
                }
                for (int j = 0; j < row.getLastCellNum(); j++) {
                    //获得单元格(cell)对象
                    Cell cell = row.getCell(j);
                    //转换接受单元格的数据
                    cellStr = ConvertCellStr(cell, cellStr);
                    //将单元格的数据添加至一个对象
                    addinJob = addingUser(j, inJob, cellStr);
                    System.out.println(addinJob);
                }
                inPositionList.add(addinJob);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (inp != null) {
                try {
                    inp.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return inPositionList;
    }

    /*
     * 获得单元格的数据添加至computer
     * */
    private Position addingUser(int j, Position job, String cellStr) {
        switch (j) {
            /*岗位编号*/
            case 0:
                job.setCode(cellStr);
                break;
            /*招聘类型*/
            case 1:
                job.setType(cellStr);
                break;
            /*城市*/
            case 2:
                List<City> cities = this.memberMapper.getCityOfJob();
                for (City city : cities) {
                    if (cellStr.equals(city.getName())) {
                        job.setAddress(String.valueOf(city.getId()));
                        break;
                    } else {
                        job.setAddress(null);
                    }
                }
                break;
            /*机构代码*/
            case 3:
                job.setOrgcode(cellStr);
                break;
            /*部门*/
            case 4:
                job.setDepartment(cellStr);
                break;
            /*岗位*/
            case 5:
                job.setTitle(cellStr);
                break;
            /*岗位简介*/
            case 6:
                job.setPosBrief(cellStr);
                break;
            /*岗位职责*/
            case 7:
                job.setDuty(cellStr);
                break;
            /*任职要求*/
            case 8:
                job.setRequirement(cellStr);
                break;
            /*详细地点*/
            case 9:
                job.setWorkplace(cellStr);
                break;
            /*福利报酬*/
            case 10:
                job.setJobSalary(cellStr);
                break;
            /*联系方式*/
            case 11:
                job.setContact(cellStr);
                break;
            /*备注*/
            case 12:
                job.setRemark(cellStr);
                break;
            /*发布时间*/
            case 13:
                job.setPublishtime(cellStr);
                break;
            /*截止时间*/
            case 14:
                job.setShelftime(cellStr);
                break;
            /*是否标新*/
            case 15:
                job.setIsstar(cellStr);
                break;
        }
        return job;
    }

    /**
     * 把单元格内的类型转换至String类型
     */
    private String ConvertCellStr(Cell cell, String cellStr) throws ParseException {

        switch (cell.getCellType()) {

            case Cell.CELL_TYPE_STRING:
                // 读取String
                cellStr = cell.getStringCellValue().toString();
                break;

            case Cell.CELL_TYPE_BOOLEAN:
                // 得到Boolean对象的方法
                cellStr = String.valueOf(cell.getBooleanCellValue());
                break;

            case Cell.CELL_TYPE_NUMERIC:
                // 先看是否是日期格式
                if (DateUtil.isCellDateFormatted(cell)) {
                    // 读取日期格式
                    String cellSt = cell.getDateCellValue().toString();
                    Date data = new Date(cellSt);
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
                    String format = simpleDateFormat.format(data);
                    cellStr = format;
                } else {
                    // 读取数字
                    cellStr = String.valueOf(cell.getNumericCellValue());
                }
                break;

            case Cell.CELL_TYPE_FORMULA:
                // 读取公式
                cellStr = cell.getCellFormula().toString();
                break;
        }
        return cellStr;
    }


    public Map<String, Object> insertJobExcel(MultipartFile file, List<Position> list) throws ArrayStoreException {
        Map<String, Object> result = new HashMap<>();
        try {
            List<Position> positions = this.positionMapper.getPositionList();
            List<String> codeList = this.positionMapper.getOrgOfList();
            /*校验有无重复的岗位code*/
            for (Position position : positions) {
                for (Position position1 : list) {
                    if (position1.getCode().equals(position.getCode())) {
                        result.put("code", -1);
                        result.put("msg", "岗位编号重复，重复为:" + position1.getCode());
                        return result;
                    }
                    if (StringUtils.isEmpty(position1.getCode())) {
                        result.put("code", -1);
                        result.put("msg", "报表中有漏空的岗位编号");
                    }
                }
            }
            /*判断机构编号*/
            for (Position position1 : list) {
                if (!codeList.contains(position1.getOrgcode()) || StringUtils.isEmpty(position1.getOrgcode())) {
                    result.put("code", -1);
                    result.put("msg", "报表中有不存在的机构编号或者可能有漏空的机构编号,请核实后再录入,建议对应好职业和机构的联系");
                    return result;
                }
            }

            if (file == null) {
                result.put("code", -1);
                result.put("msg", "您当前未选择任何文件");
                return result;
            } else {
                String fileName = file.getOriginalFilename();
                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (!",XLSX,XLSM,XLSB,XLTX,XLTM,XLS,XLT,XLA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "excel请上传以下格式(xlsx,xlsm,xlsb,xltx,xltm,xls,xlt,xla)文件");
                    return result;
                }
            }
            positionMapper.insertJobExcel(list);
            result.put("code", 0);
            result.put("msg", "报表批量插入成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public List<String> getPositionByTitle(String sc) {
        List<String> positionList = positionMapper.getPositionByTitle(sc);
        return positionList;
    }

    public Map<String, Object> getPoss(Map<String, Object> params, Member member) {
        Map<String, Object> result = new HashMap<>();
        String searchContentId = (String) params.get("searchContentId");
        String[] hotPosKeyWordsArr = null;
        if (StringUtils.isNotEmpty(searchContentId)) {
            String hotPosKeyWords = this.positionMapper.getHotPosKeyWords(searchContentId);
            if (StringUtils.isNotEmpty(hotPosKeyWords)) {
                hotPosKeyWords = hotPosKeyWords.trim().replaceAll("\\s+", ",");
                hotPosKeyWords = hotPosKeyWords.trim().replaceAll("\\，+", ",");
                hotPosKeyWordsArr = hotPosKeyWords.split(",");
            }
        }
        params.put("hotPosKeyWordsArr", hotPosKeyWordsArr);
        /*查询全部部门数据*/
        List<Position> poss = this.positionMapper.getPcPositions(params);
        /*查询数据总和*/
        int possCount = this.positionMapper.getPcPositionCount(params);
        if (member != null) {
            member = this.memberMapper.getMemberJobByUsername(member.getUsername());
        }
        for (Position position : poss) {
            boolean collectJob = true;
            if (member == null) {
                position.setCollectJob(true);
            } else {
                if (CollectionUtils.isEmpty(member.getSavePositionMembers())) {
                    position.setCollectJob(true);
                } else {
                    for (SavePositionMember savePositionMember : member.getSavePositionMembers()) {
                        if (savePositionMember.getPositionCode().equals(position.getCode())) {
                            collectJob = false;
                            break;
                        }
                    }
                    position.setCollectJob(collectJob);
                }
            }
        }
        result.put("poss", poss);
        result.put("count", possCount);
        return result;
    }

    public Map<String, Object> getPossHot(Map<String, Object> params, Member member) {
        Map<String, Object> result = new HashMap<>();
        String searchContentId = (String) params.get("searchContentId");
        String[] hotPosKeyWordsArr = null;
        if (StringUtils.isNotEmpty(searchContentId)) {
            String hotPosKeyWords = this.positionMapper.getHotPosKeyWords(searchContentId);
            if (StringUtils.isNotEmpty(hotPosKeyWords)) {
                hotPosKeyWords = hotPosKeyWords.trim().replaceAll("\\s+", ",");
                hotPosKeyWords = hotPosKeyWords.trim().replaceAll("\\，+", ",");
                hotPosKeyWordsArr = hotPosKeyWords.split(",");
            }
        }
        params.put("hotPosKeyWordsArr", hotPosKeyWordsArr);
        /*查询全部部门数据*/
        List<Position> poss = this.positionMapper.getPcPositionsHot(params);
        /*查询总数*/
        int possCount = this.positionMapper.getPcPositionsCount(params);
        if (member != null) {
            member = this.memberMapper.getMemberJobByUsername(member.getUsername());
        }
        for (Position position : poss) {
            boolean collectJob = true;
            if (member == null) {
                position.setCollectJob(true);
            } else {
                if (CollectionUtils.isEmpty(member.getSavePositionMembers())) {
                    position.setCollectJob(true);
                } else {
                    for (SavePositionMember savePositionMember : member.getSavePositionMembers()) {
                        if (savePositionMember.getPositionCode().equals(position.getCode())) {
                            collectJob = false;
                            break;
                        }
                    }
                    position.setCollectJob(collectJob);
                }
            }
        }
        result.put("possHot", poss);
        result.put("countHot", possCount);
        return result;
    }

    public List<Position> posIndexDatas(Map<String, Object> params, Member member) {
        /*查询全部部门数据*/
        List<Position> poss = this.positionMapper.posIndexDatas(params);
        if (member != null) {
            member = this.memberMapper.getMemberJobByUsername(member.getUsername());
        }
        for (Position position : poss) {
            boolean collectJob = true;
            if (member == null) {
                position.setCollectJob(true);
            } else {
                if (CollectionUtils.isEmpty(member.getSavePositionMembers())) {
                    position.setCollectJob(true);
                } else {
                    for (SavePositionMember savePositionMember : member.getSavePositionMembers()) {
                        if (savePositionMember.getPositionCode().equals(position.getCode())) {
                            collectJob = false;
                            break;
                        }
                    }
                    position.setCollectJob(collectJob);
                }
            }
        }
        return poss;
    }

    public Position getPosByCode(String code) {
        Position pos = this.positionMapper.getPositionByCode(code);
        return pos;
    }

    public Map<String, Object> getPcHotPosition() {
        Map<String, Object> result = new HashMap<String, Object>();

        result.put("rows", this.positionMapper.getPcHotPos());

        return result;
    }

    public Map<String, Object> getOrgPosiitons(String orgcode) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("rows", this.positionMapper.getPositionByOrgCode(orgcode));
        return result;
    }

    public List<Position> getAllPosByOrg(String orgCode) {
        List<Position> allPos =  this.positionMapper.getAllPosByOrg(orgCode);
        return allPos;
    }
}
