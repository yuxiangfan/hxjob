package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.dao.OrganizationMapper;
import com.hx.hxjob.dao.PositionMapper;
import com.hx.hxjob.enums.StatusEnum;
import com.hx.hxjob.model.*;
import com.hx.hxjob.system.CodeGenerator;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/16 15:15
 */
@Service
public class OrganizationService {
    @Resource
    private OrganizationMapper organizationMapper;

    @Resource
    private PositionMapper positionMapper;

    @Resource
    private SystemConfig systemConfig;

    @Resource
    private MemberMapper memberMapper;

    public List<Organization> getOrganizations() {
        List<Organization> organizations = this.organizationMapper.getOrganizations();
        return organizations;
    }

    public List<City> getCities() {
        List<City> cities = this.organizationMapper.getCities();
        return cities;
    }

    public List<Industry> getIndustries() {
        List<Industry> industries = this.organizationMapper.getIndustries();
        return industries;
    }

    public Map<String, Object> getOrgPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        result.put("rows", this.organizationMapper.getOrganizationsPage(params));
        result.put("total", this.organizationMapper.getOrganizationsPageCount(params));
        return result;
    }

    public Map<String, Object> addNewOrg(Map<String, Object> params, MultipartFile logo, SystemUser user, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("code", CodeGenerator.getInstance().generateOrgCode());
            datas.put("creater", user.getId());
            result = this.checkOrgParam(datas, logo);
            if (0 != (int) result.get("code")) {
                return result;
            }
            //检查组织机构的全称及简称是否重复
            Organization queryOrganization = this.organizationMapper.getOrganizationByFullNameAndShortName((String) datas.get("fullname"), null);
            if (queryOrganization != null) {
                result.put("code", -1);
                result.put("msg", "机构全称已经被使用");
                return result;
            }
            queryOrganization = this.organizationMapper.getOrganizationByFullNameAndShortName(null, (String) datas.get("shortname"));
            if (queryOrganization != null) {
                result.put("code", -1);
                result.put("msg", "机构简称已经被使用");
                return result;
            }
            if (logo != null) {
                //上传logo
                String fileName = logo.getOriginalFilename();
                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);

                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "logo请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }

                String relativePath = "/OrgLogo/" + Constant.sdf_yyyymmdd.format(new Date());

                String fileNewName = System.currentTimeMillis() + "." + fileType;

                String realPath = request.getServletContext().getRealPath("/upload");

                String savePath = realPath + relativePath;

                File fileSavePath = new File(savePath);

                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }

                fileIs = logo.getInputStream();

                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));

                byte[] b = new byte[1024];

                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }

                datas.put("logo", "/upload" + relativePath + "/" + fileNewName);
            }

            //插入新的机构数据
            this.organizationMapper.addNewOrg(datas);

            result.put("code", 0);
            result.put("msg", "操作成功");

        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        } finally {
            if (fileIs != null) {
                try {
                    fileIs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOs != null) {
                try {
                    fileOs.flush();
                    fileOs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    private Map<String, Object> checkOrgParam(Map<String, Object> datas, MultipartFile logo) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty((String) datas.get("fullname"))) {
            result.put("code", -1);
            result.put("msg", "机构全称未填");
        } else if (StringUtils.isEmpty((String) datas.get("shortname"))) {
            result.put("code", -1);
            result.put("msg", "机构简称未填");
        } else if (StringUtils.isEmpty((String) datas.get("logo")) && logo == null) {
            result.put("code", -1);
            result.put("msg", "机构logo未上传");
        } else {
            if (StringUtils.isEmpty((String) datas.get("grade"))) {
                datas.put("grade", "5");
            }
            if (StringUtils.isEmpty((String) datas.get("score"))) {
                datas.put("score", "5");
            }
            if (StringUtils.isEmpty((String) datas.get("salary"))) {
                datas.put("salary", "0");
            }
            if (StringUtils.isEmpty((String) datas.get("sort"))) {
                datas.put("sort", "10");
            }
            if (StringUtils.isEmpty((String) datas.get("publishtime"))) {
                datas.put("publishtime", Constant.sdf_normal.format(new Date()));
            }
            if (StringUtils.isEmpty((String) datas.get("shelftime"))) {
                datas.put("shelftime", null);
            }
            result.put("code", 0);
            result.put("msg", "OK");
        }
        return result;
    }

    public Organization getOrganization(String code) {
        Organization organization = this.organizationMapper.getOrganizationByCode(code);
        List<OrganizationRemark> organizationRemarkList = this.memberMapper.getOrganizationGrade(code);
        if (organizationRemarkList.size() != 0) {
            Double treatment = organizationRemarkList.stream().mapToLong(OrganizationRemark::getTreatment).average().getAsDouble();
            Double growth = organizationRemarkList.stream().mapToLong(OrganizationRemark::getGrowth).average().getAsDouble();
            Double workLoad = organizationRemarkList.stream().mapToLong(OrganizationRemark::getWorkload).average().getAsDouble();
            Double culturalContext = organizationRemarkList.stream().mapToLong(OrganizationRemark::getCulturalContext).average().getAsDouble();
            Double satisfaction = organizationRemarkList.stream().mapToLong(OrganizationRemark::getSatisfaction).average().getAsDouble();
            int e = treatment.intValue();
            int a = growth.intValue();
            int b = workLoad.intValue();
            int c = culturalContext.intValue();
            int d = satisfaction.intValue();
            organization.setGrowth(a);
            organization.setWorkload(b);
            organization.setCulturalContext(c);
            organization.setSatisfaction(d);
            organization.setTreatment(e);
        }
        return organization;
    }

    public Map<String, Object> editOrg(Map<String, Object> params, MultipartFile logo, SystemUser user, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("updater", user.getId());
            result = this.checkOrgParam(datas, logo);
            if (0 != (int) result.get("code")) {
                return result;
            }
            //检查组织机构的全称及简称是否重复
            Organization queryOrganization = this.organizationMapper.getOrganizationByFullNameAndShortName((String) datas.get("fullname"), null);
            if (queryOrganization != null && !queryOrganization.getCode().equals(datas.get("code"))) {
                result.put("code", -1);
                result.put("msg", "机构全称已经被使用");
                return result;
            }
            queryOrganization = this.organizationMapper.getOrganizationByFullNameAndShortName(null, (String) datas.get("shortname"));
            if (queryOrganization != null && !queryOrganization.getCode().equals(datas.get("code"))) {
                result.put("code", -1);
                result.put("msg", "机构简称已经被使用");
                return result;
            }
            if (logo != null) {
                //上传logo
                String fileName = logo.getOriginalFilename();
                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "logo请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "/OrgLogo/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String realPath = request.getServletContext().getRealPath("/upload");
                String savePath = realPath + relativePath;
                File fileSavePath = new File(savePath);
                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = logo.getInputStream();
                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));
                byte[] b = new byte[1024];
                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                datas.put("logo", "/upload" + relativePath + "/" + fileNewName);
            }
            //插入新的机构数据
            this.organizationMapper.editOrg(datas);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        } finally {
            if (fileIs != null) {
                try {
                    fileIs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOs != null) {
                try {
                    fileOs.flush();
                    fileOs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public Map<String, Object> deleteOrg(String code) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            //删除机构
            this.organizationMapper.deleteOrg(code);
            //删除机构下属的招聘
            this.organizationMapper.deleteOrgPosition(code);
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

    public Map<String, Object> getCommentPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        PageUtil.dealPageParamForLayer(params);
        result.put("rows", this.organizationMapper.getCommentPage(params));
        result.put("total", this.organizationMapper.getCommentPageCount(params));
        return result;
    }

    public Map<String, Object> addNewComment(Map<String, Object> params, MultipartFile imgUpload) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            Member member = this.memberMapper.getMember((String) datas.get("username"));
            /*判断新增用户是否存在*/
            if (StringUtils.isEmpty((String) datas.get("username"))) {
                result.put("code", -1);
                result.put("msg", "请输入用户名");
                return result;
            } else if (member == null) {
                result.put("code", -1);
                result.put("msg", "用户名不存在");
                return result;
            } else {
                if (!datas.get("username").equals(member.getUsername())) {
                    result.put("code", -1);
                    result.put("msg", "用户名输入不匹配");
                    return result;
                } else {
                    datas.put("memberid", member.getId());
                }
            }
            if (imgUpload != null) {
                String filename = imgUpload.getOriginalFilename();
                String fileType = filename.substring(filename.lastIndexOf(".") + 1);
                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "logo请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "com/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String savePath = this.systemConfig.getSaveFilePath() + this.systemConfig.getUploadFile() + relativePath;
                File fileSavePath = new File(savePath);
                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = imgUpload.getInputStream();
                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));
                byte[] b = new byte[1024];
                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                datas.put("imgUpload", relativePath + "/" + fileNewName);
            }
            //插入新的机构数据
            this.organizationMapper.addNewComment(datas);
            result.put("code", 0);
            result.put("msg", "操作成功");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        } finally {
            if (fileIs != null) {
                try {
                    fileIs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOs != null) {
                try {
                    fileOs.flush();
                    fileOs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public OrganizationRemark toEditCommentById(String id) {
        OrganizationRemark editCommentById = organizationMapper.toEditCommentById(id);
        return editCommentById;
    }

    @Transactional
    public Map<String, Object> editComment(Map<String, Object> params, MultipartFile imgUpload) {
        Map<String, Object> result = new HashMap<>();
        InputStream fileIs = null;
        OutputStream fileOs = null;

        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));

            if (StringUtils.isEmpty((String) datas.get("undefined"))) {
                datas.put("undefined", "5");
            }

            if (imgUpload != null) {
                String filename = imgUpload.getOriginalFilename();
                String fileType = filename.substring(filename.lastIndexOf(".") + 1);

                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "logo请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "com/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String savePath = this.systemConfig.getSaveFilePath() + this.systemConfig.getUploadFile() + relativePath;
                File fileSavePath = new File(savePath);

                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = imgUpload.getInputStream();

                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));

                byte[] b = new byte[1024];

                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                datas.put("imgUpload", relativePath + "/" + fileNewName);
            }
            //插入新的机构数据
            this.organizationMapper.editComment(datas);
            result.put("code", 0);
            result.put("msg", "操作成功");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        } finally {
            if (fileIs != null) {
                try {
                    fileIs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOs != null) {
                try {
                    fileOs.flush();
                    fileOs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public Map<String, Object> deleteComment(String id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            /*删除点评*/
            this.organizationMapper.deleteComment(id);
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

    public List<Organization> readOrgExcel(InputStream inp) {
        List<Organization> inOrgList = new ArrayList<>();
        String cellStr = null;
        Workbook wb = null;

        try {
            wb = WorkbookFactory.create(inp);
            Sheet sheet = wb.getSheetAt(0);
            System.out.println("头部:" + sheet.getLastRowNum());
            //开始读取数据
            for (int i = 0; i < sheet.getLastRowNum(); i++) {
                System.out.println("i:" + i);
                Organization inJob = new Organization();
                Organization addinJob = new Organization();
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
                inOrgList.add(addinJob);
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
        return inOrgList;
    }

    /* 获得单元格的数据添加至computer*/
    private Organization addingUser(int j, Organization org, String cellStr) {
        switch (j) {
            /*岗位编号*/
            case 0:
                org.setCode(cellStr);
                break;
            /*全称*/
            case 1:
                org.setFullname(cellStr);
                break;
            /*简称*/
            case 2:
                org.setShortname(cellStr);
                /* logo*/
            case 3:
                org.setLogo(null);
                break;
            case 4:
                List<Industry> industries = this.memberMapper.getIndustriesOfJob();
                for (Industry industry : industries) {
                    if (cellStr.equals(industry.getName())) {
                        org.setIndustry(String.valueOf(industry.getId()));
                        break;
                    } else {
                        org.setIndustry(null);
                    }
                }
                break;
            case 5:
                List<City> cities = this.memberMapper.getCityOfJob();
                for (City city : cities) {
                    if (cellStr.equals(city.getName())) {
                        org.setCity(String.valueOf(city.getId()));
                        break;
                    } else {
                        org.setCity(null);
                    }
                }
                break;
            case 6:
                org.setTags(cellStr);
                break;
            /*简介*/
            case 7:
                org.setBrief(cellStr);
                break;
            /*描述*/
            case 8:
                org.setDescription(cellStr);
                break;
            /*评分*/
            case 9:
                org.setScore(cellStr);
                break;
            case 10:
                double v = Double.valueOf(cellStr);
                org.setTreatment((int) v);
                /*发布时间*/
            case 11:
                org.setPublishtime(cellStr);
                break;
            /*下架时间*/
            case 12:
                org.setShelftime(cellStr);
                break;
        }
        return org;
    }

    /*把单元格内的类型转换至String类型*/
    private String ConvertCellStr(Cell cell, String cellStr) {

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

    public Map<String, Object> insertOrgExcel(List<Organization> list, MultipartFile file) {
        Map<String, Object> result = new HashMap<>();

        List<Organization> organizations = this.positionMapper.getOrgList();
        try {
            for (Organization organization : organizations) {
                for (Organization organization1 : list) {
                    if (organization1.getCode().equals(organization.getCode()) || StringUtils.isEmpty(organization1.getCode())) {
                        result.put("code", -1);
                        result.put("msg", "报表中有重复的机构编号或者可能有漏空的机构编号,请核实后再录入");
                        return result;
                    }
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
            organizationMapper.insertOrgExcel(list);
            result.put("code", 0);
            result.put("msg", "报表批量插入成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> getCityPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        result.put("rows", this.organizationMapper.getCitiesPage(params));
        result.put("total", this.organizationMapper.getCitiesPageCount(params));
        return result;
    }

    public Map<String, Object> addCity(City city) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String name = city.getName();
            String sort = String.valueOf(city.getSort());

            if (StringUtils.isEmpty(name)) {
                result.put("code", -1);
                result.put("msg", "地区名未填");
                return result;
            }
            City queryCity = this.organizationMapper.getCityByName(name);
            if (queryCity != null) {
                result.put("code", -1);
                result.put("msg", "该地区已经存在");
                return result;
            }
            if (StringUtils.isEmpty(sort)) {
                city.setSort(10);
            } else {
                if (!Constant.patternSort.matcher(sort).matches()) {
                    result.put("code", -1);
                    result.put("msg", "排序号格式有误");
                    return result;
                }
            }
            city.setStatus(StatusEnum.ENABLE.name());
            this.organizationMapper.addCity(city);
            result.put("code", 0);
            result.put("msg", "新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public City getCityById(String cid) {
        return this.organizationMapper.getCityById(cid);
    }

    public Map<String, Object> editCity(City city) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String name = city.getName();
            String sort = String.valueOf(city.getSort());
            if (StringUtils.isEmpty(name)) {
                result.put("code", -1);
                result.put("msg", "地区名未填");
                return result;
            }
            City queryCity = this.organizationMapper.getCityByName(name);
            if (queryCity != null && queryCity.getId() != city.getId()) {
                result.put("code", -1);
                result.put("msg", "该地区已经存在");
                return result;
            }
            if (StringUtils.isEmpty(sort)) {
                city.setSort(10);
            } else {
                if (!Constant.patternSort.matcher(sort).matches()) {
                    result.put("code", -1);
                    result.put("msg", "排序号格式有误");
                    return result;
                }
            }
            city.setStatus(StatusEnum.ENABLE.name());
            this.organizationMapper.editCity(city);
            result.put("code", 0);
            result.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> deleteCity(String cid) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            this.organizationMapper.deleteCity(cid);
            result.put("code", 0);
            result.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> getIndustryPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        result.put("rows", this.organizationMapper.getIndustriesPage(params));
        result.put("total", this.organizationMapper.getIndustriesPageCount(params));
        return result;
    }

    public Map<String, Object> addIndustry(Industry industry) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String name = industry.getName();
            String sort = String.valueOf(industry.getSort());
            if (StringUtils.isEmpty(name)) {
                result.put("code", -1);
                result.put("msg", "行业名未填");
                return result;
            }
            Industry queryIndustry = this.organizationMapper.getIndustryByName(name);
            if (queryIndustry != null) {
                result.put("code", -1);
                result.put("msg", "该行业已经存在");
                return result;
            }
            if (StringUtils.isEmpty(sort)) {
                industry.setSort(10);
            } else {
                if (!Constant.patternSort.matcher(sort).matches()) {
                    result.put("code", -1);
                    result.put("msg", "排序号格式有误");
                    return result;
                }
            }
            industry.setStatus(StatusEnum.ENABLE.name());
            this.organizationMapper.addIndustry(industry);
            result.put("code", 0);
            result.put("msg", "新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Industry getIndustryById(String cid) {
        return this.organizationMapper.getIndustryById(cid);
    }

    public Map<String, Object> editIndustry(Industry industry) {

        Map<String, Object> result = new HashMap<String, Object>();

        try {
            String name = industry.getName();
            String sort = String.valueOf(industry.getSort());

            if (StringUtils.isEmpty(name)) {
                result.put("code", -1);
                result.put("msg", "地区名未填");
                return result;
            }
            Industry queryIndustry = this.organizationMapper.getIndustryByName(name);
            if (queryIndustry != null && queryIndustry.getId() != industry.getId()) {
                result.put("code", -1);
                result.put("msg", "该地区已经存在");
                return result;
            }

            if (StringUtils.isEmpty(sort)) {
                industry.setSort(10);
            } else {
                if (!Constant.patternSort.matcher(sort).matches()) {
                    result.put("code", -1);
                    result.put("msg", "排序号格式有误");
                    return result;
                }
            }
            industry.setStatus(StatusEnum.ENABLE.name());

            this.organizationMapper.editIndustry(industry);

            result.put("code", 0);
            result.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }

        return result;
    }

    public Map<String, Object> deleteIndustry(String cid) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            this.organizationMapper.deleteIndustry(cid);
            result.put("code", 0);
            result.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }
}
