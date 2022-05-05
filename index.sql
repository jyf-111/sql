-- 一、建立索引
-- 1、使用CREATE INDEX和ALTER TABLE命令为Student表创建一个名为S_dept的普通索引，以系别排序。
-- 命令如下：
create index S_dept on student(sdept(char(20)));


-- 2、使用ALTER TABLE命令为Student表创建一个名为S_name的普通索引，以姓名排序。
-- 命令如下：

alter table student
add index S_name(Sname);

-- 3、使用SHOW INDEX命令查看Student表的所有索引。
-- 命令如下：
show index from student;


-- 4、为Student表删除S_name索引。
-- 命令如下：

drop index S_name on student;

-- 5、分别使用CREATE UNIQUE INDEX 和ALTER TABLE命令为Student表创建一个名为S_name的唯一索引，以Sname排序。
-- 命令如下：
create unique index S_name on student(sname);
alter table student add unique index S_name(sname);

-- 6、测试select查询花费时间。
SET @d=now(); 
SELECT * FROM Student; 
SELECT timestampdiff(second,@d,now());


10








-- 二、视图的创建与使用 
-- 1、创建一个简单视图view1，查询“电子商务”学生的信息

create view view1 as select * from student where Speciality='电子商务';


-- 2、	创建一个简单视图view2，统计每门课程的选课人数和最高分
-- 命令如下：

create view view2 as 
select count(cno),max(degree) 
from sc 
group by cno;

-- 3、	创建一个复杂视图view3，查询与“张立”同学同一系别的学生信息
-- 命令如下：

create view view3 as
select * 
from student
where sdept in(
select sdept
from student
where Sname='张立');

4、	删除视图View3
命令如下：

drop view view3;

