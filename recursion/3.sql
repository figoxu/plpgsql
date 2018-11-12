-- https://github.com/digoal/blog/blob/master/201801/20180102_04.md
create table a(      
  c1 int,                -- 点1      
  c2 int,                -- 点2      
  prop jsonb,            -- 点1,2对应的边的属性，使用JSON存储，包括权重，关系等等。      
  primary key (c1,c2)    -- 主键      
);      
      
create index idx_a_2 on a(c1, COALESCE(((prop ->> 'weight'::text))::float8, 0)); 

insert into a(c1,c2) values(2,1);
insert into a(c1,c2) values(3,1);
insert into a(c1,c2) values(3,2);
insert into a(c1,c2) values(4,1);
insert into a(c1,c2) values(4,2);
insert into a(c1,c2) values(4,3);
insert into a(c1,c2) values(5,1);
insert into a(c1,c2) values(6,1);
insert into a(c1,c2) values(7,1);
insert into a(c1,c2) values(7,5);
insert into a(c1,c2) values(7,6);
insert into a(c1,c2) values(8,1);
insert into a(c1,c2) values(8,2);
insert into a(c1,c2) values(8,3);
insert into a(c1,c2) values(8,4);
insert into a(c1,c2) values(9,1);
insert into a(c1,c2) values(9,3);
insert into a(c1,c2) values(10,3);
insert into a(c1,c2) values(11,1);
insert into a(c1,c2) values(11,5);
insert into a(c1,c2) values(11,6);
insert into a(c1,c2) values(12,1);
insert into a(c1,c2) values(13,1);
insert into a(c1,c2) values(13,4);
insert into a(c1,c2) values(14,1);
insert into a(c1,c2) values(14,2);
insert into a(c1,c2) values(14,3);
insert into a(c1,c2) values(14,4);
insert into a(c1,c2) values(17,6);
insert into a(c1,c2) values(17,7);
insert into a(c1,c2) values(18,1);
insert into a(c1,c2) values(18,2);
insert into a(c1,c2) values(20,1);
insert into a(c1,c2) values(20,2);
insert into a(c1,c2) values(22,1);
insert into a(c1,c2) values(22,2);
insert into a(c1,c2) values(26,24);
insert into a(c1,c2) values(26,25);
insert into a(c1,c2) values(28,3);
insert into a(c1,c2) values(28,24);
insert into a(c1,c2) values(28,25);
insert into a(c1,c2) values(29,3);
insert into a(c1,c2) values(30,24);
insert into a(c1,c2) values(30,27);
insert into a(c1,c2) values(31,2);
insert into a(c1,c2) values(31,9);
insert into a(c1,c2) values(32,1);
insert into a(c1,c2) values(32,25);
insert into a(c1,c2) values(32,26);
insert into a(c1,c2) values(32,29);
insert into a(c1,c2) values(33,3);
insert into a(c1,c2) values(33,9);
insert into a(c1,c2) values(33,15);
insert into a(c1,c2) values(33,16);
insert into a(c1,c2) values(33,19);
insert into a(c1,c2) values(33,21);
insert into a(c1,c2) values(33,23);
insert into a(c1,c2) values(33,24);
insert into a(c1,c2) values(33,30);
insert into a(c1,c2) values(33,31);
insert into a(c1,c2) values(33,32);
insert into a(c1,c2) values(34,9);
insert into a(c1,c2) values(34,10);
insert into a(c1,c2) values(34,14);
insert into a(c1,c2) values(34,15);
insert into a(c1,c2) values(34,16);
insert into a(c1,c2) values(34,19);
insert into a(c1,c2) values(34,20);
insert into a(c1,c2) values(34,21);
insert into a(c1,c2) values(34,23);
insert into a(c1,c2) values(34,24);
insert into a(c1,c2) values(34,27);
insert into a(c1,c2) values(34,28);
insert into a(c1,c2) values(34,29);
insert into a(c1,c2) values(34,30);
insert into a(c1,c2) values(34,31);
insert into a(c1,c2) values(34,32);
insert into a(c1,c2) values(34,33);

insert into a(c2,c1) values(2,1);
insert into a(c2,c1) values(3,1);
insert into a(c2,c1) values(3,2);
insert into a(c2,c1) values(4,1);
insert into a(c2,c1) values(4,2);
insert into a(c2,c1) values(4,3);
insert into a(c2,c1) values(5,1);
insert into a(c2,c1) values(6,1);
insert into a(c2,c1) values(7,1);
insert into a(c2,c1) values(7,5);
insert into a(c2,c1) values(7,6);
insert into a(c2,c1) values(8,1);
insert into a(c2,c1) values(8,2);
insert into a(c2,c1) values(8,3);
insert into a(c2,c1) values(8,4);
insert into a(c2,c1) values(9,1);
insert into a(c2,c1) values(9,3);
insert into a(c2,c1) values(10,3);
insert into a(c2,c1) values(11,1);
insert into a(c2,c1) values(11,5);
insert into a(c2,c1) values(11,6);
insert into a(c2,c1) values(12,1);
insert into a(c2,c1) values(13,1);
insert into a(c2,c1) values(13,4);
insert into a(c2,c1) values(14,1);
insert into a(c2,c1) values(14,2);
insert into a(c2,c1) values(14,3);
insert into a(c2,c1) values(14,4);
insert into a(c2,c1) values(17,6);
insert into a(c2,c1) values(17,7);
insert into a(c2,c1) values(18,1);
insert into a(c2,c1) values(18,2);
insert into a(c2,c1) values(20,1);
insert into a(c2,c1) values(20,2);
insert into a(c2,c1) values(22,1);
insert into a(c2,c1) values(22,2);
insert into a(c2,c1) values(26,24);
insert into a(c2,c1) values(26,25);
insert into a(c2,c1) values(28,3);
insert into a(c2,c1) values(28,24);
insert into a(c2,c1) values(28,25);
insert into a(c2,c1) values(29,3);
insert into a(c2,c1) values(30,24);
insert into a(c2,c1) values(30,27);
insert into a(c2,c1) values(31,2);
insert into a(c2,c1) values(31,9);
insert into a(c2,c1) values(32,1);
insert into a(c2,c1) values(32,25);
insert into a(c2,c1) values(32,26);
insert into a(c2,c1) values(32,29);
insert into a(c2,c1) values(33,3);
insert into a(c2,c1) values(33,9);
insert into a(c2,c1) values(33,15);
insert into a(c2,c1) values(33,16);
insert into a(c2,c1) values(33,19);
insert into a(c2,c1) values(33,21);
insert into a(c2,c1) values(33,23);
insert into a(c2,c1) values(33,24);
insert into a(c2,c1) values(33,30);
insert into a(c2,c1) values(33,31);
insert into a(c2,c1) values(33,32);
insert into a(c2,c1) values(34,9);
insert into a(c2,c1) values(34,10);
insert into a(c2,c1) values(34,14);
insert into a(c2,c1) values(34,15);
insert into a(c2,c1) values(34,16);
insert into a(c2,c1) values(34,19);
insert into a(c2,c1) values(34,20);
insert into a(c2,c1) values(34,21);
insert into a(c2,c1) values(34,23);
insert into a(c2,c1) values(34,24);
insert into a(c2,c1) values(34,27);
insert into a(c2,c1) values(34,28);
insert into a(c2,c1) values(34,29);
insert into a(c2,c1) values(34,30);
insert into a(c2,c1) values(34,31);
insert into a(c2,c1) values(34,32);
insert into a(c2,c1) values(34,33);


--N度搜索
WITH RECURSIVE search_graph(      
  c1,   -- 点1      
  c2,   -- 点2      
  prop, -- 边的属性      
  depth, -- 深度，从1开始      
  path  -- 路径，数组存储      
) AS (      
        SELECT    -- ROOT节点查询      
          g.c1,   -- 点1      
          g.c2,   -- 点2      
          g.prop,   -- 边的属性      
          1 as depth,        -- 初始深度=1      
          ARRAY[g.c1] as path  -- 初始路径         
        FROM a AS g       
        WHERE       
          c1 = 2         -- ROOT节点=?      <变量>
      UNION ALL      
        SELECT     -- 递归子句      
          g.c1,    -- 点1      
          g.c2,    -- 点2      
          g.prop,          -- 边的属性      
          sg.depth + 1 as depth,    -- 深度+1      
          path || g.c1 as path   -- 路径中加入新的点      
        FROM a AS g, search_graph AS sg   -- 循环 INNER JOIN      
        WHERE       
          g.c1 = sg.c2         -- 递归JOIN条件      
          AND (g.c1 <> ALL(sg.path))        -- 防止循环      
          AND sg.depth <= 2    -- 搜索深度=?          <变量>
)      
SELECT * FROM search_graph where depth=3;    -- 查询递归表，可以加LIMIT输出，也可以使用游标 


WITH RECURSIVE search_graph(      
  c1,   -- 点1      
  c2,   -- 点2      
  prop, -- 边的属性      
  depth, -- 深度，从1开始      
  path  -- 路径，数组存储      
) AS (      
        SELECT    -- ROOT节点查询      
          g.c1,   -- 点1      
          g.c2,   -- 点2      
          g.prop,   -- 边的属性      
          1 as depth,        -- 初始深度=1      
          ARRAY[g.c1] as path  -- 初始路径         
        FROM a AS g       
        WHERE       
          c1 = 2         -- ROOT节点=?       <参数>
      UNION ALL      
        SELECT     -- 递归子句      
          g.c1,    -- 点1      
          g.c2,    -- 点2      
          g.prop,          -- 边的属性      
          sg.depth + 1 as depth,    -- 深度+1      
          path || g.c1 as path   -- 路径中加入新的点      
        FROM a AS g, search_graph AS sg   -- 循环 INNER JOIN      
        WHERE       
          g.c1 = sg.c2         -- 递归JOIN条件      
          AND (g.c1 <> ALL(sg.path))        -- 防止循环      
--          AND sg.depth <= ?    -- 搜索深度=?   也可以保留，防止搜索太深影响性能，比如深入10以后就不返回了        
)      
SELECT * FROM search_graph      
  where c2 = 33   -- 最短路径的终点      <参数>
  limit 1;       -- 查询递归表，可以加LIMIT输出，也可以使用游标     
