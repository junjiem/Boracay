package com.hex.goframe.dao;

import com.hex.bigdata.udsp.common.dao.base.SyncMapper;
import com.hex.goframe.model.GFUser;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

// ---------------------2018-09-13 by Junjie.M--------------------------
// GFUserMapper添加缓存功能用到该类
// --------------------- END --------------------------
@Repository
public class GFUserForAppIdAndUserIdMapper extends SyncMapper<GFUser> {

    @Override
    protected boolean insertExe(GFUser record) {
        return true;
    }

    @Override
    protected boolean updateExe(GFUser record) {
        return true;
    }

    @Override
    protected boolean deleteExe(String id) {
        return true;
    }

    @Override
    protected GFUser selectExe(String id) {
        String[] strings = id.split("\\|");
        String appId = strings[0];
        String userId = strings[1];
        HashMap map = new HashMap();
        map.put("appId", appId);
        map.put("userId", userId);
        return (GFUser) this.sqlSessionTemplate.selectOne("com.hex.goframe.dao.GFUserMapper.queryUsers", map);
    }

    @Override
    protected boolean deleteListExe(String id) {
        return false;
    }

    @Override
    protected List<GFUser> selectListExe(String id) {
        return null;
    }

}
