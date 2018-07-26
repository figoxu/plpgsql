-- zhparser 是一个支持中文全文检索的 extension，基于Simple Chinese Word Segmentation(SCWS) 上开发的
--安装zhparser
CREATE EXTENSION zhparser;
CREATE TEXT SEARCH CONFIGURATION zhcnsearch (PARSER = zhparser);
ALTER TEXT SEARCH CONFIGURATION zhcnsearch ADD MAPPING FOR n,v,a,i,e,l,j WITH simple;

-- 验证 zhcnsearch
SELECT to_tsvector('zhcnsearch','ruby程序员需要不停地学习新知识，努力提高自己的技术水平。') ;
SELECT to_tsquery('zhcnsearch', '保障房资金压力');

-- 添加自定义分词
-- 未定义分词时,查询分词
﻿select * from to_tsvector('zhcnsearch', '建辉特洛夫司机今天在大帝上岛咖啡点了一瓶无敌神牛奶昔');
--﻿'上':5 '了':9 '司机':3 '咖啡':7 '大帝':4 '奶昔':13 '岛':6 '建辉':1 '无敌':11 '点':8 '特洛夫':2 '瓶':10 '神牛':12
insert into pg_ts_custom_word values ('建辉特洛夫司机');
insert into pg_ts_custom_word values ('大帝上岛咖啡');
insert into pg_ts_custom_word values ('无敌神牛奶昔');

-- 使新的分词生效
select zhprs_sync_dict_xdb();

-- 从新建立连接，在次查询
-- '了':4 '大帝上岛咖啡':2 '建辉特洛夫司机':1 '无敌神牛奶昔':6 '点':3 '瓶':5
SELECT to_tsvector('zhcnsearch', '建辉特洛夫司机今天在大帝上岛咖啡点了一瓶无敌神牛奶昔');

-- 使用tsv索引加速
-- https://help.aliyun.com/knowledge_detail/44451.html?spm=5176.11065259.1996646101.searchclickresult.2e6229e9qnqRzS
-- http://www.infoq.com/cn/news/2015/05/PostgreSQL-Lateral-Max
-- http://www.racksam.com/2016/05/03/chinese-full-text-searching-with-postgresql-zhparser-and-rails/
-- https://www.jianshu.com/p/80e5d003b62c
