use jxgl;
-- 1.向 Student 表中插入记录（'20180203','张静','女','2001-03-21','CS' ,'电子商务'）
insert into student 
values('20180203','张静','女','2001-03-21','CS' ,'电子商务');
-- 2． 插入学号为 ‘20180302’，姓名为'李四'学生信息
insert into student(Sno,Sname) 
values(20180302,'李四');
-- 3． 把男学生记录保存到表 TS 中
create table TS(
    select * 
    from Student
    where Ssex='男'
);
-- 4． 将学号为' 20180202' 的学生姓名改为'张华'，系别改为“CS”，专业改为“多媒体技术”
update student
set sname='张华',sdept='CS',Speciality='多媒体技术'
where sno='20180202';
-- 5． 将 '20180201' 学生选修“C03”号课程的成绩改为该课的平均成绩
update sc ,(
    select avg(degree) as a
    from sc as b
    where cno='C03'
)b
set degree=b.a
where sno='20180202';
-- 6． 把女同学的成绩提高 5%
update sc
set degree = degree*1.05
where sc.sno in (
    select sno
    from student
    where ssex='女'
);
-- 7． （1）把选修了“数据库”课程学生的成绩全改为空值（NULL）

    update sc
    set degree=NULL
    where cno in (select cno from course where cno in (select cno from course where cname='数据库'));
-- （2）将’c01’课程的成绩更新为随机成绩数据，成绩取值范围为0到100之间。
--            Rand():生成0-1随机数
--            Ceiling():向上取整
--           Floor():向下取整
    update sc
    set degree = Ceiling(Rand()*100)
    where cno='C01';
-- 8． 删除学号为 20180302 的学生记录
delete from student where sno='20180302';
-- 9． 把“刘晨”同学的选课记录全部删除
    delete from sc where sno in (select sno from student where sname='刘晨');
-- 10．  删除电子商务专业所有学生的选课记录
delete from sc where sno in (select sno from student where Speciality='电子商务');
