package com.hex.goframe.service.impl;

import com.hex.bigdata.udsp.common.service.FtpUserManagerService;
import com.hex.goframe.dao.GFOrgMapper;
import com.hex.goframe.dao.GFRoleMapper;
import com.hex.goframe.dao.GFUserMapper;
import com.hex.goframe.dao.GFUserSessionMapper;
import com.hex.goframe.framework.LoginEvent;
import com.hex.goframe.model.*;
import com.hex.goframe.service.BaseService;
import com.hex.goframe.service.GFLogService;
import com.hex.goframe.service.UserService;
import com.hex.goframe.util.DateUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class UserServiceImpl extends BaseService implements ApplicationContextAware, UserService {
    private static Logger logger = LoggerFactory.getLogger (UserServiceImpl.class);
    @Autowired
    private GFUserMapper userMapper;
    @Autowired
    private GFRoleMapper roleMapper;
    @Autowired
    private GFOrgMapper orgMapper;
    @Autowired
    private GFLogService GFLogService;
    @Autowired
    private GFUserSessionMapper userSessionMapper;
    private ApplicationContext applicationContext;

    // ---------------------2018-09-13 by Junjie.M--------------------------
    @Autowired
    private FtpUserManagerService ftpUserManagerService;
    // --------------------- END --------------------------

    public UserServiceImpl() {
    }

    @Override
    public List<GFUser> queryUsers(GFUser user, Page page, String authId) {
        return this.userMapper.queryUsers (user, page, authId);
    }

    @Override
    public List<GFUser> queryUsersInOrg(GFUser user, Page page, String orgId) {
        return this.userMapper.queryUsersInOrg (user, page, orgId);
    }

    @Override
    public boolean addUser(GFUser user) {

        // ---------------------2018-09-13 by Junjie.M--------------------------
        ftpUserManagerService.addConsumerFtpUser (user.getUserId (), user.getPassword ());
        // --------------------- END --------------------------

        int id = (int) this.getNextPrimaryId ("GFUser");
        user.setId (String.valueOf (id));
        user.setEmpId ("1");
        user.setPassword (DigestUtils.md5Hex (user.getPassword ()));
        return this.userMapper.insert (user) == 1;
    }

    @Override
    public boolean addUserHasEmp(GFUser user) {

        // ---------------------2018-09-13 by Junjie.M--------------------------
        ftpUserManagerService.addConsumerFtpUser (user.getUserId (), user.getPassword ());
        // --------------------- END --------------------------

        int id = (int) this.getNextPrimaryId ("GFUser");
        user.setId (String.valueOf (id));
        user.setPassword (DigestUtils.md5Hex (user.getPassword ()));
        return this.userMapper.insert (user) == 1;
    }

    @Override
    public boolean updateUser(GFUser user) {
        return this.userMapper.updateByPrimaryKey (user) == 1;
    }

    @Override
    public boolean updateUserStatus(GFUser gfUser, String s) {
        return false;
    }

    public boolean updateUserStatus(GFUser user, int status) {
        return this.userMapper.updateStatus (user.getId (), status) == 1;
    }

    @Override
    public GFUser getUserById(String id) {
        return this.userMapper.selectByPrimaryKey (id);
    }

    @Override
    public GFUser getUserByUserId(String userId, String appId) {
        return this.userMapper.selectByUserId (userId, appId);
    }

    @Override
    public boolean checkUser(GFUser user) {
        return this.getUserByUserId (user.getUserId (), user.getAppId ()) != null;
    }

    @Override
    @Transactional
    public boolean deleteUsers(GFUser[] users) {
        GFUser[] arr$ = users;
        int len$ = users.length;

        for (int i$ = 0; i$ < len$; ++i$) {
            GFUser user = arr$[i$];

            // ---------------------2018-09-13 by Junjie.M--------------------------
            user = userMapper.selectByPrimaryKey (user.getId ());
            ftpUserManagerService.delConsumerFtpUser (user.getUserId ());
            // --------------------- END --------------------------

            this.userMapper.deleteByPrimaryKey (user.getId ());
        }

        return true;
    }

    @Transactional
    public boolean deleteUsersByEmpId(OrgTreeNode[] nodes) {
        OrgTreeNode[] arr$ = nodes;
        int len$ = nodes.length;

        for (int i$ = 0; i$ < len$; ++i$) {
            OrgTreeNode node = arr$[i$];
            if ("emp".equals (node.getNodeType ())) {

                // ---------------------2018-09-13 by Junjie.M--------------------------
                List<GFUser> list = userMapper.queryUsersByEmpId (node.getNodeId ());
                for (GFUser user : list) {
                    ftpUserManagerService.delConsumerFtpUser (user.getUserId ());
                }
                // --------------------- END --------------------------

                this.userMapper.deleteLoginUserByEmpId (node.getNodeId ());
            }
        }

        return true;
    }

    @Override
    public GFLoginUser login(GFUser user, HttpServletRequest request) {
        GFLoginUser loginUser = this.login (user);
        if (null != loginUser) {
            loginUser.setOrgTree (this.getOrgTree (String.valueOf (loginUser.getOrgid ())));
            if (!StringUtils.hasLength (loginUser.getBranchName ()) && !StringUtils.hasLength (loginUser.getBranchNo ())) {
                GFOrg roles = this.orgMapper.getBranchOrg (String.valueOf (loginUser.getOrgid ()));
                if (roles != null) {
                    loginUser.setBranchName (roles.getOrgname ());
                    loginUser.setBranchNo (String.valueOf (roles.getOrgid ()));
                }
            }

            if (null != request.getSession ()) {
                request.getSession ().invalidate ();
            }

            request.getSession (true).setAttribute ("SESSION_USER", loginUser);
            List roles1 = this.roleMapper.getUserRoles (loginUser.getUserId ());
            request.getSession ().setAttribute ("SESSION_USER_ROLES", this.getUserRoleIds (roles1));
            request.getSession ().setAttribute ("SESSION_ROLES", roles1);
            this.applicationContext.publishEvent (new LoginEvent (this.applicationContext, loginUser));
        }

        return loginUser;
    }

    private String getOrgTree(String orgId) {
        List orgs = this.orgMapper.getOrgTree (orgId);
        if (orgs != null && orgs.size () != 0) {
            StringBuffer orgTree = new StringBuffer ();

            for (int i = orgs.size () - 1; i >= 0; --i) {
                orgTree.append (((GFOrg) orgs.get (i)).getOrgname ());
                if (i != 0) {
                    orgTree.append ("-");
                }
            }

            return orgTree.toString ();
        } else {
            return null;
        }
    }

    private List<String> getUserRoleIds(List<GFRole> roles) {
        if (roles != null && roles.size () != 0) {
            ArrayList roleIds = new ArrayList ();
            Iterator i$ = roles.iterator ();

            while (i$.hasNext ()) {
                GFRole role = (GFRole) i$.next ();
                roleIds.add (role.getRoleid ());
            }

            return roleIds;
        } else {
            return null;
        }
    }

    @Override
    public GFLoginUser login(GFUser user) {
        GFLoginUser guser = this.userMapper.selectFullUserByUserId (user.getUserId (), user.getAppId ());
        if (guser == null) {
            return null;
        } else {
            if (!"1".equals (guser.getOrgType ()) && !"3".equals (guser.getOrgType ())) {
                guser.setMasterOrgId (this.userMapper.getMasterOrgId (user.getAppId (), user.getUserId ()));
            } else {
                guser.setMasterOrgId (String.valueOf (guser.getOrgid ()));
            }

            if (guser != null && "1".equals (guser.getStatus ())) {
                String msg = "登录";
                String passwd = user.getPassword ();
                if (passwd.startsWith ("md5:")) {
                    passwd = passwd.substring ("md5:".length ());
                } else if (passwd.startsWith ("sso:")) {
                    String md5Sso = passwd.substring ("sso:".length ());
                    if (md5Sso.equalsIgnoreCase (DigestUtils.md5Hex (user.getUserId ()))) {
                        passwd = guser.getPassword ();
                        msg = "SSO登录";
                    }
                } else {
                    passwd = DigestUtils.md5Hex (passwd);
                }

                if (StringUtils.hasText (guser.getPassword ()) && guser.getPassword ().equals (passwd)) {
                    this.insertLoginLog (guser, msg);
                    return guser;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        }
    }

    @Override
    public void logout(GFLoginUser user) {
        this.insertLoginLog (user, "注销");
    }

    private void insertLoginLog(GFLoginUser user, String actionType) {
        GFLog log = new GFLog ();
        log.setAppId (user.getAppId ());
        log.setCreateUserId (user.getUserId ());
        log.setActionType (actionType);
        log.setCreateUsername (user.getUserName ());
        this.GFLogService.insert (log);
    }

    @Override
    @Transactional
    public boolean resetPassword(GFUser[] users) {
        GFUser[] arr = users;
        int len = users.length;

        for (int i = 0; i < len; i++) {
            GFUser user = arr[i];

            // ---------------------2018-09-13 by Junjie.M--------------------------
            user = userMapper.selectByPrimaryKey (user.getId ());
            user.setPassword ("000000");
            ftpUserManagerService.delConsumerFtpUser (user.getUserId ());
            ftpUserManagerService.addConsumerFtpUser (user.getUserId (), user.getPassword ());
            // --------------------- END --------------------------

            this.userMapper.resetPassword (user.getId ());
        }

        return true;
    }

    @Override
    public boolean checkPassword(String id, String oldPassword) {
        return this.userMapper.checkPassword (id, oldPassword);
    }

    @Override
    @Transactional
    public boolean changePassword(String id, String newPassword) {
        // ---------------------2018-09-13 by Junjie.M--------------------------
        GFUser user = userMapper.selectByPrimaryKey (id);
        user.setPassword (newPassword);
        ftpUserManagerService.delConsumerFtpUser (user.getUserId ());
        ftpUserManagerService.addConsumerFtpUser (user.getUserId (), user.getPassword ());
        // --------------------- END --------------------------

        return this.userMapper.changePassword (id, newPassword);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    @Override
    public void deleteUserSessionByClientIP(String clientIP) {
        try {
            this.userSessionMapper.deleteByClientIP (clientIP);
        } catch (Exception e) {
            e.printStackTrace ();
            logger.error ("userSessionMapper deleteByClientIP exception[{}]", e.getMessage ());
        }

    }

    @Override
    public MessageResult deleteUserSessionByUserId(String userId) {
        MessageResult messageResult = new MessageResult ();

        try {
            this.userSessionMapper.deleteByPrimaryKey (userId);
            messageResult.setStatus (true);
        } catch (Exception var4) {
            logger.error ("userSessionMapper deleteByPrimaryKey exception", var4);
        }

        return messageResult;
    }

    @Override
    public void addUserSession(String clientIP, String userId) {
        GFUserSession userSession = new GFUserSession ();
        userSession.setClientIp (clientIP);
        userSession.setUserId (userId);
        userSession.setLoginTime (DateUtil.getCurrentTimestamp ());

        try {
            this.userSessionMapper.insert (userSession);
        } catch (Exception e) {
            logger.error ("userSessionMapper insert exception[{}]", e.getMessage ());
        }

    }

    @Override
    public GFUserSession getUserSession(String userId) {
        return this.userSessionMapper.selectByPrimaryKey (userId);
    }

    @Override
    public MessageResult validateUser(String loginUserId, String password) {
        MessageResult messageResult = new MessageResult ();
        if (!StringUtils.isEmpty (loginUserId) && !StringUtils.isEmpty (password)) {
            GFUser user = this.userMapper.selectByUserId (loginUserId, "default");
            if (user == null) {
                return messageResult;
            } else {
                if (DigestUtils.md5Hex (password).equals (user.getPassword ())) {
                    messageResult.setStatus (true);
                }

                return messageResult;
            }
        } else {
            return messageResult;
        }
    }

    @Override
    public List<GFUserLog> queryUserLogs(String s, String s1) {
        return null;
    }

    @Override
    public MessageResult checkNewPassword(String s, String s1) {
        return null;
    }

    @Override
    public MessageResult checkPasswordValidity(String s, int i) {
        return null;
    }

    @Override
    public boolean checkUserLog(String s, String s1) {
        return false;
    }

    @Override
    public MessageResult unlockUser(String s) {
        return null;
    }

    @Override
    public MessageResult stopUse(String s) {
        return null;
    }
}
