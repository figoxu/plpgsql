create table tb(id varchar(3) , pid varchar(3) , name varchar(10)); 

insert into tb values('002' , 0 , '浙江省'); 
insert into tb values('001' , 0 , '广东省'); 
insert into tb values('003' , '002' , '衢州市');  
insert into tb values('004' , '002' , '杭州市') ; 
insert into tb values('005' , '002' , '湖州市');  
insert into tb values('006' , '002' , '嘉兴市') ; 
insert into tb values('007' , '002' , '宁波市');  
insert into tb values('008' , '002' , '绍兴市') ; 
insert into tb values('009' , '002' , '台州市');  
insert into tb values('010' , '002' , '温州市') ; 
insert into tb values('011' , '002' , '丽水市');  
insert into tb values('012' , '002' , '金华市') ; 
insert into tb values('013' , '002' , '舟山市');  
insert into tb values('014' , '004' , '上城区') ; 
insert into tb values('015' , '004' , '下城区');  
insert into tb values('016' , '004' , '拱墅区') ; 
insert into tb values('017' , '004' , '余杭区') ; 
insert into tb values('018' , '011' , '金东区') ; 
insert into tb values('019' , '001' , '广州市') ; 
insert into tb values('020' , '001' , '深圳市') ;

with RECURSIVE cte as
(
select a.id,cast(a.name as varchar(100)) from tb a where id='002'
union all 
select k.id,cast(c.name||'>'||k.name as varchar(100)) as name  from tb k inner join cte c on c.id = k.pid
)select id,name from cte ;