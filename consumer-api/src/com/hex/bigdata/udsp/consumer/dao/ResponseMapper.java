package com.hex.bigdata.udsp.consumer.dao;

import com.hex.bigdata.udsp.common.dao.base.SyncCacheMapper;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.MD5Util;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class ResponseMapper extends SyncCacheMapper<Response> {
}
