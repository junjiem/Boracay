/*
SQLyog Community Edition- MySQL GUI v6.15
MySQL - 5.5.18.1 : Database - edh
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Data for the table `t_gf_application` */

insert  into `t_gf_application`(`APP_CODE`,`APP_NAME`,`APP_COMMENT`,`APP_STATUS`) values ('default','系统管理平台','系统管理平台','1.000000000000000000000000000000');

/*Data for the table `t_gf_auth_right` */

insert  into `t_gf_auth_right`(`ID`,`AUTH_ID`,`USER_ID`,`AUTH_TYPE`,`APP_ID`) values ('1','ADMIN','admin','role','default');

/*Data for the table `t_gf_dict` */

insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('APP_SERVER','serverA','A服务器',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('APP_SERVER','serverB','B服务器',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','10000','10秒',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','15000','15秒',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','2000','2秒',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','30000','30秒',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','5000','5秒',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('AUTO_REFRESH_TIME','60000','60秒',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_CARDTYPE','1','身份证',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_CARDTYPE','2','军官证',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_EMPSTATUS','1','正常',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_EMPSTATUS','2','离职',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_GENDER','1','男',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_GENDER','2','女',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_GENDER','3','未知',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_ORGTYPE','1','总公司',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_ORGTYPE','2','总公司部门',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_ORGTYPE','3','分公司',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_ORGTYPE','4','分公司部门',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_USERSTATUS','1','启用',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_USERSTATUS','2 ','停用',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_YESORNO','1','是',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('COF_YESORNO','2','否',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('EXPE_DIR','1','正向指标',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('EXPE_DIR','2','反向指标',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('GF_STRATEGIC_DIMENSIONS','C','客户',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('GF_STRATEGIC_DIMENSIONS','F','财务',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('GF_STRATEGIC_DIMENSIONS','L','创新发展',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('GF_STRATEGIC_DIMENSIONS','P','内部运营',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_BATCH_JOB_STATUS','BUILDING','正在构建',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_BATCH_JOB_STATUS','BUILD_FAIL','构建失败',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_BATCH_JOB_STATUS','BUILD_SUCCESS','构建成功',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_BATCH_JOB_STATUS','READY_BUILD','准备构建',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hadoop.security.authentication','Hadoop的安全认证方式',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.client.operation.timeout','HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.client.pause','重试的休眠时间（毫秒）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','100');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.client.retries.number','客户端重试最大次数',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.client.scanner.timeout.period','scan操作超时时间（毫秒）',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.master.kerberos.principal','HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM',NULL,'13.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.regionserver.kerberos.principal','HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM',NULL,'14.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.regionserver.lease.period','scan操作超时时间（毫秒）[已被弃用]',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.rpc.timeout','一次RPC请求的超时时间（毫秒）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.security.authentication','HBase的安全认证方式',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.zk.port','HBase的Zookeeper的端口，如：2181',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2181');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','hbase.zk.quorum','HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','kerberos.keytab','Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab',NULL,'16.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','kerberos.principal','Kerberos Principal，如：test@BIGDATA.HEX.COM',NULL,'15.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','zookeeper.recovery.retry','zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HBASE','zookeeper.recovery.retry.intervalmill','zookeeper重试的休眠时间（毫秒）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','200');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','driver.class','Hive 驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.hive.jdbc.HiveDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','jdbc.url','Hive JDBC URL，如：jdbc:hive2://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','password','Hive 密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','username','Hive 用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_HIVE','validation.query.timeout','自动验证连接的时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.hive.jdbc.HiveDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','jdbc.url','JDBC URL，如：无密码jdbc:hive2://${ip}:${port}/${database};auth=noSasl，有密码jdbc:hive2://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','user.information.schema','是否允许获取表、字段注释',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_IMPALA','validation.query.timeout','自动验证连接的时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','auto.commit.enable','如果true,consumer定期地往zookeeper写入每个分区的offset',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','auto.commit.interval.ms','消费者向zookeeper发送offset的时间',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','auto.offset.reset','offset初始化或者达到上线时的处理方式',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','largest');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','metadata.broker.list','Kafka集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9092,10.1.97.2:9092,10.1.97.3:9092',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','rebalance.backoff.ms','平衡补偿重试间隔时间',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','2000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','rebalance.retries.max','rebalance时的最大尝试次数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','zookeeper.connect','zookeeper集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','zookeeper.connection.timeout.ms','客户端连接zookeeper的最大超时时间',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','6000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','zookeeper.session.timeout.ms','连接zookeeper的session超时时间',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA','zookeeper.sync.time.ms','zookeeper同步时间',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','2000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','auto.commit.interval.ms','如果enable.auto.commit=true，消费者向kafka自动提交offsets的频率',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','1000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','auto.offset.reset','在kafka中没有初始的offset或者当前的offset不存在将返回的offset值，latest、earliest',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','latest');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','bootstrap.servers','Kafka集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9092,10.1.97.2:9092,10.1.97.3:9092',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','enable.auto.commit','如果为true消费者会定期在后台提交offset偏移量',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','key.deserializer','Key的反序列化类',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringDeserializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','max.poll.records','在一次调用poll()中返回的最大记录数',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','500');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','sasl.kerberos.service.name','Kerberos服务名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','kafka');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','security.protocol','安全协议',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','SASL_PLAINTEXT');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KAFKA1','value.deserializer','Value的反序列化类',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringDeserializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','boss.count','boss数量（选填，默认为1）',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','default.admin.operation.timeout.ms','用于管理操作的超时时间（毫秒）（选填，默认为30000）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','default.operation.timeout.ms','用于用户操作的超时时间（毫秒）（选填，默认为30000）',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','default.socket.read.timeout.ms','Socket读取的超时时间（毫秒）（选填，默认为10000）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','10000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','disable.statistics','禁用客户端的统计数据集（true/false）（选填，默认为false）',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','kudu.master.hosts','master服务地址（必填，如：10.1.97.1:7051,10.1.97.2:7051）',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_KUDU','worker.count','工作线程的最大数量（选填，默认为2*核数）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','driver.class','mysql 驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','com.mysql.jdbc.Driver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','jdbc.url','mysql JDBC URL，如：jdbc:mysql://${ip}:${port}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','password','mysql 密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','user.information.schema','是否允许获取表、字段注释',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','username','mysql 用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_MYSQL','validation.query.timeout','自动验证连接的时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','driver.class','oracle 驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','oracle.jdbc.OracleDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','jdbc.url','oracle JDBC URL，如：jdbc:oracle:thin:@${ip}:${port}/${model}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','password','oracle 密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','remarks.reporting','是否允许获取表、字段注释',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','username','oracle 用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1 from dual');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_ORACLE','validation.query.timeout','自动验证连接的时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR','solr.servers','Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR','solr.url','Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.client.operation.timeout','HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.client.pause','重试的休眠时间（毫秒）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','100');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.client.retries.number','客户端重试最大次数',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.client.scanner.timeout.period','scan操作超时时间（毫秒）',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.rpc.timeout','一次RPC请求的超时时间（毫秒）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.zk.port','HBase的Zookeeper的端口，如：2181',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2181');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','hbase.zk.quorum','HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','solr.servers','Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983',NULL,'0.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','solr.url','Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','zookeeper.recovery.retry','zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_PROPS_SOLR_HBASE','zookeeper.recovery.retry.intervalmill','zookeeper重试的休眠时间（毫秒）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','200');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','HIVE','HIVE',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','IMPALA','IMPALA',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','KUDU','KUDU',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','MYSQL','MYSQL',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','ORACLE','ORACLE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_BATCH_TYPE','SOLR','SOLR',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_REALTIME_TYPE','KAFKA','KAFKA',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_SOURCE_REALTIME_TYPE','KAFKA1','KAFKA1',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','HBASE','HBASE',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','HIVE','HIVE',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','KUDU','KUDU',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','MYSQL','MYSQL',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','ORACLE','ORACLE',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','SOLR','SOLR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_BATCH_TYPE','SOLR_HBASE','SOLR_HBASE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','HBASE','HBASE',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','KUDU','KUDU',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','MYSQL','MYSQL',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','ORACLE','ORACLE',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','SOLR','SOLR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_REALTIME_TYPE','SOLR_HBASE','SOLR_HBASE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','HBASE','HBASE',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','HIVE','HIVE',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','KUDU','KUDU',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','MYSQL','MYSQL',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','ORACLE','ORACLE',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','SOLR','SOLR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TARGET_TYPE','SOLR_HBASE','SOLR_HBASE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','HBASE','HBASE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','HIVE','HIVE',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','IMPALA','IMPALA',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','KAFKA','KAFKA',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','KAFKA1','KAFKA1',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','KUDU','KUDU',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','MYSQL','MYSQL',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','ORACLE','ORACLE',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','SOLR','SOLR',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_DS_TYPE','SOLR_HBASE','SOLR_HBASE',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','HBASE','com.hex.bigdata.udsp.im.converter.impl.HBaseConverter',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','交互建模的HBase接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','HIVE','com.hex.bigdata.udsp.im.converter.impl.HiveConverter',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','交互建模的Hive接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','IMPALA','com.hex.bigdata.udsp.im.converter.impl.ImpalaConverter',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','交互建模的Impala接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','KAFKA','com.hex.bigdata.udsp.im.converter.impl.KafkaConverter',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','交互建模的Kafka接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','KAFKA1','com.hex.bigdata.udsp.im.converter.impl.Kafka1Converter',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','交互建模的Kafka1接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','KUDU','com.hex.bigdata.udsp.im.converter.impl.KuduConverter',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','交互建模的Kudu接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','MYSQL','com.hex.bigdata.udsp.im.converter.impl.MysqlConverter',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','交互建模的Mysql接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','ORACLE','com.hex.bigdata.udsp.im.converter.impl.OracleConverter',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','交互建模的Oracle接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','SOLR','com.hex.bigdata.udsp.im.converter.impl.SolrConverter',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','交互建模的Solr接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_IMPL_CLASS','SOLR_HBASE','com.hex.bigdata.udsp.im.converter.impl.SolrHBaseConverter',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','交互建模的Solr+HBase接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.compression','HBase 压缩格式',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','snappy');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.family','HBase 族名',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','f');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.fq.data.type','结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.seprator生效',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','dsv');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.fq.dsv.separator','结果数据分隔符，如：|、||、\\007、\\t、\\036',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','\\007');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.method','HBase 方法',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','table_att');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.qualifier','HBase 列名',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','q');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.region.num','HBase Region数量',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_HBASE','hbase.split.policy','HBase 分区策略类',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','org.apache.hadoop.hbase.regionserver.ConstantSizeRegionSplitPolicy');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_KUDU','hash.partitions.buckets','哈希分桶数（预分区开启时生效，且值必须大于等于2）',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_KUDU','pre.partitioning','是否预分桶',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR','solr.max.shards.per.node','Solr 单节点最大分片数',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','2');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR','solr.replicas','Solr 副本数',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR','solr.shards','Solr 分片数（solr.shards*solr.replicas<=solr.max.shards.per.node*节点数）',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.compression','HBase 压缩格式',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','snappy');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.family','HBase 族名',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','f');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.fq.data.type','结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.seprator生效',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','dsv');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.fq.dsv.separator','结果数据分隔符，如：|、||、\\007、\\t、\\036',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','\\007');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.method','HBase 方法',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','table_att');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.qualifier','HBase 列名',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','q');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.region.num','HBase Region数量',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','hbase.split.policy','HBase 分区策略类',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','org.apache.hadoop.hbase.regionserver.ConstantSizeRegionSplitPolicy');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','solr.max.shards.per.node','Solr 单节点最大分片数',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','2');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','solr.replicas','Solr 副本数',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_PROPS_SOLR_HBASE','solr.shards','Solr 分片数（solr.shards*solr.replicas<=solr.max.shards.per.node*节点数）',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_STATUS','1','未建',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_STATUS','2','已建',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_TYPE','0','内表',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MD_TYPE','1','外表',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_BUILD_TYPE','1','增量',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_BUILD_TYPE','2','全量',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_ENGINE_TYPE','HIVE','hive类型数据源',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','!=','不等于',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','<','小于',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','<=','小于等于',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','==','等于',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','>','大于',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','>=','大于等于',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','in','in查询',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','like','模糊匹配',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_FILTER_TYPE','right like','like右查询',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_HIVE','database.name','库名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_HIVE','select.sql','SQL语句',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_HIVE','table.name','表名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_HIVE','violence.query','是否暴力查询（true/false）',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_IMPALA','database.name','库名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_IMPALA','select.sql','SQL语句',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_IMPALA','table.name','表名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_IMPALA','violence.query','是否暴力查询（true/false）',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA','consumer.cron.expression','消费计划任务表达式',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','0/2 * * * * ?');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA','consumer.timeout.ms','消费超时时间（毫秒）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','1000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA','group.id','消费组ID',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA','topic','主题',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA1','consumer.cron.expression','消费计划任务表达式',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','0/10 * * * * ?');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA1','consumer.timeout.ms','消费超时时间（毫秒）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA1','group.id','消费组ID',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KAFKA1','topic','主题',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KUDU','kudu.table.name','Kudu表名称',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_KUDU','violence.query','是否暴力查询（true/false）',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_MYSQL','database.name','库名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_MYSQL','select.sql','SQL语句',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_MYSQL','table.name','表名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_MYSQL','violence.query','是否暴力查询（true/false）',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_ORACLE','database.name','库名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_ORACLE','select.sql','SQL语句',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_ORACLE','table.name','表名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_ORACLE','violence.query','是否暴力查询（true/false）',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_SOLR','solr.collection.name','collection名称',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_PROPS_SOLR','violence.query','是否暴力查询（true/false）',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_STATUS','1','未建',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_STATUS','2','已建',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_TYPE','1','批量',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_TYPE','2','实时',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_UPDATE_TYPE','1','匹配更新',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_UPDATE_TYPE','2','更新插入',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_MODEL_UPDATE_TYPE','3','增量插入',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','READY_START','准备启动',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','READY_STOP','准备停止',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','RUNNING','正在运行',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','RUN_FAIL','运行失败',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','STARTING','开始启动',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','START_FAIL','启动失败',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','STOPING','开始停止',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','STOP_FAIL','停止失败',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IM_REALTIME_JOB_STATUS','STOP_SUCCESS','停止成功',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_ORDER_COL_TYPE','ASC','ASC',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_ORDER_COL_TYPE','DESC','DESC',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','!=','不等于',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','<','小于',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','<=','小于等于',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','==','等于',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','>','大于',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','>=','大于等于',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','in','in查询',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','like','模糊匹配',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_QUERY_COL_OPERATOR','right like','like右查询',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','avg','avg',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','concat','concat',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','count','count',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','max','max',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','min','min',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','none','none',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_APP_RETURN_COL_STATS','sum','sum',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_ELASTICSEARCH','elasticsearch.servers','elasticsearch集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9200,10.1.97.2:9200,10.1.97.3:9200',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_ELASTICSEARCH','max.data.size','最大返回数',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hadoop.security.authentication','Hadoop的安全认证方式',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.client.operation.timeout','HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.client.pause','重试的休眠时间（毫秒）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','100');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.client.retries.number','客户端重试最大次数',NULL,'4.000000000000000000000000000000','IQ_DS_PROPS_HBASE',NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.client.scanner.timeout.period','scan操作超时时间（毫秒）',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.master.kerberos.principal','HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM',NULL,'13.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.regionserver.kerberos.principal','HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM',NULL,'14.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.rpc.timeout','一次RPC请求的超时时间（毫秒）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.security.authentication','HBase的安全认证方式',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.zk.port','HBase的Zookeeper的端口，如：2181',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2181');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','hbase.zk.quorum','HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','kerberos.keytab','Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab',NULL,'16.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','kerberos.principal','Kerberos Principal，如：test@BIGDATA.HEX.COM',NULL,'15.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','max.data.size','最大返回数',NULL,'99.000000000000000000000000000000',NULL,NULL,'default','65536');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','zookeeper.recovery.retry','zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_HBASE','zookeeper.recovery.retry.intervalmill','zookeeper重试的休眠时间（毫秒）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','200');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','max.data.size','redis查询返回数据最大条数',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.connection.ip','redis连接ip地址',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.connection.password','redis连接密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.connection.port','redis连接端口号',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.connection.user','redis连接用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.max.idle','redis连接最大空闲数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','10000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.max.timeOut','redis连接最大超时时间',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.max.total','redis连接池最大连接数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','20000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.max.wait','redis连接最长等待时间',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','1000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.seprator','结果数据分隔符',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','\\007');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_REDIS','redis.test.on.brrow','redis连接是否检查连通性',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR','max.data.size','最大返回数',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR','solr.servers','Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hadoop.security.authentication','Hadoop的安全认证方式',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.client.operation.timeout','HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.client.pause','重试的休眠时间（毫秒）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','100');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.client.retries.number','客户端重试最大次数',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.client.scanner.timeout.period','scan操作超时时间（毫秒）',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.master.kerberos.principal','HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM',NULL,'13.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.regionserver.kerberos.principal','HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM',NULL,'14.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.rpc.timeout','一次RPC请求的超时时间（毫秒）',NULL,'3.000000000000000000000000000000','IQ_DS_PROPS_SOLR_HBASE',NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.security.authentication','HBase的安全认证方式',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','kerberos');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.zk.port','HBase的Zookeeper的端口，如：2181',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','2181');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','hbase.zk.quorum','HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','kerberos.keytab','Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab',NULL,'16.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','kerberos.principal','Kerberos Principal，如：test@BIGDATA.HEX.COM',NULL,'15.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','max.data.size','最大返回数',NULL,'99.000000000000000000000000000000',NULL,NULL,'default','4000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','solr.servers','Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983',NULL,'0.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','zookeeper.recovery.retry','zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_PROPS_SOLR_HBASE','zookeeper.recovery.retry.intervalmill','zookeeper重试的休眠时间（毫秒）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','200');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_TYPE','ELASTICSEARCH','ELASTICSEARCH',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_TYPE','HBASE','HBASE',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_TYPE','REDIS','REDIS',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_TYPE','SOLR','SOLR',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_DS_TYPE','SOLR_HBASE','SOLR_HBASE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_IMPL_CLASS','ELASTICSEARCH','com.hex.bigdata.udsp.iq.provider.impl.ElasticSearchProvider',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','交互查询ElasticSearch接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_IMPL_CLASS','HBASE','com.hex.bigdata.udsp.iq.provider.impl.HBaseProvider',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','交互查询的HBase接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_IMPL_CLASS','REDIS','com.hex.bigdata.udsp.iq.provider.impl.RedisProvider',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','交互查询Redis接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_IMPL_CLASS','SOLR','com.hex.bigdata.udsp.iq.provider.impl.SolrProvider',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','交互查询的Solr接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_IMPL_CLASS','SOLR_HBASE','com.hex.bigdata.udsp.iq.provider.impl.SolrHBaseProvider',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','交互查询的Solr+HBase接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','BIGINT','BIGINT',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','BOOLEAN','BOOLEAN',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','CHAR','CHAR',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','DECIMAL','DECIMAL',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','DOUBLE','DOUBLE',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','FLOAT','FLOAT',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','INT','INT',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','SMALLINT','SMALLINT',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','STRING','STRING',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','TIMESTAMP','TIMESTAMP',NULL,'12.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','TINYINT','TINYINT',NULL,'11.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_DATA_TYPE','VARCHAR','VARCHAR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_TYPE','1','查询字段',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_COL_TYPE','2','返回字段',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_HBASE','hbase.family.name','hbase族名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','f');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_HBASE','hbase.fq.data.type','结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.separator生效',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','dsv');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_HBASE','hbase.fq.dsv.separator','结果数据分隔符，如：|、||、\\007、\\t、\\036',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','\\007');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_HBASE','hbase.qualifier.name','hbase列名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','q');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_SOLR_HBASE','hbase.family.name','hbase族名',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','f');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_SOLR_HBASE','hbase.fq.data.type','结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.separator生效',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','dsv');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_SOLR_HBASE','hbase.fq.dsv.separator','结果数据分隔符，如：|、||、\\007、\\t、\\036',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','\\007');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_SOLR_HBASE','hbase.qualifier.name','hbase列名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','q');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('IQ_MD_PROPS_SOLR_HBASE','solr.primary.key','solr主键字段名',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','id');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('KF_LEVEL','1','一级指标',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('KF_LEVEL','2','二级指标',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('LOGIN_CONF','USE_USERSESSION','0',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_CONSUME_LOG_STATUS','0','成功',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_CONSUME_LOG_STATUS','1','失败',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_OPERATION_LOG_TYPE','1','添加',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_OPERATION_LOG_TYPE','2','更新',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_OPERATION_LOG_TYPE','3','删除',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MC_OPERATION_LOG_TYPE','4','查询',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MM_MODEL_STATUS','0','待上传',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MM_MODEL_STATUS','1','待发布',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MM_MODEL_STATUS','2','已发布',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MM_MODEL_STATUS','3','归档',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('MM_REQUEST_TYPE','1','HTTP',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('NUM_PROP','1','时期值',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('NUM_PROP','2','时点值',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','BIGINT','BIGINT',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','BOOLEAN','BOOLEAN',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','CHAR','CHAR',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','DECIMAL','DECIMAL',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','FLOAT','FLOAT',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','INT','INT',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','SMALLINT','SMALLINT',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','STRING','STRING',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','TIMESTAMP','TIMESTAMP',NULL,'11.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','TINYINT','TINYINT',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OlQ_APP_COL_DATA_TYPE','VARCHAR','VARCHAR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','com.ibm.db2.jcc.DB2Driver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','jdbc.url','JDBC URL，如:jdbc:db2://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1 from sysibm.sysdummy1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_DB2','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.hive.jdbc.HiveDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','jdbc.url','JDBC URL，如：jdbc:hive2://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_HIVE','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.hive.jdbc.HiveDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','jdbc.url','JDBC URL，如：无密码jdbc:hive2://${ip}:${port}/;auth=noSasl  有密码jdbc:hive2://${ip}:${port}/',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_IMPALA','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.hive.jdbc.HiveDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','jdbc.url','JDBC URL，如：jdbc:hive2://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1 from system.dual');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_INCEPTOR','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.kylin.jdbc.Driver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','jdbc.url','JDBC URL，如：	 jdbc:kylin://${ip}:${port}/${database}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_KYLIN','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','com.mysql.jdbc.Driver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','jdbc.url','JDBC URL，如：jdbc:mysql://${ip}:${port}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_MYSQL','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','oracle.jdbc.OracleDriver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','jdbc.url','JDBC URL，如：jdbc:oracle:thin:@${ip}:${port}/${model}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1 from dual');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_ORACLE','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','driver.class','驱动类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.postgresql.Driver');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','initial.size','初始连接数',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','jdbc.url','JDBC URL，如：jdbc:postgresql://${ip}:${port}',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','max.active','最大并发数',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','25');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','max.data.size','最大数据返回条数',NULL,'19.000000000000000000000000000000',NULL,NULL,'default','65535');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','max.idle','最大空闲连接数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','20');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','max.wait','最长等待时间，单位毫秒',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','min.evictable.idle.time.millis','空闲连接N毫秒中后释放',NULL,'13.000000000000000000000000000000',NULL,NULL,'default','1800000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','min.idle','最小空闲连接数',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','password','密码',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','remove.abandoned','是否进行没用连接的回收',NULL,'18.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','remove.abandoned.timeout','回收没用的连接超时时间',NULL,'17.000000000000000000000000000000',NULL,NULL,'default','180000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','test.on.borrow','是否从池中取出链接前进行检验',NULL,'15.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','test.on.return','是否在归还到池中前进行检验',NULL,'16.000000000000000000000000000000',NULL,NULL,'default','false');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','test.while.idle','是否被无效链接销毁器进行检验',NULL,'14.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','time.between.eviction.runs.millis','N毫秒检测一次是否有死掉的线程',NULL,'12.000000000000000000000000000000',NULL,NULL,'default','30000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','username','用户名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','validation.query','验证链接的SQL语句，必须能返回一行及以上数据',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','select 1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_PROPS_PGSQL','validation.query.timeout','验证有效连接的超时时间',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','DB2','DB2',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','HIVE','HIVE',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','IMPALA','IMPALA',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','INCEPTOR','INCEPTOR',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','KYLIN','KYLIN',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','MYSQL','MYSQL',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','ORACLE','ORACLE',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_DS_TYPE','PGSQL','PGSQL',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','DB2','com.hex.bigdata.udsp.olq.provider.impl.Db2Provider',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','联机查询的Db2接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','HIVE','com.hex.bigdata.udsp.olq.provider.impl.HiveProvider',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','联机查询的Hive接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','IMPALA','com.hex.bigdata.udsp.olq.provider.impl.ImpalaProvider',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','联机查询的Impala接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','INCEPTOR','com.hex.bigdata.udsp.olq.provider.impl.InceptorProvider',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','联机查询的Inceptor接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','KYLIN','com.hex.bigdata.udsp.olq.provider.impl.KylinProvider',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','联机查询的Kylin接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','MYSQL','com.hex.bigdata.udsp.olq.provider.impl.MysqlProvider',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','联机查询的Mysql接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','ORACLE','com.hex.bigdata.udsp.olq.provider.impl.OracleProvider',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','联机查询的Oracle接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('OLQ_IMPL_CLASS','PGSQL','com.hex.bigdata.udsp.olq.provider.impl.PgsqlProvider',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','联机查询的Pgsql接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.bcc','密送',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.cc','抄送',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.from','发件人（必填）',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.host','SMTP服务器地址（必填）',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.password','密码',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.port','SMTP服务器端口（必填）',NULL,'2.000000000000000000000000000000','RC_ALARM_PROPS_MAIL',NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.ssl.check.server.identity','是否检查服务的身份',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.subject','主题',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.to','收件人（必填）',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_PROPS_MAIL','mail.smtp.username','用户名',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_TYPE','MAIL','发送邮件',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_ALARM_TYPE','NONE','不告警',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_IMPL_CLASS','MAIL','com.hex.bigdata.udsp.rc.alarm.impl.MailAlarm',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','注册中心的MAIL接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_SERVICE_STATUS','0','启用',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RC_SERVICE_STATUS','1','停用',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','auto.commit.enable','如果true,consumer定期地往zookeeper写入每个分区的offset',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','auto.commit.interval.ms','消费者向zookeeper发送offset的时间',NULL,'8.000000000000000000000000000000',NULL,NULL,'default','60000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','auto.offset.reset','offset初始化或者达到上线时的处理方式',NULL,'11.000000000000000000000000000000',NULL,NULL,'default','largest');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','consumer.timeout.ms','消费者超时时间',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','-1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','group.id','组ID',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','group1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','rebalance.backoff.ms','平衡补偿重试间隔时间',NULL,'10.000000000000000000000000000000',NULL,NULL,'default','2000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','rebalance.retries.max','rebalance时的最大尝试次数',NULL,'9.000000000000000000000000000000',NULL,NULL,'default','10');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','zookeeper.connect','zookeeper集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','zookeeper.connection.timeout.ms','客户端连接zookeeper的最大超时时间',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','6000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','zookeeper.session.timeout.ms','连接zookeeper的session超时时间',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','5000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA','zookeeper.sync.time.ms','zookeeper同步时间',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','2000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','auto.commit.interval.ms','如果enable.auto.commit=true，消费者向kafka自动提交offsets的频率',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','auto.offset.reset','在kafka中没有初始的offset或者当前的offset不存在将返回的offset值，latest、earliest',NULL,'6.000000000000000000000000000000',NULL,NULL,'default','latest');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','enable.auto.commit','如果为true消费者会定期在后台提交offset偏移量',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','true');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','group.id','组ID',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','group1');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','key.deserializer','Key的反序列化类',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringDeserializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','max.poll.records','在一次调用poll()中返回的最大记录数',NULL,'7.000000000000000000000000000000',NULL,NULL,'default','500');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_PROPS_KAFKA1','value.deserializer','Value的反序列化类',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringDeserializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_TIMEOUT','100','100ms',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_TIMEOUT','1000','1000ms',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_TIMEOUT','200','200ms',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_TIMEOUT','2000','2000ms',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_CONSUMER_TIMEOUT','500','500ms',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_PROPS_KAFKA','metadata.broker.list','Kafka集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9092,10.1.97.2:9092,10.1.97.3:9092',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_PROPS_KAFKA1','bootstrap.servers','Kafka集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9092,10.1.97.2:9092,10.1.97.3:9092',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_PROPS_KAFKA1','sasl.kerberos.service.name','Kerberos服务名',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','kafka');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_PROPS_KAFKA1','security.protocol','安全协议',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','SASL_PLAINTEXT');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_TYPE','KAFKA','KAFKA',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_DS_TYPE','KAFKA1','KAFKA1',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_IMPL_CLASS','KAFKA','com.hex.bigdata.udsp.rts.executor.impl.KafkaExecutor',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','实时流的Kafka接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_IMPL_CLASS','KAFKA1','com.hex.bigdata.udsp.rts.executor.impl.Kafka1Executor',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','实时流的Kafka1接口实现类');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA','key.serializer.class','Key的序列化类',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','kafka.serializer.StringEncoder');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA','metadata.broker.list','Kafka集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:9092,10.1.97.2:9092,10.1.97.3:9092',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA','request.required.acks','请求确认模式',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','0');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA','serializer.class','Value的序列化类',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','kafka.serializer.StringEncoder');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA1','acks','请求确认模式，0、1、2、all',NULL,'3.000000000000000000000000000000',NULL,NULL,'default','all');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA1','key.serializer','Key的序列化类',NULL,'1.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringSerializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA1','retries','失败重试次数',NULL,'4.000000000000000000000000000000',NULL,NULL,'default','3');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA1','retry.backoff.ms','失败重试间隔（毫秒）',NULL,'5.000000000000000000000000000000',NULL,NULL,'default','1000');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('RTS_PRODUCER_PROPS_KAFKA1','value.serializer','Value的序列化类',NULL,'2.000000000000000000000000000000',NULL,NULL,'default','org.apache.kafka.common.serialization.StringSerializer');
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('SCHEDULE_TYPE','cron4j','CRON4J',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('SCHEDULE_TYPE','quartz','QUARTZ',NULL,NULL,NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','BIGINT','BIGINT',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','BOOLEAN','BOOLEAN',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','CHAR','CHAR',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','DECIMAL','DECIMAL',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','FLOAT','FLOAT',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','INT','INT',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','SMALLINT','SMALLINT',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','STRING','STRING',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','TIMESTAMP','TIMESTAMP',NULL,'11.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','TINYINT','TINYINT',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_COMMON_DATA_TYPE','VARCHAR','VARCHAR',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000001','权限不足',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000002','用户名密码错误',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000003','运行队列已满',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000004','没有注册服务',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000005','参数解析失败',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000006','请求IP不在允许的IP段内',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000007','程序内部异常',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000008','没有授权服务',NULL,'8.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000009','必输参数为空',NULL,'9.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000010','调用类型或者ENTITY设置错误',NULL,'10.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000011','当前消费id不存在',NULL,'11.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000012','查询消费状态过于频繁',NULL,'12.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000013','调用参数异常',NULL,'13.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000014','等待超时',NULL,'14.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000015','执行超时',NULL,'15.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000016','等待队列已满',NULL,'16.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000017','服务停用',NULL,'17.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000018','运行队列已满且未开启等待队列',NULL,'18.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','000099','其他错误',NULL,'99.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','200001','模型接口无响应',NULL,'200001.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','200002','模型不支持该接口调用类型',NULL,'200002.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','200003','模型参数错误',NULL,'200003.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','200004','模型调用其他异常',NULL,'200004.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_CONSUME_ERROR_CODE','200005','模型不支持该类型',NULL,'200005.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_REQUEST_TYPE','0','内部请求',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_REQUEST_TYPE','1','外部请求',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','IM','交互建模',NULL,'7.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','IQ','交互查询',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','MM','模型管理',NULL,'3.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','OLQ','联机查询',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','OLQ_APP','联机查询应用',NULL,'6.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','RTS_CONSUMER','实时流-消费者',NULL,'5.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SERVICE_TYPE','RTS_PRODUCER','实时流-生产者',NULL,'4.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SYNC_TYPE','ASYNC','异步',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('UDSP_SYNC_TYPE','SYNC','同步',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('YES_OR_NO','0','是',NULL,'1.000000000000000000000000000000',NULL,NULL,'default',NULL);
insert  into `t_gf_dict`(`DICT_TYPE_ID`,`DICT_ID`,`DICT_NAME`,`STATUS`,`SORT_NO`,`PARENT_ID`,`SEQNO`,`APPID`,`FILTER`) values ('YES_OR_NO','1','否',NULL,'2.000000000000000000000000000000',NULL,NULL,'default',NULL);

/*Data for the table `t_gf_dict_type` */

insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('APP_SERVER','应用服务器','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('AUTO_REFRESH_TIME','自动刷新时间','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('COF_CARDTYPE','证件类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('COF_EMPSTATUS','入职状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('DICT_SERVER','字典服务','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_BATCH_JOB_STATUS','交互建模-批量作业状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_HBASE','交互建模-数据源配置-HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_HIVE','交互建模-数据源配置-HIVE参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_IMPALA','交互建模-数据源配置-IMPALA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_KAFKA','交互建模-数据源配置-KAFKA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_KAFKA1','交互建模-数据源配置-KAFKA1','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_KUDU','交互建模-数据源配置-KUDU','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_MYSQL','交互建模-数据源配置-MYSQL','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_ORACLE','交互建模-数据源配置-ORACLE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_SOLR','交互建模-数据源配置-SOLR','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_PROPS_SOLR_HBASE','交互建模-数据源配置-SOLR_HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_SOURCE_BATCH_TYPE','交互建模-数据源类型（源）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_SOURCE_REALTIME_TYPE','交互建模-数据源类型（源、实时）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_TARGET_BATCH_TYPE','交互建模-数据源类型（目标、批量）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_TARGET_REALTIME_TYPE','交互建模-数据源类型（目标、实时）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_TARGET_TYPE','交互建模-数据源类型（目标）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_DS_TYPE','交互建模-数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_IMPL_CLASS','交互建模-接口实现类','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_PROPS_HBASE','交互建模-元数据参数-HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_PROPS_KUDU','交互建模-元数据参数-KUDU','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_PROPS_SOLR','交互建模-元数据参数-SOLR','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_PROPS_SOLR_HBASE','交互建模-元数据参数-SOLR+HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_STATUS','交互建模-元数据状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MD_TYPE','交互建模-元数据类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_BUILD_TYPE','交互建模-构建模型策略','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_ENGINE_TYPE','交互建模-引擎数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_FILTER_TYPE','交互建模-过滤字段操作类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_HIVE','交互建模-模型参数-HIVE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_IMPALA','交互建模-模型参数-IMPALA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_KAFKA','交互建模-模型参数-KAFKA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_KAFKA1','交互建模-模型参数-KAFKA1','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_KUDU','交互建模-模型参数-KUDU','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_MYSQL','交互建模-模型参数-MYSQL','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_ORACLE','交互建模-模型参数-ORACLE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_PROPS_SOLR','交互建模-模型参数-SOLR','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_STATUS','交互建模-交互建模状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_TYPE','交互建模-源数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_MODEL_UPDATE_TYPE','交互建模-更新策略','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IM_REALTIME_JOB_STATUS','交互建模-实时作业状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_APP_ORDER_COL_TYPE','交互查询-应用配置-排序字段-排序类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_APP_QUERY_COL_OPERATOR','交互查询-应用配置-查询字段-操作符','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_APP_RETURN_COL_STATS','交互查询-应用配置-返回字段-统计函数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_PROPS_ELASTICSEARCH','交互查询-数据源配置-ELASTICSEARCH','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_PROPS_HBASE','交互查询-数据源配置-HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_PROPS_REDIS','交互查询redis查询','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_PROPS_SOLR','交互查询-数据源配置-SOLR','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_PROPS_SOLR_HBASE','交互查询-数据源配置-SOLR_HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_DS_TYPE','交互查询-数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_IMPL_CLASS','交互查询-接口实现类','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_MD_COL_DATA_TYPE','交互查询-元数据配置-字段数据类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_MD_COL_TYPE','交互查询-元数据配置-字段信息-所属类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_MD_PROPS_HBASE','交互查询-元数据配置-HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('IQ_MD_PROPS_SOLR_HBASE','交互查询-元数据配置-SOLR+HBASE','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('LOGIN_CONF','登录配置','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('MC_CONSUME_LOG_STATUS','监控中心-消费日志-结果状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('MC_OPERATION_LOG_TYPE','监控中心-操作日志-操作类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('MM_MODEL_STATUS','模型状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('MM_REQUEST_TYPE','模型应用程序请求类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OlQ_APP_COL_DATA_TYPE','联机查应用数据列类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_DB2','联机查询-数据源配置-DB2参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_HIVE','联机查询-数据源配置-HIVE参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_IMPALA','联机查询-数据源配置-IMPALA参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_INCEPTOR','联机查询-数据源配置-INCEPTOR配置','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_KYLIN','联机查询-数据源配置-KYLIN参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_MYSQL','联机查询-数据源配置-MYSQL参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_ORACLE','联机查询-数据源配置-ORACLE参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_PROPS_PGSQL','联机查询-数据源配置-PGSQL参数','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_DS_TYPE','联机查询-数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('OLQ_IMPL_CLASS','联机查询-接口实现类','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RC_ALARM_PROPS_MAIL','注册中心-警报参数-MAIL（电子邮件）','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RC_ALARM_TYPE','注册中心-警报类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RC_IMPL_CLASS','注册中心-接口实现类','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RC_SERVICE_STATUS','注册中心-服务启停状态','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_CONSUMER_PROPS_KAFKA','实时流-消费者配置-KAFKA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_CONSUMER_PROPS_KAFKA1','实时流-消费者配置-KAFKA1','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_CONSUMER_TIMEOUT','消费者消费超时时间','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_DS_PROPS_KAFKA','实时流-数据源配置-KAFKA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_DS_PROPS_KAFKA1','实时流-数据源配置-KAFKA1','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_DS_TYPE','实时流-数据源类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_IMPL_CLASS','实时流-接口实现类','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_PRODUCER_PROPS_KAFKA','实时流-生产者配置-KAFKA','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('RTS_PRODUCER_PROPS_KAFKA1','实时流-生产者配置-KAFKA1','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('SCHEDULE_TYPE','调度类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('UDSP_COMMON_DATA_TYPE','UDSP数据类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('UDSP_CONSUME_ERROR_CODE','UDSP消费接口错误编码','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('UDSP_REQUEST_TYPE','请求类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('UDSP_SERVICE_TYPE','应用类型','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('UDSP_SYNC_TYPE','同步/异步','default');
insert  into `t_gf_dict_type`(`DICT_TYPE_ID`,`DICT_TYPE_NAME`,`APPID`) values ('YES_OR_NO','是或否','default');

/*Data for the table `t_gf_employee` */

insert  into `t_gf_employee`(`EMP_ID`,`JOB_ID`,`USER_NAME`,`SEX`,`BIRTHDAY`,`STATUS`,`CARD_NO`,`CARD_TYPE`,`INDATE`,`OUTDATE`,`OTEL`,`MOBILE_NO`,`HTEL`,`HADDRESS`,`HZIPCODE`,`PEMAIL`,`CREATE_DATE`,`APP_ID`,`ORGID`,`EMP_COMMENT`,`OEMAIL`,`MANAGERID`,`MANAGERNAME`) values ('1','00001','admin','1.000000000000000000000000000000','2014-11-22','1',NULL,'1','2014-11-17',NULL,'111','111111',NULL,NULL,NULL,'admin@grouwith.com','2015-11-28 23:19:20','default','1',NULL,'admin@grouwith.com',NULL,NULL);
insert  into `t_gf_employee`(`EMP_ID`,`JOB_ID`,`USER_NAME`,`SEX`,`BIRTHDAY`,`STATUS`,`CARD_NO`,`CARD_TYPE`,`INDATE`,`OUTDATE`,`OTEL`,`MOBILE_NO`,`HTEL`,`HADDRESS`,`HZIPCODE`,`PEMAIL`,`CREATE_DATE`,`APP_ID`,`ORGID`,`EMP_COMMENT`,`OEMAIL`,`MANAGERID`,`MANAGERNAME`) values ('10011','HJ3B0001','HJ3B0001','3.000000000000000000000000000000',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 16:40:36','default','1',NULL,NULL,NULL,NULL);
insert  into `t_gf_employee`(`EMP_ID`,`JOB_ID`,`USER_NAME`,`SEX`,`BIRTHDAY`,`STATUS`,`CARD_NO`,`CARD_TYPE`,`INDATE`,`OUTDATE`,`OTEL`,`MOBILE_NO`,`HTEL`,`HADDRESS`,`HZIPCODE`,`PEMAIL`,`CREATE_DATE`,`APP_ID`,`ORGID`,`EMP_COMMENT`,`OEMAIL`,`MANAGERID`,`MANAGERNAME`) values ('10021','HJ3B0001','HJ3B0001','1.000000000000000000000000000000',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 16:43:54','default','1',NULL,NULL,NULL,NULL);
insert  into `t_gf_employee`(`EMP_ID`,`JOB_ID`,`USER_NAME`,`SEX`,`BIRTHDAY`,`STATUS`,`CARD_NO`,`CARD_TYPE`,`INDATE`,`OUTDATE`,`OTEL`,`MOBILE_NO`,`HTEL`,`HADDRESS`,`HZIPCODE`,`PEMAIL`,`CREATE_DATE`,`APP_ID`,`ORGID`,`EMP_COMMENT`,`OEMAIL`,`MANAGERID`,`MANAGERNAME`) values ('9011','junjie','junjie','1.000000000000000000000000000000',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-07 21:54:39','default','1',NULL,NULL,NULL,NULL);

/*Data for the table `t_gf_funcation` */

insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('10011','MM.model.list.add','模型管理>模型配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('10021','MM.model.list.edit','模型管理>模型配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('10031','MM.model.list.remove','模型管理>模型配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('1011','RTS.cm.ds.list.add','实时流>配置管理>数据源配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('1021','RTS.cm.ds.list.edit','实时流>配置管理>数据源配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('1031','RTS.cm.ds.list.remove','实时流>配置管理>数据源配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('11011','MM.app.list.add','模型管理>应用配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('11021','MM.app.list.edit','模型管理>应用配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('11031','MM.app.list.remove','模型管理>应用配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('12011','MM.contractor.list.add','模型管理>厂商管理>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('12021','MM.contractor.list.edit','模型管理>厂商管理>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('12031','MM.contractor.list.remove','模型管理>厂商管理>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13011','IQ.cm.md.list.add','交互查询>配置管理>元数据配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13021','IQ.cm.md.list.edit','交互查询>配置管理>元数据配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13031','IQ.cm.md.list.remove','交互查询>配置管理>元数据配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13041','IQ.cm.app.list.add','交互查询>配置管理>应用配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13051','IQ.cm.app.list.edit','交互查询>配置管理>应用配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('13061','IQ.cm.app.list.remove','交互查询>配置管理>应用配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14011','IQ.qm.test.search','交互查询>应用测试>查询',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14031','IQ.qm.test.download','交互查询>应用测试>下载',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14041','IQ.qm.app.search','交互查询>应用实例>查询',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14061','IQ.qm.app.download','交互查询>应用实例>下载',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14071','OLQ.qm.test.search','联机查询>应用测试>查询',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14091','OLQ.qm.test.download','联机查询>应用测试>下载',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14101','OLQ.qm.app.search','联机查询>应用实例>查询',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14121','OLQ.qm.app.download','联机查询>应用实例>下载',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14131','RC.service.list.auth','注册中心>服务注册>授权',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14141','RTS.qm.producer.test','实时流>应用测试>生产者测试',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14151','RTS.qm.consumer.test','实时流>应用测试>消费者测试',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('14161','MM.qm.test.search','模型管理>模型测试>执行',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('15011','OLQ.cm.app.list.add','联机查询>应用配置>新增',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('15021','OLQ.cm.app.list.edit','联机查询>应用配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('15031','OLQ.cm.app.list.remove','联机查询>应用配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('16011','OLQ.qm.testapp.search','联机查询>OLQ应用测试>查询',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('16021','OLQ.qm.testapp.download','联机查询>OLQ应用测试>下载',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('17011','IM.cm.ds.list.add','交互建模>数据源配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('17021','IM.cm.ds.list.edit','交互建模>数据源配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('17031','IM.cm.ds.list.remove','交互建模>数据源配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('17041','IQ.cm.md.link','交互查询>元数据配置>关联目标元数据',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('18011','IM.cm.md.list.add','交互建模>元数据配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('18021','IM.cm.md.list.edit','交互建模>元数据配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('18031','IM.cm.md.list.remove','交互建模>元数据配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('18041','MC.current.list.empty','监控中心>队列监控>运行队列>清空队列',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('18051','MC.wait.list.empty','监控中心>队列监控>等待队列>清空队列',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('19011','IM.cm.model.list.add','交互建模>模型配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('19021','IM.cm.model.list.edit','交互建模>模型配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('19031','IM.cm.model.list.remove','交互建模>模型配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('20011','IM.cm.model.list.create','交互建模>模型配置>创建',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('21011','RC.service.list.start','注册中心>服务注册>启动',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('21021','RC.service.list.stop','注册中心>服务注册>停用',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('31','IQ.cm.ds.list.add','交互查询>配置管理>数据源配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('4021','RTS.cm.md.list.add','实时流>配置管理>元数据配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('4031','RTS.cm.md.list.edit','实时流>配置管理>元数据配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('4041','RTS.cm.md.list.remove','实时流>配置管理>元数据配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('41','IQ.cm.ds.list.edit','交互查询>配置管理>数据源配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5011','RTS.cm.producer.list.add','实时流>配置管理>生产者配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5021','RTS.cm.producer.list.edit','实时流>配置管理>生产者配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5031','RTS.cm.producer.list.remove','实时流>配置管理>生产者配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5041','RTS.cm.consumer.list.add','实时流>配置管理>消费配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5051','RTS.cm.consumer.list.edit','实时流>配置管理>消费者配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('5061','RTS.cm.consumer.list.remove','实时流>配置管理>消费者配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('51','IQ.cm.ds.list.remove','交互查询>配置管理>数据源配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('7011','OLQ.cm.ds.list.add','联机查询>配置管理>数据源配置>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('7021','OLQ.cm.ds.list.edit','联机查询>配置管理>数据源配置>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('7031','OLQ.cm.ds.list.remove','联机查询>配置管理>数据源配置>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('8011','RC.service.list.add','注册中心>用户注册>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('8021','RC.service.list.remove','注册中心>服务注册>删除',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('8031','RC.service.list.edit','注册中心>服务注册>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('9011','RC.userService.list.add','注册中心>用户注册>添加',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('9021','RC.userService.list.edit','注册中心>用户注册>编辑',NULL,NULL,NULL,NULL,'default');
insert  into `t_gf_funcation`(`FUNC_ID`,`FUNC_CODE`,`FUNC_NAME`,`IS_FUNC`,`DISPLAYORDER`,`URL_ACCTION`,`PARENT_FUNC_ID`,`APPID`) values ('9031','RC.userService.listremove','注册中心>用户注册>删除',NULL,NULL,NULL,NULL,'default');

/*Data for the table `t_gf_loginuser` */

insert  into `t_gf_loginuser`(`ID`,`EMP_ID`,`USER_ID`,`USER_NAME`,`PASSWORD`,`STATUS`,`MENU_TYPE`,`CREATE_DATE`,`UPDATE_USERID`,`APP_ID`,`USER_COMMENT`,`VALID_STARTDATE`,`VALID_ENDDATE`,`ERROR_COUNT`) values ('1','1','admin','admin','670b14728ad9902aecba32e22fa4f6bd','1',NULL,'2015-11-28 23:19:20',NULL,'default','4',NULL,NULL,'0.000000000000000000000000000000');

/*Data for the table `t_gf_menu` */

insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100001','交互查询',NULL,'iq.core','2',NULL,'101.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100011','联机查询',NULL,'olq.core','2',NULL,'201.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100021','模型管理',NULL,'mm.core','2',NULL,'301.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100031','实时流',NULL,'rts.core','2',NULL,'401.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100041','IQ配置管理',NULL,'iq.cm','2',NULL,'10.000000000000000000000000000000','default',NULL,'100001',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100051','IQ应用测试',NULL,'iq.qm','1',NULL,'20.000000000000000000000000000000','default','iq.qm.test','100001','fa fa-dashboard');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100061','IQ数据源配置',NULL,'iq.cm.ds','1',NULL,'1.000000000000000000000000000000','default','com.ds.list?model=IQ','100041','fa fa-database');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100071','IQ元数据配置',NULL,'iq.cm.md','1',NULL,'2.000000000000000000000000000000','default','iq.cm.md.list','100041','fa fa-cubes');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100081','OLQ配置管理',NULL,'olq.cm','2',NULL,'10.000000000000000000000000000000','default',NULL,'100011',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100091','OLQ数据源测试',NULL,'olq.qm.ds','1',NULL,'20.000000000000000000000000000000','default','olq.qm.test','100011','fa fa-dashboard');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100101','MM配置管理',NULL,'mm.cm','2',NULL,'10.000000000000000000000000000000','default',NULL,'100021',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100111','MM应用测试',NULL,'mm.qm','1',NULL,'20.000000000000000000000000000000','default','mm.qm.test','100021',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100121','RTS配置管理',NULL,'rts.cm','2',NULL,'10.000000000000000000000000000000','default',NULL,'100031',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100131','RTS应用测试',NULL,'rts.qm','1',NULL,'20.000000000000000000000000000000','default','rts.qm.test','100031','fa fa-dashboard');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100141','MM模型配置',NULL,'mm.cm.model','1',NULL,'2.000000000000000000000000000000','default','mm.cm.model.list','100101','fa fa-cubes');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100151','MM应用配置',NULL,'mm.cm.app','1',NULL,'3.000000000000000000000000000000','default','mm.cm.app.list','100101','fa fa-list');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100161','IQ应用配置',NULL,'iq.cm.app','1',NULL,'3.000000000000000000000000000000','default','iq.cm.app.list','100041','fa fa-list');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100171','OLQ数据源配置',NULL,'olq.cm.ds','1',NULL,'1.000000000000000000000000000000','default','com.ds.list?model=OLQ','100081','fa fa-database');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100181','RTS数据源配置',NULL,'rts.cm.ds','1',NULL,'1.000000000000000000000000000000','default','com.ds.list?model=RTS','100121','fa fa-database');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100191','RTS生产者配置',NULL,'rts.cm.producer','1',NULL,'3.000000000000000000000000000000','default','rts.cm.producer.list','100121','fa fa-sign-in');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100201','RTS消费者配置',NULL,'rts.cm.consumer','1',NULL,'4.000000000000000000000000000000','default','rts.cm.consumer.list','100121','fa fa-sign-out');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100211','注册中心',NULL,'rc.core','2',NULL,'501.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100221','监控中心',NULL,'mc.core','2',NULL,'601.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100231','日志监控',NULL,'mc.log','2',NULL,'10.000000000000000000000000000000','default',NULL,'100221',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100251','统计监控',NULL,'mc.stats','2',NULL,'40.000000000000000000000000000000','default',NULL,'100221',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100261','操作日志',NULL,'mc.log.operation','1',NULL,'1.000000000000000000000000000000','default','mc.log.operation.list','100231','fa fa-file-text-o');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100271','消费日志',NULL,'mc.log.consume','1',NULL,'2.000000000000000000000000000000','default','mc.log.consume.list','100231','fa fa-file-text');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100291','服务注册',NULL,'rc.service','1',NULL,'10.000000000000000000000000000000','default','rc.service.list','100211','fa fa-shield');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100301','服务授权',NULL,'rc.auth','1',NULL,'20.000000000000000000000000000000','default','rc.auth.list','100211','fa fa-key');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('100311','RTS元数据配置',NULL,'rts.cm.md','1',NULL,'2.000000000000000000000000000000','default','rts.cm.md.list','100121','fa fa-cubes');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('101001','任务调度',NULL,'goframe.schedule.list','1',NULL,'80.000000000000000000000000000000','default','goframe.schedule.list','1101','fa fa-tasks');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('101002','功能管理',NULL,'goframe.function.index','1',NULL,'60.000000000000000000000000000000','default','goframe.function.index','1101',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('101011','图表统计',NULL,'mc.stats.charts','1',NULL,'1.000000000000000000000000000000','default','mc.stats.charts','100251','fa fa-bar-chart-o');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('105001','存贷比查询应用',NULL,'cdb_app','1',NULL,'1.000000000000000000000000000000','default','iq.qm.app?name=soa_cdb_solr_hbase_app2','100001',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('106001','MM厂商管理',NULL,'mm.contractor.list','1',NULL,'1.000000000000000000000000000000','default','mm.cm.contractor.list','100101','fa fa-group');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('107001','前置银联明细查询应用',NULL,'cupatrxjnl_app','1',NULL,'2.000000000000000000000000000000','default','iq.qm.app?name=soa_cupatrxjnl_solr_hbase_app','100001',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('108001','Impala大数据开发环境数据库查询',NULL,'tzb_dev_impala','1',NULL,'1.000000000000000000000000000000','default','olq.qm.app?name=tzb_dev_impala','100011',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('109011','角色授权',NULL,'goframe.auth.roleauth','1',NULL,'70.000000000000000000000000000000','default','goframe.auth.role_auth','1101','fa fa-key');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('110001','OLQ应用配置',NULL,'olq.application.config','1',NULL,'20.000000000000000000000000000000','default','olq.cm.app.list','100081','fa fa-list');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1101','后台管理','后台管理','goframe.core','2',NULL,'1001.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1102','用户管理',NULL,'goframe.user.list','1',NULL,'20.000000000000000000000000000000','default','goframe.user.list','1101','glyphicon glyphicon-user');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1103','角色管理',NULL,'goframe.role.index','1',NULL,'30.000000000000000000000000000000','default','goframe.role.index','1101','fa fa-users');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1104','组织机构',NULL,'goframe.org.index','1',NULL,'10.000000000000000000000000000000','default','goframe.org.tree','1101','fa fa-tree');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1105','菜单管理',NULL,'goframe.menu.manage','1',NULL,'40.000000000000000000000000000000','default','goframe.menu.manage','1101','glyphicon glyphicon-menu-hamburger');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('1107','数据字典',NULL,'goframe.dict.index','1',NULL,'50.000000000000000000000000000000','default','goframe.dict.index','1101','fa fa-table');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('111011','OLQ应用测试',NULL,'olq.qm.app','1',NULL,'30.000000000000000000000000000000','default','olq.qm.olqApps','100011','fa fa-dashboard');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('112001','Impala联机查询应用',NULL,'tzb_olq_app','1',NULL,'2.000000000000000000000000000000','default','olq.qm.olqApp?name=olq_app3','100011',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('113001','交互建模',NULL,'im.core','2',NULL,'110.000000000000000000000000000000','default',NULL,'root',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('113011','IM数据源配置',NULL,'im.cm.ds','1',NULL,'1.000000000000000000000000000000','default','com.ds.list?model=IM','113001','fa fa-database');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('113021','IM元数据配置',NULL,'im.cm.md','1',NULL,'2.000000000000000000000000000000','default','im.cm.md.list','113001','fa fa-cubes');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('113031','IM模型配置',NULL,'im.cm.model','1',NULL,'3.000000000000000000000000000000','default','im.cm.model.list','113001','fa fa-list');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('114001','用户维度统计',NULL,'mc.stats.user.userChart','1',NULL,'2.000000000000000000000000000000','default','mc.stats.user.userChart','100251','fa fa-bar-chart-o');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('114011','服务维度统计',NULL,'mc.stats.service.serviceChart','1',NULL,'3.000000000000000000000000000000','default','mc.stats.service.serviceChart','100251','fa fa-bar-chart-o');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115001','作业监控',NULL,'mc.job','2',NULL,'30.000000000000000000000000000000','default',NULL,'100221',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115011','批量作业',NULL,'mc.job.batch','1',NULL,'1.000000000000000000000000000000','default','im.job.batch.list','115001','fa fa-tasks');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115021','实时作业',NULL,'mc.job.realtime','1',NULL,'2.000000000000000000000000000000','default','im.job.realtime.list','115001','fa fa-clock-o');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115031','队列监控',NULL,'mc.queue','2',NULL,'20.000000000000000000000000000000','default',NULL,'100221',NULL);
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115041','运行队列',NULL,'mc.queue.run','1',NULL,'1.000000000000000000000000000000','default','mc.queue.run.list','115031','fa fa-align-justify');
insert  into `t_gf_menu`(`MENUID`,`MENUNAME`,`MENULABEL`,`MENUCODE`,`ISLEAF`,`PARAMETER`,`DISPLAYORDER`,`APP_ID`,`MENU_ACTION`,`PARENTMENUID`,`MENU_ICON`) values ('115051','等待队列',NULL,'mc.queue.wait','1',NULL,'2.000000000000000000000000000000','default','mc.queue.wait.list','115031','fa fa-align-center');

/*Data for the table `t_gf_nextid` */

insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GFAUTHRIGHT','401','2018-09-07 21:56:54');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GFEMPLOYEE','1101','2018-11-20 16:40:36');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GFFuncation','1901','2018-06-04 20:45:24');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GFMENU','11700','2018-01-04 15:04:44');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GFUser','1401','2018-11-20 16:40:36');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('GF_RES_AUTH','15600','2018-10-30 15:05:44');
insert  into `t_gf_nextid`(`SEQ_TYPE`,`NEXT_ID`,`LAST_TIME`) values ('LOG_ID','283600','2018-11-29 14:13:46');

/*Data for the table `t_gf_org` */

insert  into `t_gf_org`(`ORGID`,`ORGNAME`,`ORGCODE`,`ORG_LEVEL`,`ORG_SEQ`,`ORG_TYPE`,`ORG_ADDRESS`,`ZIPCODE`,`LINKMAN`,`LINKTEL`,`CREATE_DATE`,`UPDATE_DATE`,`DISPLAY_ORDER`,`ORG_COMMENT`,`APP_ID`,`PARENT_ORGID`) values ('1','上海致宇','0000','1.000000000000000000000000000000','.1.','undefined','上海',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','0');

/*Data for the table `t_gf_quartz` */

/*Data for the table `t_gf_res_auth` */

insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('141081','OLQ','role','OLQ.qm.test.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149371','ADMIN','role','IM.cm.model.list.create','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149381','ADMIN','role','IM.cm.ds.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149391','ADMIN','role','IM.cm.ds.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149401','ADMIN','role','IM.cm.ds.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149411','ADMIN','role','IM.cm.md.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149421','ADMIN','role','IM.cm.md.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149431','ADMIN','role','IM.cm.md.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149441','ADMIN','role','RC.service.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149451','ADMIN','role','RC.service.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149461','ADMIN','role','RC.service.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149471','ADMIN','role','MM.model.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149481','ADMIN','role','MM.model.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149491','ADMIN','role','MM.model.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149501','ADMIN','role','MM.app.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149511','ADMIN','role','MM.app.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149521','ADMIN','role','MM.app.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149531','ADMIN','role','RC.service.list.auth','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149541','ADMIN','role','OLQ.qm.testapp.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149551','ADMIN','role','OLQ.qm.testapp.download','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149561','ADMIN','role','RC.userService.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149571','ADMIN','role','RC.userService.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149581','ADMIN','role','RC.userService.listremove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149591','ADMIN','role','IQ.cm.md.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149601','ADMIN','role','IQ.cm.md.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149611','ADMIN','role','IQ.cm.md.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149621','ADMIN','role','IQ.cm.app.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149631','ADMIN','role','IQ.cm.app.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149641','ADMIN','role','IQ.cm.app.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149651','ADMIN','role','MM.contractor.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149661','ADMIN','role','MM.contractor.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149671','ADMIN','role','MM.contractor.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149681','ADMIN','role','IQ.qm.test.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149691','ADMIN','role','RTS.qm.producer.test','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149701','ADMIN','role','IQ.qm.test.download','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149711','ADMIN','role','IQ.qm.app.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149721','ADMIN','role','RTS.qm.consumer.test','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149731','ADMIN','role','IQ.qm.app.download','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149741','ADMIN','role','OLQ.qm.test.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149751','ADMIN','role','OLQ.qm.test.download','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149761','ADMIN','role','OLQ.qm.app.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149771','ADMIN','role','OLQ.qm.app.download','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149781','ADMIN','role','RTS.cm.ds.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149791','ADMIN','role','RTS.cm.ds.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149801','ADMIN','role','RTS.cm.ds.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149811','ADMIN','role','RTS.cm.producer.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149821','ADMIN','role','RTS.cm.producer.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149831','ADMIN','role','RTS.cm.producer.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149841','ADMIN','role','RTS.cm.consumer.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149851','ADMIN','role','RTS.cm.consumer.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149861','ADMIN','role','RTS.cm.consumer.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149871','ADMIN','role','IQ.cm.ds.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149881','ADMIN','role','RTS.cm.md.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149891','ADMIN','role','IQ.cm.ds.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149901','ADMIN','role','IQ.cm.ds.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149911','ADMIN','role','RTS.cm.md.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149921','ADMIN','role','RTS.cm.md.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149931','ADMIN','role','OLQ.cm.ds.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149941','ADMIN','role','OLQ.cm.ds.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149951','ADMIN','role','OLQ.cm.ds.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149961','ADMIN','role','MM.qm.test.search','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149971','ADMIN','role','OLQ.cm.app.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149981','ADMIN','role','OLQ.cm.app.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('149991','ADMIN','role','OLQ.cm.app.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150001','ADMIN','role','RC.service.list.start','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150011','ADMIN','role','RC.service.list.stop','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150021','ADMIN','role','IM.cm.model.list.add','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150031','ADMIN','role','IM.cm.model.list.edit','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150041','ADMIN','role','IM.cm.model.list.remove','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150051','ADMIN','role','IQ.cm.md.link','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150061','ADMIN','role','MC.current.list.empty','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('150071','ADMIN','role','MC.wait.list.empty','default','func');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152001','ADMIN','role','100051','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152011','ADMIN','role','100061','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152021','ADMIN','role','100071','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152031','ADMIN','role','100161','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152041','ADMIN','role','113011','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152051','ADMIN','role','113021','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152061','ADMIN','role','113031','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152071','ADMIN','role','100091','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152081','ADMIN','role','111011','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152091','ADMIN','role','100171','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152101','ADMIN','role','110001','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152111','ADMIN','role','100111','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152121','ADMIN','role','106001','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152131','ADMIN','role','100141','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152141','ADMIN','role','100151','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152151','ADMIN','role','100131','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152161','ADMIN','role','100181','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152171','ADMIN','role','100311','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152181','ADMIN','role','100191','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152191','ADMIN','role','100201','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152201','ADMIN','role','100291','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152211','ADMIN','role','100301','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152221','ADMIN','role','100261','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152231','ADMIN','role','100271','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152241','ADMIN','role','115041','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152251','ADMIN','role','115051','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152261','ADMIN','role','115011','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152271','ADMIN','role','115021','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152281','ADMIN','role','101011','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152291','ADMIN','role','114001','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152301','ADMIN','role','114011','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152311','ADMIN','role','1104','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152321','ADMIN','role','1102','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152331','ADMIN','role','1103','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152341','ADMIN','role','1105','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152351','ADMIN','role','1107','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152361','ADMIN','role','101002','default','menu');
insert  into `t_gf_res_auth`(`ID`,`AUTH_ID`,`AUTH_TYPE`,`RES_ID`,`APP_ID`,`RES_TYPE`) values ('152371','ADMIN','role','109011','default','menu');

/*Data for the table `t_gf_role` */

insert  into `t_gf_role`(`ROLEID`,`APP_ID`,`ROLENAME`,`ROLE_DESC`) values ('ADMIN','default','系统管理员',NULL);

-- 添加OLQ的数据源类型
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_TYPE', 'DSL', 'DSL', null, 10, null, null, 'default', null);

-- 添加OLQ的数据源配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('OLQ_DS_PROPS_DSL', '联机查询-数据源配置-DSL参数', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'driver.class', '驱动类', null, 1, null, null, 'default', 'com.hex.bigdata.udsp.jdbc.UdspDriver');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'jdbc.url', 'JDBC URL，如：jdbc:udsp://${ip}:${port}', null, 2, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'username', '用户名', null, 3, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'password', '密码', null, 4, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'initial.size', '初始连接数', null, 5, null, null, 'default', '1');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'min.idle', '最小空闲连接数', null, 6, null, null, 'default', '10');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'max.idle', '最大空闲连接数', null, 7, null, null, 'default', '20');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'max.active', '最大并发数', null, 8, null, null, 'default', '25');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'max.wait', '最长等待时间，单位毫秒', null, 9, null, null, 'default', '60000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'validation.query', '验证链接的SQL语句，必须能返回一行及以上数据', null, 10, null, null, 'default', 'test connection');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'validation.query.timeout', '验证有效连接的超时时间', null, 11, null, null, 'default', '0');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'time.between.eviction.runs.millis', 'N毫秒检测一次是否有死掉的线程', null, 12, null, null, 'default', '600000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'min.evictable.idle.time.millis', '空闲连接N毫秒中后释放', null, 13, null, null, 'default', '1800000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'test.while.idle', '是否被无效链接销毁器进行检验', null, 14, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'test.on.borrow', '是否从池中取出链接前进行检验', null, 15, null, null, 'default', 'false');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'test.on.return', '是否在归还到池中前进行检验', null, 16, null, null, 'default', 'false');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'remove.abandoned.timeout', '回收没用的连接超时时间', null, 17, null, null, 'default', '180000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'remove.abandoned', '是否进行没用连接的回收', null, 18, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'max.data.size', '最大数据返回条数', null, 19, null, null, 'default', '4000');

-- 添加OLQ的接口实现类
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_IMPL_CLASS', 'DSL', 'com.hex.bigdata.udsp.olq.provider.impl.DslProvider', null, 2, null, null, 'default', '联机查询的DSL接口实现类');

insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_ELASTICSEARCH', 'max.data.size.alarm', '超过最大返回数是否告警', null, 3, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_HBASE', 'max.data.size.alarm', '超过最大返回数是否告警', null, 100, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_REDIS', 'max.data.size.alarm', '超过最大返回数是否告警', null, 12, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_SOLR', 'max.data.size.alarm', '超过最大返回数是否告警', null, 3, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_SOLR_HBASE', 'max.data.size.alarm', '超过最大返回数是否告警', null, 100, null, null, 'default', 'true');

insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DB2', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_DSL', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_HIVE', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_IMPALA', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_INCEPTOR', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_KYLIN', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_MYSQL', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_ORACLE', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('OLQ_DS_PROPS_PGSQL', 'max.data.size.alarm', '超过最大返回数是否告警', null, 20, null, null, 'default', 'true');

insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IQ_APP_QUERY_COL_EXPRESSION', '交互查询-应用配置-查询字段-表达式', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_APP_QUERY_COL_EXPRESSION', '${maxValue}', '最大值', null, 1, null, null, 'default', null);

insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_HBASE', 'hbase.family.replication.scope', 'HBase的族的复制范围（0：关闭复制，1：开启复制）', null, 9, null, null, 'default', '1');

-- 添加IM的数据源类型
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TYPE', 'PAIR_HBASE', 'PAIR_HBASE', null, 11, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_TYPE', 'PAIR_HBASE', 'PAIR_HBASE', null, 8, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_BATCH_TYPE', 'PAIR_HBASE', 'PAIR_HBASE', null, 8, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_REALTIME_TYPE', 'PAIR_HBASE', 'PAIR_HBASE', null, 7, null, null, 'default', null);

-- 添加IM的数据源配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_DS_PROPS_PAIR_HBASE', '交互建模-数据源配置-PAIR_HBASE', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'active.hbase.zk.quorum', '【主】HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3', null, 0, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'standby.hbase.zk.quorum', '【备】HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.zk.port', 'HBase的Zookeeper的端口，如：2181', null, 2, null, null, 'default', '2181');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.rpc.timeout', '一次RPC请求的超时时间（毫秒）', null, 3, null, null, 'default', '5000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.client.retries.number', '客户端重试最大次数', null, 4, null, null, 'default', '3');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.client.pause', '重试的休眠时间（毫秒）', null, 5, null, null, 'default', '100');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'zookeeper.recovery.retry', 'zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）', null, 6, null, null, 'default', '3');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'zookeeper.recovery.retry.intervalmill', 'zookeeper重试的休眠时间（毫秒）', null, 7, null, null, 'default', '200');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.client.operation.timeout', 'HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）', null, 8, null, null, 'default', '30000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.regionserver.lease.period', 'scan操作超时时间（毫秒）[已被弃用]', null, 9, null, null, 'default', '60000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.client.scanner.timeout.period', 'scan操作超时时间（毫秒）', null, 10, null, null, 'default', '60000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.security.authentication', 'HBase的安全认证方式', null, 11, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hadoop.security.authentication', 'Hadoop的安全认证方式', null, 12, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.master.kerberos.principal', 'HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM', null, 13, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.regionserver.kerberos.principal', 'HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM', null, 14, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'kerberos.principal', 'Kerberos Principal，如：test@BIGDATA.HEX.COM', null, 15, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'kerberos.keytab', 'Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab', null, 16, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'hbase.rootdir', 'HDFS根目录', null, 10, null, null, 'default', '/hbase');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_HBASE', 'zookeeper.znode.parent', 'ZooKeeper Znode 父级', null, 10, null, null, 'default', '/hbase');

-- 添加IM的（目标）元数据配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_MD_PROPS_PAIR_HBASE', '交互建模-元数据参数-PAIR_HBASE', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.region.num', 'HBase Region数量', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.compression', 'HBase 压缩格式', null, 2, null, null, 'default', 'snappy');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.method', 'HBase 方法', null, 3, null, null, 'default', 'table_att');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.split.policy', 'HBase 分区策略类', null, 4, null, null, 'default', 'org.apache.hadoop.hbase.regionserver.ConstantSizeRegionSplitPolicy');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.family', 'HBase 族名', null, 5, null, null, 'default', 'f');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.qualifier', 'HBase 列名', null, 6, null, null, 'default', 'q');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.fq.data.type', '结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.seprator生效', null, 7, null, null, 'default', 'dsv');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.fq.dsv.separator', '结果数据分隔符，如：|、||、\007、\t、\036', null, 8, null, null, 'default', '\007');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_HBASE', 'hbase.family.replication.scope', 'HBase的族的复制范围（0：关闭复制，1：开启复制）', null, 9, null, null, 'default', '1');

-- 添加IM的接口实现类
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_IMPL_CLASS', 'PAIR_HBASE', 'com.hex.bigdata.udsp.im.converter.impl.PairHBaseConverter', null, 11, null, null, 'default', '交互建模的主备HBase接口实现类');

-- 添加IM的数据源类型
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TYPE', 'PAIR_SOLR', 'PAIR_SOLR', null, 12, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_TYPE', 'PAIR_SOLR', 'PAIR_SOLR', null, 9, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_BATCH_TYPE', 'PAIR_SOLR', 'PAIR_SOLR', null, 9, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_REALTIME_TYPE', 'PAIR_SOLR', 'PAIR_SOLR', null, 8, null, null, 'default', null);

-- 添加IM的数据源配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_DS_PROPS_PAIR_SOLR', '交互建模-数据源配置-PAIR_SOLR', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'active.solr.servers', '【主】Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'active.solr.url', '【主】Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr', null, 2, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'standby.solr.servers', '【备】Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983', null, 3, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'standby.solr.url', '【备】Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr', null, 4, null, null, 'default', null);

-- 添加IM的（目标）元数据配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_MD_PROPS_PAIR_SOLR', '交互建模-元数据参数-PAIR_SOLR', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR', 'solr.shards', 'Solr 分片数（solr.shards*solr.replicas<=solr.max.shards.per.node*节点数）', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR', 'solr.replicas', 'Solr 副本数', null, 2, null, null, 'default', '2');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR', 'solr.max.shards.per.node', 'Solr 单节点最大分片数', null, 3, null, null, 'default', '2');

-- 添加IM的接口实现类
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_IMPL_CLASS', 'PAIR_SOLR', 'com.hex.bigdata.udsp.im.converter.impl.PairSolrConverter', null, 12, null, null, 'default', '交互建模的主备Solr接口实现类');

-- 添加IM的数据源类型
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TYPE', 'PAIR_SOLR_HBASE', 'PAIR_SOLR_HBASE', null, 13, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_TYPE', 'PAIR_SOLR_HBASE', 'PAIR_SOLR_HBASE', null, 10, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_BATCH_TYPE', 'PAIR_SOLR_HBASE', 'PAIR_SOLR_HBASE', null, 10, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_TARGET_REALTIME_TYPE', 'PAIR_SOLR_HBASE', 'PAIR_SOLR_HBASE', null, 9, null, null, 'default', null);

-- 添加IM的数据源配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', '交互建模-数据源配置-PAIR_SOLR_HBASE', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'active.hbase.zk.quorum', '【主】HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'standby.hbase.zk.quorum', '【备】HBase的Zookeeper的集群IP，多个IP用逗号分隔，如：10.1.97.1,10.1.97.2,10.1.97.3', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.zk.port', 'HBase的Zookeeper的端口，如：2181', null, 2, null, null, 'default', '2181');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.rpc.timeout', '一次RPC请求的超时时间（毫秒）', null, 3, null, null, 'default', '5000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.client.retries.number', '客户端重试最大次数', null, 4, null, null, 'default', '3');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.client.pause', '重试的休眠时间（毫秒）', null, 5, null, null, 'default', '100');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'zookeeper.recovery.retry', 'zookeeper的重试次数（zk的重试总次数是：hbase.client.retries.number * zookeeper.recovery.retry）', null, 6, null, null, 'default', '3');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'zookeeper.recovery.retry.intervalmill', 'zookeeper重试的休眠时间（毫秒）', null, 7, null, null, 'default', '200');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.client.operation.timeout', 'HBase客户端发起一次数据操作直至得到响应之间总的超时时间，数据操作类型包括get、append、increment、delete、put等（毫秒）', null, 8, null, null, 'default', '30000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.regionserver.lease.period', 'scan操作超时时间（毫秒）[已被弃用]', null, 9, null, null, 'default', '60000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.client.scanner.timeout.period', 'scan操作超时时间（毫秒）', null, 10, null, null, 'default', '60000');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'active.solr.servers', '【主】Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983', null, 11, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'active.solr.url', '【主】Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr', null, 12, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'standby.solr.servers', '【备】Solr集群的IP和端口地址，多个地址用逗号分隔，如：10.1.97.1:8983,10.1.97.2:8983,10.1.97.3:8983', null, 13, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'standby.solr.url', '【备】Solr的zookeeper地址、端口和目录，多个地址用逗号分隔，如：10.1.97.1:2181,10.1.97.2:2181,10.1.97.3:2181/solr', null, 14, null, null, 'default', null);

-- 添加IM的（目标）元数据配置
insert into T_GF_DICT_TYPE (dict_type_id, dict_type_name, appid)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', '交互建模-元数据参数-PAIR_SOLR+HBASE', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'solr.max.shards.per.node', 'Solr 单节点最大分片数', null, 3, null, null, 'default', '2');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'solr.replicas', 'Solr 副本数', null, 2, null, null, 'default', '2');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'solr.shards', 'Solr 分片数（solr.shards*solr.replicas<=solr.max.shards.per.node*节点数）', null, 1, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.compression', 'HBase 压缩格式', null, 5, null, null, 'default', 'snappy');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.family', 'HBase 族名', null, 8, null, null, 'default', 'f');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.method', 'HBase 方法', null, 6, null, null, 'default', 'table_att');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.qualifier', 'HBase 列名', null, 9, null, null, 'default', 'q');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.region.num', 'HBase Region数量', null, 4, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.split.policy', 'HBase 分区策略类', null, 7, null, null, 'default', 'org.apache.hadoop.hbase.regionserver.ConstantSizeRegionSplitPolicy');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.fq.data.type', '结果数据类型，可选dsv、json，如果为dsv时hbase.fq.dsv.seprator生效', null, 10, null, null, 'default', 'dsv');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.fq.dsv.separator', '结果数据分隔符，如：|、||、\007、\t、\036', null, 11, null, null, 'default', '\007');

-- 添加IM的接口实现类
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_IMPL_CLASS', 'PAIR_SOLR_HBASE', 'com.hex.bigdata.udsp.im.converter.impl.PairSolrHBaseConverter', null, 13, null, null, 'default', '交互建模的主备Solr+HBase接口实现类');


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_SOLR_HBASE', 'hbase.rootdir', 'HDFS根目录', null, 10, null, null, 'default', '/hbase');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_DS_PROPS_SOLR_HBASE', 'zookeeper.znode.parent', 'ZooKeeper Znode 父级', null, 10, null, null, 'default', '/hbase');


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_HBASE', 'hbase.rootdir', 'HDFS根目录', null, 10, null, null, 'default', '/hbase');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_HBASE', 'zookeeper.znode.parent', 'ZooKeeper Znode 父级', null, 10, null, null, 'default', '/hbase');


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'hbase.security.authentication', 'HBase的安全认证方式', null, 11, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'hadoop.security.authentication', 'Hadoop的安全认证方式', null, 12, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'hbase.master.kerberos.principal', 'HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM', null, 13, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'hbase.regionserver.kerberos.principal', 'HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM', null, 14, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'kerberos.principal', 'Kerberos Principal，如：test@BIGDATA.HEX.COM', null, 15, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'kerberos.keytab', 'Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab', null, 16, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'hbase.rootdir', 'HDFS根目录', null, 10, null, null, 'default', '/hbase');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'zookeeper.znode.parent', 'ZooKeeper Znode 父级', null, 10, null, null, 'default', '/hbase');


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.security.authentication', 'HBase的安全认证方式', null, 11, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hadoop.security.authentication', 'Hadoop的安全认证方式', null, 12, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.master.kerberos.principal', 'HBase Master 的 Kerberos Principal，如：hbase/node1@BIGDATA.HEX.COM', null, 13, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'hbase.regionserver.kerberos.principal', 'HBase RegionServer 的 Kerberos Principal，如：hbase/_HOST@BIGDATA.HEX.COM', null, 14, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'kerberos.principal', 'Kerberos Principal，如：test@BIGDATA.HEX.COM', null, 15, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'kerberos.keytab', 'Kerberos Keytab 文件路径，如：C:/kerberos/test.keytab 或 /root/test.keytab', null, 16, null, null, 'default', null);


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR', 'solr.security.authentication', 'Solr的安全认证方式', null, 3, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR', 'solr.java.security.krb5.conf', 'Kerberos的krb5.conf配置文件路径，如：/etc/krb5.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 4, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR', 'solr.java.security.auth.login.config', 'Java验证和授权服务的配置文件路径，如：/root/jaas.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 5, null, null, 'default', null);


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'solr.security.authentication', 'Solr的安全认证方式', null, 53, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'solr.java.security.krb5.conf', 'Kerberos的krb5.conf配置文件路径，如：/etc/krb5.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 54, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_SOLR_HBASE', 'solr.java.security.auth.login.config', 'Java验证和授权服务的配置文件路径，如：/root/jaas.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 55, null, null, 'default', null);


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'solr.security.authentication', 'Solr的安全认证方式', null, 5, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'solr.java.security.krb5.conf', 'Kerberos的krb5.conf配置文件路径，如：/etc/krb5.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 6, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR', 'solr.java.security.auth.login.config', 'Java验证和授权服务的配置文件路径，如：/root/jaas.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 7, null, null, 'default', null);


insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'solr.security.authentication', 'Solr的安全认证方式', null, 55, null, null, 'default', 'kerberos');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'solr.java.security.krb5.conf', 'Kerberos的krb5.conf配置文件路径，如：/etc/krb5.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 56, null, null, 'default', null);
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_DS_PROPS_PAIR_SOLR_HBASE', 'solr.java.security.auth.login.config', 'Java验证和授权服务的配置文件路径，如：/root/jaas.conf（注：引擎所属集群的YARN NodeManager所在节点都需要有该路径文件）', null, 56, null, null, 'default', null);

update T_GF_DICT set dict_id='solr.zkHost' where dict_type_id='IM_DS_PROPS_SOLR' and dict_id='solr.url';
update T_GF_DICT set dict_id='solr.zkHost' where dict_type_id='IM_DS_PROPS_SOLR_HBASE' and dict_id='solr.url';
update T_GF_DICT set dict_id='active.solr.zkHost' where dict_type_id='IM_DS_PROPS_PAIR_SOLR' and dict_id='active.solr.url';
update T_GF_DICT set dict_id='standby.solr.zkHost' where dict_type_id='IM_DS_PROPS_PAIR_SOLR' and dict_id='standby.solr.url';
update T_GF_DICT set dict_id='active.solr.zkHost' where dict_type_id='IM_DS_PROPS_PAIR_SOLR_HBASE' and dict_id='active.solr.url';
update T_GF_DICT set dict_id='standby.solr.zkHost' where dict_type_id='IM_DS_PROPS_PAIR_SOLR_HBASE' and dict_id='standby.solr.url';

insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_SOLR_HBASE', 'hbase.namespace', 'HBase 命名空间', null, 12, null, null, 'default', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IM_MD_PROPS_PAIR_SOLR_HBASE', 'hbase.namespace', 'HBase 命名空间', null, 12, null, null, 'default', 'default');
insert into T_GF_DICT (dict_type_id, dict_id, dict_name, status, sort_no, parent_id, seqno, appid, filter)
values ('IQ_MD_PROPS_SOLR_HBASE', 'hbase.namespace', 'HBase 命名空间', null, 6, null, null, 'default', 'default');

update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_DB2' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_DSL' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_HIVE' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_IMPALA' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_INCEPTOR' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_KYLIN' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_MYSQL' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_ORACLE' and dict_id='remove.abandoned.timeout';
update T_GF_DICT set dict_name='回收没用的连接超时时间，单位秒', filter='180'
where dict_type_id='OLQ_DS_PROPS_PGSQL' and dict_id='remove.abandoned.timeout';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;