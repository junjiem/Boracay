package com.hex.bigdata.udsp.common.dao.base;

import com.hex.bigdata.udsp.common.dao.cache.Cache;
import com.hex.bigdata.udsp.common.model.ComOperationLog;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.MD5Util;
import com.hex.goframe.dao.BaseMapper;
import com.hex.goframe.util.Util;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 异步insert操作和同步select操作的抽象类，DDL操作都记日志但不入库
 *
 * @param <T>
 */
public abstract class AsyncInsertMapper<T> extends BaseMapper implements Runnable {
    private static Logger logger = LogManager.getLogger(AsyncInsertMapper.class);
    private static final FastDateFormat format = FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss.SSS");

    private static final ExecutorService executorService = Executors.newCachedThreadPool(new ThreadFactory() {
        private AtomicInteger id = new AtomicInteger(0);

        @Override
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            thread.setName("async-insert-mapper" + id.addAndGet(1));
            return thread;
        }
    });

    private String clazz = this.getClass().getName();

    private T t;

    @Override
    public void run() {
        insertExe(t);
        insertLog("1", "Class=" + clazz + " Object=" + t.getClass().getName());
    }

    // ----------------------------insert----------------------------------------
    public boolean insert(T t) {
        AsyncInsertMapper<T> mapper = null;
        try {
            //多线程调用，如果不重新创建一个this类型的对象，就可能会出现以下情况：
            //前一个进入synchronized代码块的线程A释放锁，但还未调用 run()中的insertExe(Aobject)时，如果后一个线程B做了setT(Bobject)操作
            //此时线程A调用的insertExe(Bobject)，并发搞则就会插入两条相同的记录到数据库，出现异常
            mapper = this.getClass().newInstance();
            // 将this中的sqlSessionTemplate对象赋值给新对象mapper
            mapper.sqlSessionTemplate = this.sqlSessionTemplate;
            mapper.t = t;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        executorService.execute(mapper);
        return true;
    }

    protected abstract boolean insertExe(T t);

    //------------------------------------select------------------------------------
    public T select(String id) {
        logger.debug("查询 Class=" + clazz + " PkId=" + id);
        return selectExe(id);
    }

    protected abstract T selectExe(String id);

    // --------------------------------------------------------------------------------------
    private void insertLog(String type, String log) {
        try {
            ComOperationLog comOperationLog = new ComOperationLog();
            comOperationLog.setPkId(Util.uuid());
            comOperationLog.setActionType(type);
//            comOperationLog.setActionUser(WebUtil.getCurrentUserName());
//            comOperationLog.setActionUrl(WebUtil.getRequest().getRequestURL().toString());
            comOperationLog.setActionTime(format.format(new Date()));
            comOperationLog.setActionContent(log);
            logger.info(JSONUtil.parseObj2JSON(comOperationLog));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
