package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.common.SystemConfig;
import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.dao.SelectorMapper;
import com.hx.hxjob.model.*;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/19 16:01
 */
@Service
public class SelectorService {
    @Autowired
    private SelectorMapper selectorMapper;
    @Autowired
    private SystemConfig systemConfig;


    public Map<String, Object> getACPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        List<ArticleCurriculum> acs = this.selectorMapper.getArticleCurriculumPage(params);
        for (ArticleCurriculum ac : acs) {
            try {
                ac.setDesEntryId(Des.encrypt(ac.getId() + ""));
                ac.setId(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        result.put("rows", acs);
        result.put("total", this.selectorMapper.getArticleCurriculumPageCount(params));
        return result;
    }

    public Map<String, Object> getACoPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        List<ArticleCommand> acs = this.selectorMapper.getArticleCommandPage(params);
        result.put("rows", acs);
        /*分页*/
        result.put("total", this.selectorMapper.getArticleCommandPageCount(params));
        return result;
    }

    public Map<String, Object> addAC(Map<String, Object> params, MultipartFile image, SystemUser user) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("creater", user.getId());
            result = this.checkACParams(datas, image);
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
                String relativePath = "ac/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String savePath = this.systemConfig.getSaveFilePath() + this.systemConfig.getUploadFile() + relativePath;
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
                datas.put("image", relativePath + "/" + fileNewName);
            }
            //插入新的机构数据
            this.selectorMapper.addAc(datas);
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

    private Map<String, Object> checkACParams(Map<String, Object> params, MultipartFile image) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty((String) params.get("title"))) {
            result.put("code", -1);
            result.put("msg", "标题未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("author"))) {
            result.put("code", -1);
            result.put("msg", "作者未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("image")) && image == null) {
            result.put("code", -1);
            result.put("msg", "封面图未上传");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("content"))) {
            result.put("code", -1);
            result.put("msg", "文章内容未填");
            return result;
        }
        if (StringUtils.isEmpty((String) params.get("publishtime"))) {
            params.put("publishtime", Constant.sdf_normal.format(new Date()));
        }
        if (StringUtils.isEmpty((String) params.get("shelftime"))) {
            params.put("shelftime", null);
        }
        if (StringUtils.isEmpty((String) params.get("sort"))) {
            params.put("sort", "10");
        }
        if ("1".equals(params.get("type"))) {
            params.put("difficulty", "");
            params.put("duration", "");
            params.put("chapters", "");
            params.put("needpay", "");
            params.put("amount", "0");
        }

        result.put("code", 0);
        result.put("msg", "OK");
        return result;
    }

    public Map<String, Object> addACO(ArticleCommand articleCommand) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String title = articleCommand.getTitle();
            if (StringUtils.isEmpty(title)) {
                result.put("code", -1);
                result.put("msg", "所属名未填");
                return result;
            }
            this.selectorMapper.addACO(articleCommand);
            result.put("code", 0);
            result.put("msg", "新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public Map<String, Object> editACO(ArticleCommand articleCommand) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String title = articleCommand.getTitle();
            if (StringUtils.isEmpty(title)) {
                result.put("code", -1);
                result.put("msg", "所属名未填");
                return result;
            }
            this.selectorMapper.editACO(articleCommand);
            result.put("code", 0);
            result.put("msg", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public ArticleCommand getCommandById(String cid) {
        return this.selectorMapper.getCommandById(cid);
    }

    public ArticleCurriculum getArticleCurriculumById(String id) {
        try {
            id = Des.decrypt(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ArticleCurriculum articleCurriculum = this.selectorMapper.getArticleCurriculumById(id);
        try {
            articleCurriculum.setDesEntryId(Des.encrypt(articleCurriculum.getId() + ""));
            articleCurriculum.setId(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return articleCurriculum;
    }

    @Transactional
    public Map<String, Object> editAC(Map<String, Object> params, MultipartFile image, SystemUser user) {
        Map<String, Object> result = new HashMap<String, Object>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject((String) params.get("datas"));
            datas.put("id", Des.decrypt((String) datas.get("decEntryId")));
            datas.put("creater", user.getId());
            result = this.checkACParams(datas, image);
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
                String relativePath = "ac/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                String savePath = this.systemConfig.getSaveFilePath() + this.systemConfig.getUploadFile() + relativePath;
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
                datas.put("image", relativePath + "/" + fileNewName);
            }
            //插入新的机构数据
            this.selectorMapper.editAc(datas);
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

    public Map<String, Object> deleteAC(String id) {
        Map<String, Object> result = new HashMap<String, Object>();

        try {
            id = Des.decrypt(id);
            this.selectorMapper.deleteAc(id);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }

        return result;
    }

    public Map<String, Object> deleteCommand(String cid) {
        Map<String, Object> result = new HashMap<>();
        try {
            this.selectorMapper.deleteCommand(cid);
            result.put("code", 0);
            result.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public List<Advice> indexNewAdvices(Map<String, String> params) {
        return this.selectorMapper.indexNewAdvices(params);
    }

    public Map<String, Object> getACPageForPC(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        List<Advice> acs = this.selectorMapper.getArticleCurriculumPageForPC(params);
        result.put("rows", acs);
        result.put("total", this.selectorMapper.getArticleCurriculumPageCountForPC(params));
        return result;
    }

    /*获取新闻详情页*/
    public Advice toAdviceDetails(int id) {
        return this.selectorMapper.toAdviceDetails(id);
    }

    public ArticleCommand getArticleCommand(int cid) {
        return this.selectorMapper.getArticleCommand(cid);
    }

    public int getCommandNumber(int cid) {
        return this.selectorMapper.getCommandNumber(cid);
    }

    /*设置热门所属列表*/
    public List<ArticleCommand> gethotCommandList() {
        return this.selectorMapper.gethotCommandList();
    }


    /*设置热门所属列表对应的评论*/
    public List<ArticleCommand> getCommandNumberOfHot() {
        List<ArticleCommand> commandNumberOfHot = this.selectorMapper.getCommandNumberOfHot();
        return commandNumberOfHot;
    }

    public List<ArticleCommand> getGoodsList(int id, Member member) {
        List<ArticleCommand> commands = this.selectorMapper.getGoodsList(id);
        if (member != null) {
            member = this.selectorMapper.getMemberByUsername(member.getUsername());
        }
        for (ArticleCommand articleCommand : commands) {
            /*验证判断用户是否拥有关注*/
            boolean whetherAttention = true;
            if (member == null) {
                articleCommand.setWhetherAttention(true);
            } else {
                if (CollectionUtils.isEmpty(member.getArticleCommandAttention())) {
                    articleCommand.setWhetherAttention(true);
                } else {
                    for (ArticleCommandAttention articleCommandAttention : member.getArticleCommandAttention()) {
                        if (articleCommandAttention.getCommandid() == articleCommand.getId()) {
                            whetherAttention = false;
                            break;
                        }
                    }
                    articleCommand.setWhetherAttention(whetherAttention);
                }
            }
        }
        return commands;
    }

    /*给所属关注*/
    public synchronized Map<String, Object> attention(String id, Member member) {
        Map<String, Object> result = new HashMap<>();
        boolean whetherAttention = true;
        try {
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登录");
            } else {
                ArticleCommandAttention attention = this.selectorMapper.getArticleCommandByMemberId(id, String.valueOf(member.getId()));
                if (attention != null) {
                    this.selectorMapper.deleteArticleCommandByMemberId(id, String.valueOf(member.getId()));
                    result.put("code", 1);
                    result.put("msg", "您已取消关注");
                } else {
                    this.selectorMapper.addArticleCommandByMemberId(id, String.valueOf(member.getId()));
                    result.put("code", 0);
                    result.put("msg", "您已关注");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }

    public synchronized Map<String, Object> acCollect(String id, Member member) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登录");
                return result;
            }
            id = Des.decrypt(id);
            //查询是否已有收藏
            int collectCount = this.selectorMapper.getMemberACCollect(id, member.getId() + "");
            if (collectCount > 0) {
                result.put("code", -1);
                result.put("msg", "您已有收藏");
                return result;
            }
            this.selectorMapper.acCollect(id, member.getId() + "");
            result.put("code", 0);
            result.put("msg", "已收藏");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "系统异常");
        }
        return result;
    }


}

