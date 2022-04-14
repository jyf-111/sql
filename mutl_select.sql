select student.sno,sum(degree)
from student,sc 
where Ssex='女' and student.Sno=sc.Sno 
group by sno;

select sc.cno,sc.degree 
from sc,student 
where student.sname like '李勇' and student.sno=sc.sno;

select Cno 
from teaching,teacher
where Tname like "李新" and teacher.Tno = teaching.Tno;

select teaching.Cno,Cname
from teacher,teaching,course
where tsex='女' and teacher.Tno = teaching.Tno and course.cno = teaching.cno;

select cname
from student,sc,course
where student.sno=sc.sno and sc.cno=course.cno and Sname like "王%";

select sno,degree
from sc,course
where sc.cno=course.cno and degree between 80 and 90 and cname='数据库' ;

select cno,avg(year(now())-year(student.sbirthday))
from student,sc
where student.sno=sc.sno and sc.cno='C03'
group by cno;

select student.sno,sname
from student,course,sc
where student.sno=sc.sno and sc.cno=course.cno and cname='数据库';

select sno,degree,sc.cno 
from teacher,teaching,sc 
where tname="李新" and teacher.tno=teaching.tno and sc.cno=teaching.cno;

select Sname,sc.sno,degree
from teaching,sc,student
where teaching.cno=sc.cno and Cterm=3 and student.sno=sc.sno;
