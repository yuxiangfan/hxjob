package com.hx.hxjob.service;

import com.hx.hxjob.dao.SystemUserMapper;
import com.hx.hxjob.enums.StatusEnum;
import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.system.Constant;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description: 登录功能
 * @created: 2020/01/15 12:45
 */
@Service
public class LoginService {
    @Resource
    private SystemUserMapper systemUserMapper;

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
        SystemUser querySystemUser = this.systemUserMapper.getSystemUserByName(systemUser.getUserName().trim());

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
        this.systemUserMapper.updateSystemUserLastLoginTime(querySystemUser.getUserName());

        return result;
    }

    public SystemRole getSystemRoleResources(String userId) {
        return this.systemUserMapper.getRoleResources(userId);
    }


}
