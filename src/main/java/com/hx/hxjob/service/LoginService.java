package com.hx.hxjob.service;

import com.alibaba.fastjson.JSON;
import com.hx.hxjob.dao.LoginMapper;
import com.hx.hxjob.dao.MemberMapper;
import com.hx.hxjob.enums.KeyEnum;
import com.hx.hxjob.enums.StatusEnum;
import com.hx.hxjob.model.*;
import com.hx.hxjob.system.Constant;
import com.hx.hxjob.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description: 登录功能
 * @created: 2020/01/15 12:45
 */
@Service
public class LoginService {

    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private LoginMapper loginMapper;

    public Map<String, Object> systemUserLogining(SystemUser systemUser) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty(systemUser.getUserName())) {
            result.put("code", -1);
            result.put("msg", "用户名未填");
            return result;
        }
        if (StringUtils.isEmpty(systemUser.getPassword())) {
            result.put("code", -1);
            result.put("msg", "密码未填");
            return result;
        }
        SystemUser querySystemUser = this.loginMapper.getSystemUserByName(systemUser.getUserName().trim());

        if (querySystemUser == null) {
            result.put("code", -1);
            result.put("msg", "该用户不存在");
            return result;
        }

        if (querySystemUser.getStatus().equals(StatusEnum.DISABLE.name())) {
            result.put("code", -2);
            result.put("msg", "您的账号已被禁用,请联系管理员");
            return result;
        }

        if (querySystemUser.getStatus().equals(StatusEnum.ABNORMAL.name())) {
            result.put("code", -2);
            result.put("msg", "您的账号存在异常,请联系管理员");
            return result;
        }
        result.put("code", 0);
        result.put("msg", "账号验证通过");

        //修改用户最后登陆时间
        querySystemUser.setLastLogintime(new Date());
        result.put(Constant.SYSTEM_USER, querySystemUser);
        this.loginMapper.updateSystemUserLastLoginTime(querySystemUser.getUserName());

        return result;
    }

    public SystemRole getSystemRoleResources(String userId) {
        return this.loginMapper.getRoleResources(userId);
    }

    /*PC——>获取用户表单*/
    public Member getPersonForm(Member member) {
        return this.memberMapper.getPersonForm(String.valueOf(member.getId()));
    }

    /*PC——>添加大头照*/
    public Map<String, Object> addHeadPhoto(Map<String, String> params, Member member, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            Map<String, Object> datas = JSON.parseObject(params.get("datas"));
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登录");
            }
            this.memberMapper.addHeadPhoto(datas);
            result.put("code", 0);
            result.put("msg", "保存成功");
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

    /*PC——>设置大头照*/
    public Map<String, Object> setHeadPhoto(MultipartFile file, String id, Member member, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        InputStream fileIs = null;
        OutputStream fileOs = null;
        try {
            if (member == null) {
                result.put("code", -9);
                result.put("msg", "用户未登录");
            }
            /*验证图片上传*/
            if (file != null) {
                String filename = file.getOriginalFilename();
                String fileType = filename.substring(filename.lastIndexOf(".") + 1);
                if (!"PNG,JPG,GIF,BMP,JPEG,RWA".contains(fileType.toUpperCase())) {
                    result.put("code", -1);
                    result.put("msg", "logo请上传以下格式(PNG,JPG,GIF,BMP,JPEG,RWA)文件");
                    return result;
                }
                String relativePath = "/headPhoto/" + Constant.sdf_yyyymmdd.format(new Date());
                String fileNewName = System.currentTimeMillis() + "." + fileType;
                /*图片保存路径*/
                String realPath = request.getServletContext().getRealPath("/upload");
                String savePath = realPath + relativePath;
                File fileSavePath = new File(savePath);
                if (!fileSavePath.exists()) {
                    fileSavePath.mkdirs();
                }
                fileIs = file.getInputStream();
                fileOs = new FileOutputStream(new File(savePath + "/" + fileNewName));
                byte[] b = new byte[1024];
                while (fileIs.read(b) > -1) {
                    fileOs.write(b);
                }
                String headPhoto = "/upload" + relativePath + "/" + fileNewName;
                this.memberMapper.setHeadPhoto(headPhoto, id);
            }
            result.put("code", 0);
            result.put("msg", "保存成功");
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

    public Map<String, Object> memberLogin(Map<String, String> params, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = params.get("username");
            String password = params.get("password");
            if (StringUtils.isEmpty(username.trim())) {
                result.put("code", -1);
                result.put("msg", "用户名未填");
                return result;
            } else if (StringUtils.isEmpty(password)) {
                result.put("code", -1);
                result.put("msg", "密码未填");
                return result;
            }
            Member member = this.memberMapper.getMemberByUsername(username);
            if (member == null) {
                result.put("code", -1);
                result.put("msg", "用户不存在");
                return result;
            }
            if (StatusEnum.DISABLE.name().equals(member.getStatus())) {
                result.put("code", -1);
                result.put("msg", "该用户已被禁用");
                return result;
            }
            if (!member.getPassword().equals(MD5.MD5Encode(password + KeyEnum.MD5.getKey()))) {
                member.setPassword(MD5.MD5Encode(password + KeyEnum.MD5.getKey()));
                result.put("code", -1);
                result.put("msg", "密码错误");
                return result;
            }
            /*获取自动登录状态*/
            if (member != null) {
                String autoLogin = params.get("autoLogin");
                /*点击自动登录后*/
                if ("YES".equals(autoLogin)) {
                    Cookie cookie1 = new Cookie("USERNAME", URLEncoder.encode(member.getUsername(), "UTF-8"));
                    Cookie cookie2 = new Cookie("USERPWD", URLEncoder.encode(member.getPassword(), "UTF-8"));
                    cookie1.setMaxAge(24 * 60 * 60);
                    cookie2.setMaxAge(24 * 60 * 60);
                    cookie1.setPath(request.getContextPath());
                    cookie2.setPath(request.getContextPath());
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                }
            }
            this.memberMapper.setLastLogintime(username);
            session.setAttribute(Constant.MEMBER, member);
            result.put("code", 0);
            result.put("msg", "登录成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "登录异常");
        }
        return result;
    }

    public Map<String, Object> memberRegister(Map<String, String> params, HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = params.get("username");
            String password = params.get("password");
            String nickname = params.get("nickname");
            String mobile = params.get("mobile");
            Member member = this.memberMapper.getMemberByUsername(username);
            if (member != null) {
                result.put("code", -1);
                result.put("msg", "用户已存在");
                return result;
            }
            //创建用户
            member = new Member();
            member.setUsername(username);
            member.setPassword(MD5.MD5Encode(password + KeyEnum.MD5.getKey()));
            member.setNickname(nickname);
            member.setMobile(mobile);
            member.setScore(0);
            member.setStatus(StatusEnum.ENABLE.name());
            this.memberMapper.insertMember(member);
            member = this.memberMapper.getMemberByUsername(username);
            /*传入session值*/
            session.setAttribute(Constant.MEMBER, member);
            result.put("code", 0);
            result.put("msg", "注册成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "登录异常");
        }
        return result;
    }

    public Map<String, Object> editPassword(Map<String, String> params, Member member) {
        Map<String, Object> result = new HashMap<>();
        try {
            String oldPasWord = params.get("oldPasWord");
            String newPassWord = params.get("newPassWord");
            String againPassWord = params.get("againPassWord");
            if (StringUtils.isEmpty(oldPasWord) && StringUtils.isEmpty(newPassWord) && StringUtils.isEmpty(againPassWord)) {
                result.put("msg", "请完整输入信息");
                return result;
            }
            if (!MD5.MD5Encode(oldPasWord + KeyEnum.MD5.getKey()).equals(member.getPassword())) {
                result.put("code", -1);
                result.put("msg", "旧密码不正确");
                return result;
            } else if (!newPassWord.equals(againPassWord)) {
                result.put("code", -1);
                result.put("msg", "2次输入的新密码不一致");
                return result;
            }
            member.setPassword(MD5.MD5Encode(newPassWord + KeyEnum.MD5.getKey()));
            this.loginMapper.editPassword(member);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "操作失败");
        }
        return result;
    }

    public List<Position> getCollect(Map<String, String> params, Member member) {
        return this.memberMapper.getCollect(String.valueOf(member.getId()));

    }

    public List<Organization> getCollectOrg(Map<String, String> params, Member member) {
        List<Organization> organizations = memberMapper.getCollectOrg(String.valueOf(member.getId()));
        return organizations;
    }
}
