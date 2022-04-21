use jxgl;
-- select * from course;
-- select * from sc;
-- select * from student;
-- select * from teacher;
-- select * from teaching;

-- 1.	查询至少选修两门课程的男学生姓名
select sname
from student
where Ssex='男' and sno in (
    select sno
    from sc
    group by sno
    having count(cno)>=2
);

-- 2.	查询与刘晨同一个系的同学姓名；
select sname
from student
where sname!='刘晨' and sdept = (
    select sdept
    from student
    where sname='刘晨'
);

-- 3.	查询学号比刘晨同学大，而年龄比他小的学生姓名，并写出MySQL中sysdate()和now()函数的功能差别。
select sname
from (
    select * from student where Sbirthday > "2001-06-04"
)
where sname.sno > "20180201";


-- 4.	查询出生日期大于所有男同学出生日期的女同学的姓名及系别
select sname,sdept
from student
where ssex='女' and sbirthday > (
    select max(sbirthday)
    from student
    where ssex='男'
);

-- 5.	查询成绩比该课程平均成绩高的学生的学号、课程号及成绩
select * 
from sc a
where degree > (
    select avg(degree)
    from sc b
    where a.cno=b.cno
);

-- 6.	查询不讲授“C01”课的教师姓名

select tname
from teacher
where not exists(
    select Tno
    from teaching
    where cno = 'C01' and teacher.tno=teaching.tno
);

-- 7.	查询没有选修“C02”课程的学生学号及姓名
select sno,sname
from student
where sno in (
    select sno
    from sc
    where cno<>'C02'
);

-- 8.	查询选修了“数据库”课程的学生学号、姓名及系别
select sno,sname,sdept
from student
where sno in (
    select sno
    from sc,course
    where sc.cno =  course.cno and cname='数据库'
);

-- 9.	查询选修了全部课程的学生姓名


-- 学生 选择 全部课程 = 学生 不存在 没有选的课
-- 没有选的课=课 不存在 已经被选
-- 已经被选的课
select sname
from student
where not exists(
    select cno
    from course
    where not exists(
        select cno
        from sc
        where student.sno = sc.sno and sc.cno = course.cno
    )
);

-- 10.	分别用子查询和连接查询，求“C01”号课程在 80 分以上的学生信息
select *
from student
where sno in (
    select sno
    from sc
    where cno="C01" and degree > 80
);

select *
from student join sc using(sno)
where cno = "C01" and degree > 80;