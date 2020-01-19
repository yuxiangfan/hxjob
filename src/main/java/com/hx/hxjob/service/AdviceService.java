package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.dao.AdviceMapper;
import com.hx.hxjob.model.Advice;
import com.hx.hxjob.model.ArticleCommand;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/19 15:14
 */
@Service
public class AdviceService {

    @Autowired
    private AdviceMapper adviceMapper;

    public Map<String, Object> getAdvicePage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        result.put("rows", this.adviceMapper.getAdvicePage(params));
        result.put("total", this.adviceMapper.getAdvicePageCount(params));
        return result;
    }

    public List<ArticleCommand> getAuthor() {
        List<ArticleCommand> author = this.adviceMapper.getAuthor();
        return author;
    }

    @Transactional
    public Map<String, Object> adding(Map<String, Object> params, MultipartFile image, SystemUser user, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("creater", user.getId());
            result = this.checkNewsParams(datas, image);
            if (0 != (int) result.get("code")) {
                return result;
            }
            if (image != null) {
                //上传封面图
                String fileName = image.getOriginalFilename();
                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "封面图请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "/newLogo/" + Constant.sdf_yyyymmdd.format(new Date());

                String fileNewName = System.currentTimeMillis() + "." + fileType;

                String realPath = request.getServletContext().getRealPath("/upload");

                String savePath = realPath + relativePath;

                File fileSavePath = new File(savePath);

                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = image.getInputStream();
                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));
                byte[] b = new byte[1024];
                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                datas.put("image", "/upload" + relativePath + "/" + fileNewName);
            }
            this.adviceMapper.addAdvice(datas);
            result.put("code", 0);
            result.put("msg", "新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    private Map<String, Object> checkNewsParams(Map<String, Object> params, MultipartFile image) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty((String) params.get("title"))) {
            result.put("code", -1);
            result.put("msg", "标题未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("author"))) {
            result.put("code", -1);
            result.put("msg", "所属未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("brief"))) {
            result.put("code", -1);
            result.put("msg", "简介未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("content"))) {
            result.put("code", -1);
            result.put("msg", "文章内容未填");
            return result;
        }
        if ("1".equals(params.get("type"))) {
            if (StringUtils.isEmpty((String) params.get("url"))) {
                result.put("code", -1);
                result.put("msg", "外部链接未填");
                return result;
            }
        }

        if (StringUtils.isEmpty((String) params.get("publishtime"))) {
            params.put("publishtime", Constant.sdf_normal.format(new Date()));
        }
        if (StringUtils.isEmpty((String) params.get("shelftime"))) {
            params.put("shelftime", null);
        }

        result.put("code", 0);
        result.put("msg", "OK");
        return result;
    }

    public Advice getAdviceById(String id) {
        return this.adviceMapper.getAdviceById(id);
    }

    public Map<String, Object> editing(Map<String, Object> params, MultipartFile image, SystemUser user, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("updater", user.getId());
            result = this.checkNewsParams(datas, image);
            if (0 != (int) result.get("code")) {
                return result;
            }
            if (image != null) {
                //上传封面图
                String fileName = image.getOriginalFilename();
                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "封面图请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "/newLogo/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String realPath = request.getServletContext().getRealPath("/upload");
                String savePath = realPath + relativePath;
                File fileSavePath = new File(savePath);
                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = image.getInputStream();
                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));
                byte[] b = new byte[1024];
                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                datas.put("image", "/upload" + relativePath + "/" + fileNewName);
            }
            this.adviceMapper.editAdvice(datas);
            result.put("code", 0);
            result.put("msg", "编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> delete(String id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            this.adviceMapper.deleteAdvice(id);
            result.put("code", 0);
            result.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }
}
