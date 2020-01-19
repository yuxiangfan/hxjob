package com.hx.hxjob.service;

import com.hx.hxjob.dao.LoginMapper;
import com.hx.hxjob.dao.SystemMapper;
import com.hx.hxjob.enums.KeyEnum;
import com.hx.hxjob.enums.StatusEnum;
import com.hx.hxjob.model.SystemRole;
import com.hx.hxjob.model.SystemUser;
import com.hx.hxjob.util.Des;
import com.hx.hxjob.util.MD5;
import com.hx.hxjob.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.hx.hxjob.service
 * @description:
 * @created: 2020/01/19 09:38
 */
@Service
public class SystemService {
    @Autowired
    private SystemMapper systemMapper;
    @Autowired
    private LoginMapper loginMapper;

    public List<SystemRole> getSystemRole() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("status", StatusEnum.ENABLE.name());
        List<SystemRole> roles = this.systemMapper.getSystemRole(params);
        for (SystemRole role : roles) {
            try {
                role.setDesEntryId(Des.encrypt(role.getId() + ""));
                role.setId(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return roles;
    }

    public List<Map<String, Object>> getSystemResources() {
        return this.systemMapper.getSystemResources();
    }

    public Map<String, Object> rolePage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        List<SystemRole> roles = this.systemMapper.getSystemRole(params);
        for (SystemRole role : roles) {
            try {
                role.setDesEntryId(Des.encrypt(role.getId() + ""));
                role.setId(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        result.put("rows", roles);
        result.put("total", this.systemMapper.getSystemRoleCount(params));
        return result;
    }

    public Map<String, Object> addNewRole(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String ids = (String) params.get("ids");
            if (StringUtils.isEmpty(ids)) {
                result.put("code", -1);
                result.put("msg", "参数异常");
                return result;
            }
            this.systemMapper.addNewRole(params);
            this.systemMapper.addRoleResources(String.valueOf((long) params.get("id")), ids.split(","));
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "操作失败");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    public SystemRole getRoleById(String roleid) {
        try {
            roleid = Des.decrypt(roleid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.systemMapper.getRoleById(roleid);
    }

    @Transactional
    public Map<String, Object> editRole(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String ids = (String) params.get("ids");
            String roleid = (String) params.get("roleid");
            roleid = Des.decrypt(roleid);
            params.put("roleid", roleid);
            if (StringUtils.isEmpty(ids)) {
                result.put("code", -1);
                result.put("msg", "参数异常");
                return result;
            }
            this.systemMapper.editRole(params);
            this.systemMapper.deleteRoleResources(roleid);
            this.systemMapper.addRoleResources(roleid, ids.split(","));
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "操作失败");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    public Map<String, Object> changeRoleStatus(String roleid, String status) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            roleid = Des.decrypt(roleid);
            this.systemMapper.changeStatus(roleid, status);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "操作失败");
        }
        return result;
    }

    public Map<String, Object> accountPage(Map<String, String> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        PageUtil.dealPageParamForLayer(params);
        try {
            params.put("role", Des.decrypt(params.get("role")));
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        List<SystemUser> users = this.systemMapper.getSystemUser(params);
        for (SystemUser user : users) {
            try {
                user.setDesEntryId(Des.encrypt(user.getId() + ""));
                user.setId(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        result.put("rows", users);
        result.put("total", this.systemMapper.getSystemUserCount(params));
        return result;
    }

    public Map<String, Object> addAccount(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result = this.checkAccountParam(params);
            if (0 != (int) result.get("code")) {
                return result;
            }
            SystemUser queryUser = this.loginMapper.getSystemUserByName((String) params.get("username"));
            if (queryUser != null) {
                result.put("code", -1);
                result.put("msg", "该用户名已被使用");
                return result;
            }
            params.put("password", MD5.MD5Encode((String) params.get("password") + KeyEnum.MD5.getKey()));
            this.systemMapper.addAccount(params);
            String role = (String) params.get("role");
            role = Des.decrypt(role);
            this.systemMapper.addAccountRole(String.valueOf((long) params.get("userid")), role);
            result.put("code", 0);
            result.put("msg", "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", -99);
            result.put("msg", "操作失败");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    public Map<String, Object> checkAccountParam(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<String, Object>();

        if (StringUtils.isEmpty((String) params.get("username"))) {
            result.put("code", -1);
            result.put("msg", "用户名未填");
        } else if (StringUtils.isEmpty((String) params.get("password"))) {
            result.put("code", -1);
            result.put("msg", "密码未填");
        } else {
            result.put("code", 0);
            result.put("msg", "OK");
        }

        return result;
    }

}
